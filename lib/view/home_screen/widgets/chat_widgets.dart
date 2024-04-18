import 'package:chat_task/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ChatWidgetScreen extends StatelessWidget {
  ChatWidgetScreen({super.key, required this.text, required this.isSender});

  final String text;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: ListTile(
        leading: isSender == true
            ? null
            : CircleAvatar(
                radius: 20,
                child: Icon(Icons.person),
              ),
        title: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: isSender
                  ? ColorConstants.primaryBlue
                  : ColorConstants.primaryGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isSender ? Colors.white : Colors.black,
              ),
            )),
      ),
    );
  }
}


// Row(
//           children: [
//             isSender == true
//                 ? SizedBox()
//                 : CircleAvatar(
//                     radius: 20,
//                     child: Icon(Icons.person),
//                   ),
//             SizedBox(
//               width: 10,
//             ),
//             Expanded(
//               child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: isSender
//                         ? ColorConstants.primaryBlue
//                         : ColorConstants.primaryGrey,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Text(
//                     text,
//                     style: TextStyle(
//                       color: isSender ? Colors.white : Colors.black,
//                     ),
//                   )),
//             ),
//           ],
//         )