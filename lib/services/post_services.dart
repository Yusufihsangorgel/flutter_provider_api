import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_provider_api/model/post_model.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
Future<PostModel?> getSinglePostData(context) async {
  PostModel result;
  try {
    final response = await http.get(Uri.parse(
      "https://jsonplaceholder.typicode.com/posts/1"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = PostModel.fromJson(item);
       return result;
    } else {
      Toast.show("Data not found", textStyle: context,
          duration: 2, backgroundColor: Colors.redAccent);
          return null;
    }
  } catch (e) {
   log(e.toString());
    return null;
  }
 
}