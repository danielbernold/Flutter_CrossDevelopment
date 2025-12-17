import 'package:flutter/material.dart';
import 'services/api_service.dart';

class ApiPage extends StatelessWidget {
  ApiPage({super.key});
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: FutureBuilder(
        future: api.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error loading posts"));
          }

          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (_, i) {
              final p = posts[i];
              return ListTile(title: Text(p.title), subtitle: Text(p.body));
            },
          );
        },
      ),
    );
  }
}
