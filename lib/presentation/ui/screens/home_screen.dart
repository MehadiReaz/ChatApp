import 'package:chatapp/data/apis.dart';
import 'package:chatapp/presentation/ui/widgets/chat_user_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../data/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List list = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chap App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: StreamBuilder(
            stream: Apis.firebaseFirestore.collection('users').snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case ConnectionState.active:
                case ConnectionState.done:
                  final data = snapshot.data?.docs;
                  list =
                      data?.map((e) => Users.fromJson(e.data())).toList() ?? [];
              }
              return list.isNotEmpty
                  ? ListView.builder(
                      itemCount: list.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ChatUserCard(
                          users: list[index],
                        );
                      })
                  : Center(
                      child: Text(
                        'No user found',
                        style: TextStyle(fontSize: 25),
                      ),
                    );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await FirebaseAuth.instance.signOut();
        await GoogleSignIn().signOut();
      }),
    );
  }
}
