import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/chat/chat_controller.dart';
import 'package:extended_image/extended_image.dart';
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
            Expanded(
              child: Center(
                child: Container(
                  width: 300,
                  height: 260,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Xin chào bạn hãy gửi tin nhắn cho chúng tôi để được hỗ trợ !",
                          textAlign: TextAlign.center,
                          style: Get.theme.textTheme.titleMedium,
                        ),
                        SizedBox(
                          width: 200,
                          child: ExtendedImage.network(
                            'https://cdn.dribbble.com/userupload/3271927/file/original-223856aa8fef836d7bc818da6154f3ab.gif',
                            fit: BoxFit.cover,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            shape: BoxShape.rectangle,
                            loadStateChanged: (ExtendedImageState state) {
                              switch (state.extendedImageLoadState) {
                                case LoadState.loading:
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                case LoadState.completed:
                                  return null;
                                case LoadState.failed:
                                  return Image.asset(
                                    Assets.images.noImage.path,
                                  );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
