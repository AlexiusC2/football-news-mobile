// To parse this JSON data, do
//
//     final newsEntry = newsEntryFromJson(jsonString);

import 'dart:convert';

NewsEntry newsEntryFromJson(String str) => NewsEntry.fromJson(json.decode(str));

String newsEntryToJson(NewsEntry data) => json.encode(data.toJson());

class NewsEntry {
    String id;
    String title;
    String content;
    String category;
    String thumbnail;
    int newsViews;
    DateTime createdAt;
    bool isFeatured;
    int userId;
    String userUsername;

    NewsEntry({
        required this.id,
        required this.title,
        required this.content,
        required this.category,
        required this.thumbnail,
        required this.newsViews,
        required this.createdAt,
        required this.isFeatured,
        required this.userId,
        required this.userUsername,
    });

    factory NewsEntry.fromJson(Map<String, dynamic> json) => NewsEntry(
        id: json["id"].toString(),
        title: (json["title"] ?? '') as String,
        content: (json["content"] ?? '') as String,
        category: (json["category"] ?? '') as String,
        thumbnail: (json["thumbnail"] ?? '') as String,
        newsViews: json["news_views"] is int
            ? json["news_views"] as int
            : int.tryParse(json["news_views"]?.toString() ?? '0') ?? 0,
        createdAt: DateTime.tryParse(json["created_at"]?.toString() ?? '') ?? DateTime.now(),
        isFeatured: json["is_featured"] == true ||
            json["is_featured"] == 1 ||
            json["is_featured"]?.toString().toLowerCase() == 'true',
        userId: json["user_id"] is int
            ? json["user_id"] as int
            : int.tryParse(json["user_id"]?.toString() ?? '0') ?? 0,
        userUsername: (json["user_username"] ?? '') as String,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "category": category,
        "thumbnail": thumbnail,
        "news_views": newsViews,
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
        "user_id": userId,
        "user_username": userUsername,
    };
}
