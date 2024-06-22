import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class NetworkScreen extends StatefulWidget {
  static const id = '/network_id';

  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  var isLoading = false;
  var items = [];

  @override
  void initState() {
    super.initState();
    _getApi();
  }

  _getApi() async {
    setState(() {
      isLoading = true;
    });
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      setState(() {
        isLoading = false;
        items = Network.getResponseList(response);
      });
    }
  }

  _createPost() {
    var post =
        Post(id: 101, title: 'HTTP', body: 'USING HTTP PACKAGE', userId: 1);
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {LogService.i(response.toString())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Networking",
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return buildApi(items[index]);
              },
            ),
    );
  }

  Widget buildApi(Post post) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(post.body),
        ],
      ),
    );
  }
}
