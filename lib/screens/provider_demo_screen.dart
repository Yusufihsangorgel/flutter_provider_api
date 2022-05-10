import 'package:flutter/material.dart';
import 'package:flutter_provider_api/model/post_model.dart';
import 'package:flutter_provider_api/providers/post_data_providers.dart';
import 'package:provider/provider.dart';

class ProviderDemoScreen extends StatefulWidget {
  const ProviderDemoScreen({ Key? key }) : super(key: key);

  @override
  State<ProviderDemoScreen> createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<ProviderDemoScreen> {

@override
  void initState() {
    super.initState();
    final postMdl = Provider.of<PostDataProvider>(context,listen: false);
    postMdl.getPostData(context);
  }


  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<PostDataProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Provider Demo"),),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
     [
      if(postMdl.loading == true) _buildLoading(postMdl),
      if(postMdl.error == true) _buildError(postMdl),
      if(postMdl.loading == false && postMdl.error == false) _buildPost(postMdl),
    ],)
      
    );  
  }



  Widget _buildError(PostDataProvider postMdl) {
    return const Center(child: Text("Data not found"),);
}

Widget _buildLoading(PostDataProvider postMdl) {
  return const Center(child: CircularProgressIndicator(),); }


Widget _buildPost(PostDataProvider postMdl) {
  final postMdl = Provider.of<PostDataProvider>(context);
  return Center(child: Text(postMdl.post!.title,style:
                         const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),);
}
}