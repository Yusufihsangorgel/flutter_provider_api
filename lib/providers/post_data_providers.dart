import 'package:flutter/material.dart';
import 'package:flutter_provider_api/model/post_model.dart';
import 'package:flutter_provider_api/services/post_services.dart';

class PostDataProvider with ChangeNotifier {
  PostModel? post;
  bool loading = false;
  bool error = false;

  getPostData(context) async {
    try {
      loading = true;
    post = await getSinglePostData(context);
    loading = false;
    debugPrint("success");
    notifyListeners();
    } catch (e) {
      error = true;
      debugPrint(e.toString());
    }
  }



}