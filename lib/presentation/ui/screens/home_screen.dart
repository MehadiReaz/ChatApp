import 'package:chatapp/data/apis.dart';
import 'package:chatapp/presentation/ui/screens/update_profile_screen.dart';
import 'package:chatapp/presentation/ui/widgets/chat_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List list = [];
List<Users> searchList = [];
bool isSeraching = false;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Apis.getSelfUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () {
          if (isSeraching) {
            setState(() {
              isSeraching = !isSeraching;
            });
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 2,
            title: isSeraching
                ? TextField(
                    onChanged: (value) {
                      searchList.clear();

                      for (var i in list) {
                        if (i.name.contains(value) ||
                            i.email.toLowerCase().contains(value)) {
                          searchList.add(i);
                          searchList;
                          setState(() {});
                        }
                      }
                    },
                    style: TextStyle(fontSize: 17, letterSpacing: .5),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  )
                : Text('Chap App'),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isSeraching = !isSeraching;
                  });
                },
                icon: Icon(isSeraching
                    ? CupertinoIcons.clear_circled_solid
                    : Icons.search),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => UpdateProfileScreen(
                        user: Apis.selfUser!,
                      ));
                },
                icon: Icon(CupertinoIcons.profile_circled),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: StreamBuilder(
                stream: Apis.getAllUsers(),
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
                          data?.map((e) => Users.fromJson(e.data())).toList() ??
                              [];
                  }
                  return list.isNotEmpty
                      ? ListView.builder(
                          itemCount:
                              isSeraching ? searchList.length : list.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ChatUserCard(
                              users:
                                  isSeraching ? searchList[index] : list[index],
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
          floatingActionButton: FloatingActionButton(onPressed: () async {}),
        ),
      ),
    );
  }
}
