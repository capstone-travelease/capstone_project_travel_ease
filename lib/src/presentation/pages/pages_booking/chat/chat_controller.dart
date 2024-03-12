import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/src/domain/models/messages_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/get_messages_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_send_Message_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends GetxController {
  final RxList<MessagesModel> messages = <MessagesModel>[].obs;
  late TextEditingController messageEditingController;
  final UserService _userService = Get.find(tag: Constant.uerSerServiceTAG);
  final IO.Socket socket = IO.io('http://34.126.163.206:9092/',
      IO.OptionBuilder().setTransports(['websocket']).build());
  @override
  void onInit() {
    messageEditingController = TextEditingController();
    fetchMessages();
    connectSocket();
    super.onInit();
  }

  void connectSocket() {
    socket
      ..open()
      ..onConnect((data) => print("Connected with Socket"))
      ..onConnectError((data) => print("Fail to Connect $data"))
      ..onDisconnect((data) => null)
      ..on('chatEvent', (data) {
        print(data);
        final newMessage = MessagesModel.fromJson(data);
        messages.add(newMessage);
      });
  }

  Future<void> fetchMessages() async {
    try {
      final res = await _userService.messages(
        body: const GetMessageBody(
          senderName: 'user1',
          targetName: 'user2',
        ),
      );
      messages.call(res);
    } catch (error) {
      Get.log(
        error.toString(),
      );
    }
  }

  Future<void> sendMessage() async {
    try {
      await _userService.sendMessage(
        body: PostSendMessageBody(
          senderName: 'user1',
          targetUserName: 'user2',
          message: messageEditingController.text.trim(),
        ),
      );
      socket.emit('chatEvent', messages);
      // fetchMessages();
      messageEditingController.clear();
    } catch (error) {
      Get.log(
        error.toString(),
      );
    }
  }
}
