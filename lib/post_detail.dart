import 'package:flutter/material.dart';
import 'package:flutterhttp/http_service.dart';
import 'post_model.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  final HttpService httpService = HttpService();

  PostDetail({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () async {
          debugPrint("Deleting...");
          await httpService.deletePost(post.id);
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Title'),
                  subtitle: Text(post.title),
                ),
                ListTile(
                  title: Text('ID'),
                  subtitle: Text(post.id.toString()),
                ),
                ListTile(
                  title: Text('Body'),
                  subtitle: Text(post.body),
                ),
                ListTile(
                  title: Text('User ID'),
                  subtitle: Text(post.userId.toString()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
