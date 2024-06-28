import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_advance/model/notes_model.dart';
import 'package:flutter_advance/screens/fc_service.dart';

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
  var nameController = TextEditingController();
  var contentController = TextEditingController();
  var dateController = TextEditingController();
  var lastnameController = TextEditingController();

  _createPost() {
    String name = nameController.text.trim();
    String content = contentController.text.trim();
    String lastName = lastnameController.text.trim();
    String date = dateController.text.trim();
    if (name.isEmpty || content.isEmpty || lastName.isEmpty || date.isEmpty) {
      return;
    }

    _apiCreatePost(name, lastName, content, date);
    debugPrint("TITLE:$name,BODY:$lastName, Content:$date");
  }

  _apiCreatePost(String name, String lastName, String content, String data) {
    setState(() {
      isLoading = true;
    });
    var notes = NotesModel(
      name: name,
      lastName: lastName,
      date: data,
      content: content,
    );
    FCService.create(dbPaht: 'posts', data: notes.toJson()).then((value) => {
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
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "Name"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: lastnameController,
                  decoration: const InputDecoration(hintText: "LastName"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: dateController,
                  decoration: const InputDecoration(hintText: "Date"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(hintText: "Content"),
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
