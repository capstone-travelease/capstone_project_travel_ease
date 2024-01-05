import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/domain/models/images_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/room_model.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/list_room/list_room_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/room_detail/room_detail_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/bookingInfo.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/custom_no_data_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

class ListRoomPage extends GetView<ListRoomController> {
  static const String routeName = '/ListRoomPage';
  const ListRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      appBar: const Appbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProposeRoom(),
            PagedListView<int, RoomModel>.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
                noItemsFoundIndicatorBuilder: (context) =>
                    const CustomNoDataWidget(
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
                firstPageErrorIndicatorBuilder: (context) =>
                    const CustomNoDataWidget(
                  noiDung: 'Không có dữ liệu',
                  isSearch: false,
                ),
                newPageErrorIndicatorBuilder: (context) =>
                    const CustomNoDataWidget(
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
          ],
        ),
      ),
      bottomNavigationBar: const GetFooter(),
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

class ProposeRoom extends GetView<ListRoomController> {
  const ProposeRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  'Được Đề Xuất cho ${controller.searchHotelController.numberAdult.toInt()} người',
                  style: Get.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(
                () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.rooms.length,
                  itemBuilder: (context, index) {
                    final item = controller.rooms[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          style: Get.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item.price.toString(),
                          style: Get.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Divider(
                color: Colors.grey[400]!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng Cộng',
                    style: Get.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(
                    () => Text(
                      controller.total.toString(),
                      style: Get.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: Get.width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          "Đặt Ngay",
                          style: Get.textTheme.titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
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
              ListImage(images: roomModel.images ?? []),
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
              Stack(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: roomModel.facilities?.length,
                    itemBuilder: (context, index) {
                      final item = roomModel.facilities?[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item?.facilityName ?? '',
                          style: Get.textTheme.bodyMedium,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 8,
                    right: 10,
                    child: Column(
                      children: [
                        Text('${roomModel.roomPrice! + 100}',
                            style: Get.textTheme.bodySmall!.copyWith(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey.shade500,
                              decoration: TextDecoration.lineThrough,
                            )),
                        Text(
                          NumberFormat.currency(locale: 'vi_VN', symbol: 'VND')
                              .format(roomModel.roomPrice),
                          style: Get.textTheme.bodyLarge?.copyWith(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '/per night',
                          style: Get.textTheme.bodySmall?.copyWith(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(''),
                    InkWell(
                      // onTap: () => Get.toNamed(BookingPage.routeName,
                      //     arguments: {"roomId": roomModel.roomId}),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16),
                          child: Center(
                            child: Text(
                              'Select room',
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
        ),
      ),
    );
  }
}

class ListImage extends StatelessWidget {
  const ListImage({Key? key, required this.images}) : super(key: key);
  final List<ImagesModel> images;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final item = images[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ExtendedImage.network(
              Constant.baseImageUrl + (item.imageUrl ?? ''),
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
        },
      ),
    );
  }
}

class GetFooter extends GetView<ListRoomController> {
  const GetFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: WidgetBookingInfo(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 40),
                        child: Text(
                          'Book Room',
                          style: Get.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Total Price \n ',
                          style: Get.textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        // TextSpan(
                        //   text: controller.room.value?.roomPrice != null
                        //       ? NumberFormat.currency(
                        //               locale: 'vi_VN', symbol: 'VND')
                        //           .format(controller.room.value?.roomPrice)
                        //       : "",
                        //   style: Get.textTheme.titleMedium!
                        //       .copyWith(fontWeight: FontWeight.bold),
                        // ),
                        TextSpan(
                            text: '\n/per night',
                            style: Get.textTheme.bodySmall!),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
