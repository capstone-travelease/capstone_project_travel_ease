import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/booking/booking_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/list_room/list_room_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/room_detail/room_detail_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListRoomPage extends GetView<ListRoomController> {
  static const String routeName = '/ListRoomPage';
  const ListRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      appBar: const Appbar(),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListImage(),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
                    child: Text('Standard Room'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      height: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.bedroom_parent_outlined,
                                  size: 20,
                                ),
                                Text(
                                  '1 king bed',
                                  style: Get.textTheme.bodySmall,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  const ListRoom(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Appbar extends GetView<ListRoomController>
    implements PreferredSizeWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(14),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Royale President Hotel',
                          style: Get.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(
                                  Icons.location_on_outlined,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const TextSpan(
                                text: ' ',
                              ),
                              TextSpan(
                                text: 'Hồ Chí Minh',
                                style: Get.textTheme.bodySmall!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_outline_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}

class ListImage extends GetView<ListRoomController> {
  const ListImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.listImage.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ExtendedImage.network(
                controller.listImage[index],
                width: 155,
                height: 100,
                fit: BoxFit.cover,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
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
            );
          }),
    );
  }
}

class ListRoom extends StatelessWidget {
  const ListRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(RoomDetailPage.routeName),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Row(
              children: [
                const Icon(Icons.people),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '2 guest(s)/room',
                  style: Get.textTheme.bodySmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                const Icon(Icons.people),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '2 guest(s)/room',
                  style: Get.textTheme.bodySmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.people),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '2 guest(s)/room',
                      style: Get.textTheme.bodySmall,
                    )
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text:
                              '7.600.000đ', // Replace with your original price
                          style: Get.textTheme.bodySmall!.copyWith(
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.lineThrough,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.people),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '2 guest(s)/room',
                      style: Get.textTheme.bodySmall,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '4.600.000đ',
                      style: Get.textTheme.bodyLarge,
                    ),
                    Text(
                      '/per night',
                      style: Get.textTheme.bodySmall,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(''),
                InkWell(
                  onTap: () => Get.toNamed(BookingPage.routeName),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16),
                      child: Center(
                        child: Text(
                          'Book now',
                          style: Get.textTheme.bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
