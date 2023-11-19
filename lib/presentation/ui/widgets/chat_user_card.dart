import 'package:chatapp/data/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key, required this.users});
  final Users users;
  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: CircleAvatar(child: Icon(CupertinoIcons.person)),
          title: Text('${widget.users.name}'),
          subtitle: Text(
            '${widget.users.about}',
            maxLines: 1,
          ),
          trailing: Text('12.00 PM'),
        ),
      ),
    );
  }
}
