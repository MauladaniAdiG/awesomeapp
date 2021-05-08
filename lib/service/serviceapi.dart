import 'dart:convert';

import 'package:app/models/pojo/photos.dart';
import 'package:app/models/pojo/photoscount.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  final baseUrl = 'https://api.pexels.com/v1';
  final String token =
      '563492ad6f91700001000001597e6caf1e7e42e4a90a81fe8e55ba80';

  Future? getPhotos(int page, int perPage, String nextUrl) async {
    http.Response response = await http.get(
        Uri.parse(nextUrl.isNotEmpty
            ? '$nextUrl'
            : '$baseUrl/curated?page=$page&per_page=$perPage'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      return PhotosCount.fromJson(json.decode(response.body));
    } else if (response.statusCode == 429) {
      return null;
    } else {
      return null;
    }
  }

  Future? getDetailPhotos(int id) async {
    http.Response response = await http.get(Uri.parse('$baseUrl/photos/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      return Photos.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
