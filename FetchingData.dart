
// A simple Dart CLI example that demonstrates fetching JSON data (GET),
// parsing it into Dart objects, and sending JSON data (POST) using dart:io.
//
// Run:
//   dart FetchingData.dart

import 'dart:convert';
import 'dart:io';

/// Simple Post model for JSONPlaceholder example.
class Post {
  final int? id;
  final int userId;
  final String title;
  final String body;

  Post({
    this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'] as int?,
        userId: json['userId'] as int,
        title: json['title'] as String,
        body: json['body'] as String,
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };

  @override
  String toString() =>
      'Post(id: $id, userId: $userId, title: "$title", body: "${body.substring(0, body.length > 30 ? 30 : body.length)}${body.length > 30 ? "..." : ""}")';
}

/// Fetch a single post by id using dart:io HttpClient
Future<Post> fetchPost(int id) async {
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
  final client = HttpClient();
  try {
    final request = await client.getUrl(uri);
    // Optional: set headers, user-agent, etc.
    request.headers.set(HttpHeaders.acceptHeader, 'application/json');
    final response = await request.close().timeout(const Duration(seconds: 10));

    if (response.statusCode == HttpStatus.ok) {
      final body = await response.transform(utf8.decoder).join();
      final jsonMap = json.decode(body) as Map<String, dynamic>;
      return Post.fromJson(jsonMap);
    } else {
      throw HttpException('GET $uri failed, statusCode: ${response.statusCode}');
    }
  } finally {
    client.close();
  }
}

/// Fetch a list of posts using dart:io HttpClient
Future<List<Post>> fetchPosts({int limit = 5}) async {
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final client = HttpClient();
  try {
    final request = await client.getUrl(uri);
    request.headers.set(HttpHeaders.acceptHeader, 'application/json');
    final response = await request.close().timeout(const Duration(seconds: 10));

    if (response.statusCode == HttpStatus.ok) {
      final body = await response.transform(utf8.decoder).join();
      final jsonList = json.decode(body) as List<dynamic>;
      final posts = jsonList.map((e) => Post.fromJson(e as Map<String, dynamic>)).take(limit).toList();
      return posts;
    } else {
      throw HttpException('GET $uri failed, statusCode: ${response.statusCode}');
    }
  } finally {
    client.close();
  }
}

/// Create (POST) a new post and return the created server response as Post.
Future<Post> createPost(Post post) async {
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final client = HttpClient();
  try {
    final request = await client.postUrl(uri);
    request.headers.contentType = ContentType.json;
    request.write(json.encode(post.toJson()));
    final response = await request.close().timeout(const Duration(seconds: 10));

    // JSONPlaceholder returns 201 Created for POST
    if (response.statusCode == HttpStatus.created) {
      final body = await response.transform(utf8.decoder).join();
      final jsonMap = json.decode(body) as Map<String, dynamic>;
      return Post.fromJson(jsonMap);
    } else {
      throw HttpException('POST $uri failed, statusCode: ${response.statusCode}');
    }
  } finally {
    client.close();
  }
}

Future<void> main() async {
  // Example: fetch a single post
  try {
    print('Fetching post #1...');
    final post = await fetchPost(1);
    print('Fetched: $post\n');
  } catch (e) {
    stderr.writeln('Error fetching single post: $e');
  }

  // Example: fetch multiple posts
  try {
    print('Fetching first 3 posts...');
    final posts = await fetchPosts(limit: 3);
    for (var p in posts) {
      print('- $p');
    }
    print('');
  } catch (e) {
    stderr.writeln('Error fetching multiple posts: $e');
  }

  // Example: create a new post
  try {
    print('Creating a new post...');
    final newPost = Post(userId: 42, title: 'Hello, Dart!', body: 'This is a new post sent via dart:io');
    final created = await createPost(newPost);
    print('Created post: $created\n');
  } catch (e) {
    stderr.writeln('Error creating a new post: $e');
  }

  print('Done.');
}