import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/domain/models/room_model.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/list_room/list_room_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/room_detail/room_detail_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/custom_no_data_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListRoomPage extends GetView<ListRoomController> {
  static const String routeName = '/ListRoomPage';
  const ListRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      appBar: const Appbar(),
      body: PagedListView<int, RoomModel>.separated(
        shrinkWrap: true,
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (
            BuildContext context,
            RoomModel item,
            int index,
          ) {
            // final itemPA = controller.listPhanAnh[index];
            return InkWell(
                onTap: () {},
                child: ListRooms(
                  roomModel: item,
                ));
          },
          noItemsFoundIndicatorBuilder: (context) => const CustomNoDataWidget(
            noiDung: 'Không có dữ liệu',
            isSearch: false,
          ),
          firstPageProgressIndicatorBuilder: (context) {
            return const Center(child: CircularProgressIndicator());
          },
          newPageProgressIndicatorBuilder: (context) => SizedBox(
            height: 30,
            child: Center(
              child: CupertinoActivityIndicator(
                color: Get.theme.colorScheme.primary,
              ),
            ),
          ),
          firstPageErrorIndicatorBuilder: (context) => const CustomNoDataWidget(
            noiDung: 'Không có dữ liệu',
            isSearch: false,
          ),
          newPageErrorIndicatorBuilder: (context) => const CustomNoDataWidget(
            noiDung: 'Có lỗi xảy ra. Vui lòng thử lại!',
            isSearch: false,
          ),
        ),
        separatorBuilder: (_, __) => const Divider(
          endIndent: 0,
          thickness: 1,
          indent: 0,
          height: 0,
          color: Colors.transparent,
        ),
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
      preferredSize: const Size.fromHeight(120),
      child: DecoratedBox(
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
                          controller.argListRoom.hotelName,
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
                                text: controller.argListRoom.location,
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
  Size get preferredSize => const Size.fromHeight(70);
}

class ListRooms extends StatelessWidget {
  const ListRooms({Key? key, required this.roomModel}) : super(key: key);
  final RoomModel roomModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Get.toNamed(RoomDetailPage.routeName,
            arguments: {"roomId": roomModel.roomId}),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListImage(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
                child: Text(
                  roomModel.roomName ?? '',
                  style: Get.textTheme.titleLarge!.copyWith(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 30,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.square_foot_outlined,
                            size: 18,
                          ),
                        ),
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text: roomModel.roomSize ?? '',
                          style: Get.textTheme.bodySmall!.copyWith(),
                        ),
                        const TextSpan(
                          text: '     ',
                        ),
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.bed,
                            size: 18,
                          ),
                        ),
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text:
                              "${roomModel.roomBedQuantity.toString()} ${'Bed Quantity'}",
                          style: Get.textTheme.bodySmall!.copyWith(),
                        ),
                        const TextSpan(
                          text: '     ',
                        ),
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.people_outline,
                            size: 18,
                          ),
                        ),
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text:
                              " ${roomModel.roomCapacity.toString()} ${'capacity'}",
                          style: Get.textTheme.bodySmall!.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[400],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6),
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
                                      ' ${roomModel.roomPrice! + 100}', // Replace with your original price
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
                              roomModel.roomPrice.toString(),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 8),
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
            ],
          ),
        ),
      ),
    );
  }
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
