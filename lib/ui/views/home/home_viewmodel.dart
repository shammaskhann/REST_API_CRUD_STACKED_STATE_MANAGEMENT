import 'dart:io';
import 'package:api_crud_app/app/app.locator.dart';
import 'package:api_crud_app/models/UnicornModel.dart';
import 'package:api_crud_app/services/PostRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final colourController = TextEditingController();
  final _dialogService = locator<DialogService>();
  PostRepository postRepository = PostRepository();
  List<UnicornModel> unicorns = [];

  void clearText() {
    nameController.clear();
    ageController.clear();
    colourController.clear();
  }

  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('token');
    exit(0);
  }

  getPost() async {
    setBusy(true);
    Future.delayed(const Duration(seconds: 2));
    unicorns = await postRepository.getPosts();
    setBusy(false);
    rebuildUi();
  }

  addPost() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    await postRepository.addPost(nameController.text,
        int.parse(ageController.text), colourController.text);
    await getPost();
    clearText();
    setBusy(false);
    rebuildUi();
  }

  //below code are in testing
  updatePost(String id, String name, int age, String colour) async {
    setBusy(true);
    await postRepository.updatePost(id, name, age, colour);
    await getPost();
    setBusy(false);
  }

  deletePost(String id) async {
    setBusy(true);
    await postRepository.deletePost(id);
    await getPost();
    setBusy(false);
  }
}
