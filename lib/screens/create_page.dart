import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../services/auth_service.dart';
import '../services/rtdb_service.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var isLoading = false;
  var titleController = TextEditingController();
  var contentController = TextEditingController();

  _createPost() {
    String title = titleController.text.trim();
    String body = contentController.text.trim();
    if (title.isEmpty || body.isEmpty) return;

    _apiCreatePost(title, body);
    debugPrint("TITLE:$title,BODY:$body");
  }

  _apiCreatePost(String title, String body) {
    setState(() {
      isLoading = true;
    });
    var post =
        Post(title: title, body: body, userId: AuthService.currentUserId());
    RtdbService.addPost(post).then((value) => {
          debugPrint("TITLE:${post.title},"),
          _resAddPost(),
        });
  }

  _resAddPost() {
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).pop({'data': 'done'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a post"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(hintText: "Title"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(hintText: "Body"),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    _createPost();
                  },
                  color: Colors.blue,
                  child: const Text(
                    "Create",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
