import 'package:chatapp/data/apis.dart';
import 'package:chatapp/data/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({super.key, required this.message});
  final Message message;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Apis.user.uid == widget.message.fromId
        ? _greenMessage()
        : _blueMessage();
  }

  Widget _greenMessage() {
    return Container(
      child: Text('${widget.message.msg}'),
    );
  }

  Widget _blueMessage() {
    return Container(
      child: Text('${widget.message.msg}'),
    );
  }
}
