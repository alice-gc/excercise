import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import '../models/post.dart';

import '../dio.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PostsState();
  }
}

//make a request
class PostsState extends State<PostsScreen> {
  Future<List<Post>> getPosts() async {
    //make a request
    Dio.Response response = await dio().get(
      'user/posts',
      options: Dio.Options(
        headers: {'auth':true}
      )
      );

//grab a list of posts back from response
    List posts = json.decode(response.toString());

//map throu response and create a model for each resoult from json
    return posts.map((post) => Post.fromJson(post)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: Center(

          //grab future data
          child: FutureBuilder<List<Post>>(
              future: getPosts(),
              builder: (context, snapshot) {
                //once there  is data, list it throu
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var item = snapshot.data![index];
                        return ListTile(
                          title: Text(item.title),
                        );
                      });

                  //if fails to load
                } else if (snapshot.hasError) {

                  log(snapshot.error.toString());

                  return Text('Failed to load');
                }

                //while it loads
                return CircularProgressIndicator();
              })),
    );
  }
}
