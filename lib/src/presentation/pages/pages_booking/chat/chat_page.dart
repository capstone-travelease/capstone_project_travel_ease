import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/chat/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  static const String routeName = '/ChatPage';
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        // backgroundColor: Get.theme.colorScheme.background,
        title: Text(
          'Chat',
          style: Get.textTheme.titleLarge!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
        child: Column(
          children: [
            // ListView.builder(
            //   reverse: true,
            //   itemCount: 3,
            //   itemBuilder: (context, index) {
            //     final reversedList = List.from(controller.messages.reversed);
            //     final message = reversedList[index];
            //     MessageModel? lastItem;
            //     if (index > 0) {
            //       lastItem = controller.messages[index - 1];
            //     }
            //     MessageModel? currentItem = message;
            //
            //     MessageModel? nextItem;
            //     if ((controller.messages.length - 1) > index) {
            //       nextItem = controller.messages[index + 1];
            //     }
            //
            //     if (currentItem?.sendby != controller.userId) {
            //       return LeftContent(
            //         current: currentItem!,
            //         last: lastItem,
            //         next: nextItem,
            //       );
            //     }
            //     return RightContent(
            //       current: currentItem!,
            //       last: lastItem,
            //       next: nextItem,
            //       currentIndex: index,
            //     );
            //   },
            // ),
            const GetBottomBar()
          ],
        ),
      ),
    );
  }
}

class GetBottomBar extends GetView<ChatController> {
  const GetBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Card(
          color: Get.theme.colorScheme.surfaceVariant,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // GestureDetector(
                //     onTap: () => controller.getCameraImages(),
                //     child: Image.asset(IconAssets.iconCamera)),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: controller.message,
                    decoration: const InputDecoration(
                        hintText: 'Message', border: InputBorder.none),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: Colors.deepPurple,
                  ),
                ),
                // GestureDetector(
                //   onTap: () => controller.getGallery(),
                //   child: Image.asset(IconAssets.iconGallery),
                // ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
