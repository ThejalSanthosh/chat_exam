import 'package:chat_task/controller/chat_controller.dart';
import 'package:chat_task/core/constants/color_constants.dart';
import 'package:chat_task/view/home_screen/widgets/chat_widgets.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

TextEditingController messageController = TextEditingController();
var formKey = GlobalKey<FormState>();

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.primaryBlue,
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: ColorConstants.primaryBlue,
          leading: Icon(
            Icons.arrow_back_ios_new,
            color: ColorConstants.primaryWhite,
          ),
          title: Text(
            "Fiona",
            style: TextStyle(
                color: ColorConstants.primaryWhite,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            CircleAvatar(
              backgroundColor: ColorConstants.primaryBlack.withOpacity(.3),
              radius: 20,
              child: Icon(
                Icons.phone,
                color: ColorConstants.primaryWhite,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            CircleAvatar(
              backgroundColor: ColorConstants.primaryBlack.withOpacity(.3),
              radius: 20,
              child: Icon(
                Icons.videocam_sharp,
                color: ColorConstants.primaryWhite,
              ),
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              )),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ChatWidgetScreen(
                          text: ChatController.sampleMessage[index]["text"],
                          isSender: ChatController.sampleMessage[index]
                              ["isSender"]),
                      separatorBuilder: (context, index) => SizedBox(),
                      itemCount: ChatController.sampleMessage.length),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: messageController,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Type your message...",
                              hintStyle: TextStyle(
                                color:
                                    ColorConstants.primaryBlack.withOpacity(.4),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter message';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ChatController.sampleMessage.add({
                              "text": messageController.text,
                              "isSender": true
                            });
                            setState(() {
                              
                            });
                            messageController.clear();
                          }
                        },
                        icon: Icon(Icons.send),
                        color: ColorConstants.primaryBlue,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
