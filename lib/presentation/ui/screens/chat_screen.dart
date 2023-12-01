import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/data/apis.dart';
import 'package:chatapp/data/models/message_model.dart';
import 'package:chatapp/data/models/user_model.dart';
import 'package:chatapp/presentation/ui/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.users});
  final Users users;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> _list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        flexibleSpace: appBar(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: Apis.getAllMessage(),
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
                        log('hhh:${jsonEncode(data![0].data())}');

                        _list.clear();
                        _list.add(Message(
                          fromId: 'sss',
                          msg: 'sss',
                          read: 'sss',
                          sent: 'sss',
                          told: Apis.user.uid,
                          type: Type.text,
                        ));
                        _list.add(Message(
                          fromId: 'sss',
                          msg: 'sss',
                          read: 'sss',
                          sent: 'sss',
                          told: Apis.user.uid,
                          type: Type.text,
                        ));
                        if (_list.isNotEmpty) {
                          return ListView.builder(
                              itemCount: _list.length,
                              padding: EdgeInsets.all(8),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return MessageCard(
                                  message: _list[index],
                                );
                              });
                        } else {
                          return const Center(
                            child: Text('Start Messageing'),
                          );
                        }
                    }
                  }),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20.0,
                    ),
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.emoji_emotions),
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            minLines: 1,
                            maxLines: 3,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type Something...',
                                fillColor: Colors.white),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.image),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 5,
                      bottom: 20.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(60)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            SizedBox(
              width: 7,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: CachedNetworkImage(
                      height: 40,
                      width: 40,
                      imageUrl: widget.users.image!,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.users.name!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text('12.00 PM'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
