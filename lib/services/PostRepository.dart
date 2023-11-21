import 'dart:developer';

import 'package:api_crud_app/models/UnicornModel.dart';

import '../models/api_client.dart';

class PostRepository {
  final _apiClient = ApiClient();

  Future<List<UnicornModel>> getPosts() async {
    List<UnicornModel> unicorns = [];
    List<dynamic> postResponse = await _apiClient.get('unicorns');
    for (var post in postResponse) {
      log('Object: $post');
      unicorns.add(UnicornModel.fromJson(post));
    }
    return unicorns;
  }

  Future<UnicornModel> addPost(String name, int age, String colour) async {
    final reponse = await _apiClient.post('unicorns', {
      "name": name,
      "age": age,
      "colour": colour,
    });
    return UnicornModel.fromJson(reponse);
  }

  //below codes are in testing
  Future<void> updatePost(
      String id, String name, int age, String colour) async {
    final response = await _apiClient.put('unicorns/$id', {
      "name": name,
      "age": age,
      "colour": colour,
    });
  }

  Future<void> deletePost(String id) async {
    await _apiClient.delete('unicorns/$id');
  }
}
