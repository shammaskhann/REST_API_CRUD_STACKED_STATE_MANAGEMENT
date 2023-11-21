import 'dart:convert';
import 'dart:developer';

import 'package:api_crud_app/ui/Utils/utils.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseUrl =
      'https://crudcrud.com/api/75e04015b3d14b398bdbc835be2b1601';
  // static const String baseUrl = 'https://reqres.in/api';
  // static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  Future<List<dynamic>> get(String path) async {
    log('$baseUrl/$path');
    final response = await http.get(Uri.parse('$baseUrl/$path'));
    if (response.statusCode == 200) {
      log(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> body) async {
    log('$baseUrl/$path');
    final response = await http.post(Uri.parse('$baseUrl/$path'),
        body: jsonEncode(body), headers: {"Content-Type": "application/json"});
    if (response.statusCode == 201) {
      log('Successfully Added => ${response.body}');
      return jsonDecode(response.body);
    } else {
      log('Failed to add => ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }

  //both below are in  testing
  Future<void> put(String path, Map<String, dynamic> body) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$path'),
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      log('Successfully Updated => ${response.body}');
      //return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update data');
    }
  }

  Future<dynamic> delete(String path) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$path'),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      log('Successfully Deleted => ${response.body}');
    } else {
      throw Exception('Failed to delete data');
    }
  }
}
