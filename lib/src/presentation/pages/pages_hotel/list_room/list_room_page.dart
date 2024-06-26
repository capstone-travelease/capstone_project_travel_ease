import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/domain/models/images_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/room_model.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/list_room/list_room_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/room_detail/room_detail_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/bookingInfo.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/custom_no_data_widget.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/loading_shimmer_room.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            // const ProposeRoom(),
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
                    ),
                  );
                },
                noItemsFoundIndicatorBuilder: (context) =>
                    const CustomNoDataWidget(
                  noiDung: 'Không có dữ liệu',
                  isSearch: false,
                ),
                firstPageProgressIndicatorBuilder: (context) {
                  return const LoadingShimmerRoom();
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
      bottomNavigationBar: Obx(
        () => (controller.totalPrice.value) != 0
            ? const GetFooter()
            : const SizedBox.shrink(),
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
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.argListRoom.hotelName ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
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
                              style: Get.textTheme.bodySmall!.copyWith(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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

class ListRooms extends GetView<ListRoomController> {
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 6,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Không hoàn tiền',
                      style: Get.textTheme.titleSmall!.copyWith(),
                    ),
                  ],
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
                    itemCount: (roomModel.facilities?.length ?? 0) > 5
                        ? 6
                        : (roomModel.facilities?.length ?? 0),
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
                        Text(
                          NumberFormat.currency(locale: 'vi_VN', symbol: 'VND')
                              .format(roomModel.roomPrice! + 1000000),
                          style: Get.textTheme.bodySmall!.copyWith(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade500,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
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
                    Obx(
                      () {
                        bool isRoomSelected = controller.roomCards.any(
                            (element) => element.roomId == roomModel.roomId);
                        return isRoomSelected
                            ? Row(
                                children: [
                                  if ((controller
                                          .getRoomQuantity(
                                              roomModel.roomId ?? 0)
                                          .toInt() ==
                                      (roomModel.roomQuantity?.toInt() ?? -1)))
                                    Text(
                                      'Đã tới giới hạn số phòng',
                                      style: Get.textTheme.bodySmall!
                                          .copyWith(color: Colors.red),
                                    ),
                                  TextButton(
                                    onPressed: () {
                                      controller.cleanRoomsSelected(
                                          roomModel.roomId ?? 0);
                                    },
                                    child: Text(
                                      'Xóa',
                                      style: Get.textTheme.bodySmall!.copyWith(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const Text('');
                      },
                    ),
                    InkWell(
                      onTap: () {},
                      child: Obx(
                        () {
                          bool isRoomSelected = controller.roomCards.any(
                              (element) => element.roomId == roomModel.roomId);
                          return !isRoomSelected
                              ? DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 16),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          controller.addSelectedRoom(roomModel);
                                        },
                                        child: Text(
                                          'Select room',
                                          style: Get.textTheme.bodyMedium!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.redAccent),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 14),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.decrementRoom(roomModel);
                                          },
                                          child: const Icon(
                                            Icons.remove,
                                            size: 26,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Obx(
                                          () => Text(
                                            controller
                                                .getRoomQuantity(
                                                    roomModel.roomId ?? 0)
                                                .value
                                                .toString(),
                                            style: Get.textTheme.bodyLarge!
                                                .copyWith(
                                                    color: Colors.redAccent),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.incrementRoom(roomModel);
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            size: 26,
                                            color: Colors.redAccent,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                        },
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
      height: 120,
      child: images.length > 1
          ? ListView.builder(
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
            )
          : Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ExtendedImage.network(
                Constant.baseImageUrl + (images.first.imageUrl ?? ''),
                width: Get.width,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => WidgetBookingInfo(
                  roomQuantity: controller.totalRoom.toInt(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Obx(
                () => RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Total Price: ',
                        style: Get.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: (controller.totalPrice.value) > 0
                            ? NumberFormat.currency(
                                    locale: 'vi_VN', symbol: 'VND')
                                .format(controller.totalPrice.toInt() *
                                    ((controller.argListRoom.dateTimeRange?.end
                                                .day)! -
                                            (controller.argListRoom
                                                .dateTimeRange?.start.day)!)
                                        .toInt())
                            : "",
                        style: Get.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '/per night',
                        style: Get.textTheme.bodySmall!,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.showSnackbar(GetSnackBar(
                          title: 'Thông báo',
                          message: 'Chức năng đang phát triển',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.redAccent,
                          margin: const EdgeInsets.all(8),
                          borderRadius: 18,
                          overlayColor: Colors.black.withOpacity(0.5),
                          isDismissible: true,
                        ));
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Colors.redAccent),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 20),
                          child: Center(
                            child: Text(
                              'Hold Room',
                              style: Get.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          BookingPage.routeName,
                          arguments: ArgBookingRooms(
                            roomCardModel: controller.roomCards,
                            price: (controller.totalPrice.toInt() *
                                ((controller.argListRoom.dateTimeRange?.end
                                            .day)! -
                                        (controller.argListRoom.dateTimeRange
                                            ?.start.day)!)
                                    .toInt()),
                            numberRoom: controller.totalRoom.toInt(),
                            hotelId: controller.argListRoom.hotelId!,
                            checkIn:
                                controller.argListRoom.dateTimeRange?.start ??
                                    DateTime.now(),
                            checkOut:
                                controller.argListRoom.dateTimeRange?.end ??
                                    DateTime.now(),
                          ),
                        );
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 20),
                          child: Center(
                            child: Text(
                              'Book Room',
                              style: Get.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
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
