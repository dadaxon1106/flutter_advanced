import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/model/notes_model.dart';
import 'package:flutter_advance/screens/fc_service.dart';
import 'package:flutter_advance/services/rtdb_service.dart';

// import 'package:flutter_advanced/service/rtdb_service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../model/post_model.dart';

// import '../service/auth_service.dart';
import '../services/auth_service.dart';
import 'create_page.dart';

class MainPage extends StatefulWidget {
  static final String id = "main_page";

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLoading = false;
  List<DataSnapshot> items = [];

  Future _callCreatePage() async {
    Map results = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const CreatePage();
    }));
    if (results != null && results.containsKey("data")) {
      print(results['data']);
      _apiPostList();
    }
  }

  _apiPostList() async {
    setState(() {
      isLoading = true;
    });
    FCService.read(parentPath: 'posts').then((value) => {
          items = value,
          setState(() {}),
        });
    items.clear();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase"),
        actions: [
          IconButton(
            onPressed: () {
              AuthService.logOut(context);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
          IconButton(
              onPressed: () async {
                await RtdbService.deletePost();
                _apiPostList();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, index) {
              Map item = (items[index].value as Map);
              return Slidable(
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {}),
                  children: [
                    SlidableAction(
                      onPressed: (BuildContext context) {},
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: "Update",
                    )
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      // An action can be bigger than the others.
                      onPressed: (BuildContext context) {
                        RtdbService.deletePost();
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${item['name']}, ${item['lastName']}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "2024-06-07",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "${item['content']}",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          _callCreatePage();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

// Widget itemOfPost(NotesModel notes) {
//   return Slidable(
//     startActionPane: ActionPane(
//       motion: const ScrollMotion(),
//       dismissible: DismissiblePane(onDismissed: () {}),
//       children: [
//         SlidableAction(
//           onPressed: (BuildContext context) {},
//           backgroundColor: Colors.green,
//           foregroundColor: Colors.white,
//           icon: Icons.edit,
//           label: "Update",
//         )
//       ],
//     ),
//     endActionPane: ActionPane(
//       motion: const ScrollMotion(),
//       children: [
//         SlidableAction(
//           // An action can be bigger than the others.
//           onPressed: (BuildContext context) {
//             RtdbService.deletePost();
//           },
//           backgroundColor: Colors.red,
//           foregroundColor: Colors.white,
//           icon: Icons.delete,
//           label: 'Delete',
//         ),
//       ],
//     ),
//     child: Container(
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "${post.title} ${post.body}",
//                 style: const TextStyle(
//                     color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 post.id.toString(),
//                 style: const TextStyle(
//                     color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 post.img_url.toString(),
//                 style: const TextStyle(
//                   color: Colors.grey,
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }
}
