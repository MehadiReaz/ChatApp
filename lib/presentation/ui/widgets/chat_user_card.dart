import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/data/models/user_model.dart';
import 'package:chatapp/presentation/ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      child: ListTile(
        onTap: () => Get.to(() => ChatScreen(
              users: widget.users,
            )),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: CachedNetworkImage(
            height: 50,
            width: 50,
            imageUrl: widget.users.image!,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        title: Text('${widget.users.name}'),
        subtitle: Text(
          '${widget.users.about}',
          maxLines: 1,
        ),
        // trailing: Text('12.00 PM'),
        trailing: Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
