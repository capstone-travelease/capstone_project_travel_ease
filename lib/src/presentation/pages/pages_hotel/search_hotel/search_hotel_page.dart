import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/domain/models/hotel_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/model_search.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/hotel_detal/hotel_detail_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/search_hotel/search_hotel_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/bottomsheet/filter/filter_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/custom_no_data_widget.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/list_hotel.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/loading_shimmer_hotel.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/search_hotel_widget/widget_search_hotel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchHotelPage extends GetView<SearchHotelController> {
  static const String routeName = '/SearchHotelPage';

  const SearchHotelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      appBar: const Appbar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  style: context.theme.textTheme.titleMedium?.copyWith(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    isCollapsed: true,
                    alignLabelWithHint: true,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    hintStyle: context.theme.textTheme.bodyLarge
                        ?.copyWith(color: Colors.grey.withOpacity(0.6)),

                    // errorText: controller.noiDungError.value,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 40.0),
                child: ListHotel(),
              )
            ],
          ),
        ),
      ),
      bottomSheet: const BottomSheetFilter(),
    );
  }
}

class Appbar extends GetView<SearchHotelController>
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
                      Obx(
                        () => Expanded(
                          child: Text(
                            controller.location.value == ""
                                ? 'Choose your location'
                                : controller.location.value ??
                                    'Choose your location',
                            style: Get.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: controller.location.value == ""
                                  ? Colors.white.withOpacity(0.4)
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: controller.dateRange.value!.start
                                    .formatDateToString(),
                                style: Get.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(text: ' - '),
                              TextSpan(
                                text: controller.dateRange.value!.end
                                    .formatDateToString(),
                                style: Get.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => Expanded(
                          child: Row(
                            children: [
                              Text(
                                '${controller.numberRoom.value} room(s),',
                                style: Get.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${controller.numberAdult.value} adlut(s)',
                                style: Get.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final data = await Get.dialog<SearchModel>(
                      const FilterOverlay(),
                    );
                    if (data != null) {
                      controller.dateRange.value = DateTimeRange(
                          start: data.fromDay!, end: data.todDay!);
                      controller.numberAdult.value = data.numberAdult ?? -1;
                      controller.numberRoom.value = data.numberRoom ?? -1;
                      controller.location.value = data.location ?? '';
                      controller.pagingController.refresh();
                    }
                  },
                  child: Text(
                    'CHANGE',
                    style: Get.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class FilterOverlay extends GetView<SearchHotelController> {
  const FilterOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  child: WidgetSearchHotelPage(
                    title: 'Modify',
                    onChange: (SearchModel data) {
                      final result = data;

                      Get.back(result: result);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListHotel extends GetView<SearchHotelController> {
  const ListHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, HotelModel>.separated(
      shrinkWrap: true,
      pagingController: controller.pagingController,
      physics: const NeverScrollableScrollPhysics(),
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (
          BuildContext context,
          HotelModel item,
          int index,
        ) {
          final itemHotel = controller.listHotel[index];
          return ListHotelView(
            hotelModel: item,
            onTap: () => Get.toNamed(
              HotelDetailPage.routeName,
              arguments: {
                'hotelId': itemHotel.hotelId,
              },
            ),
          );
        },
        noItemsFoundIndicatorBuilder: (context) => const CustomNoDataWidget(
          noiDung: 'Không có dữ liệu',
          isSearch: false,
        ),
        firstPageProgressIndicatorBuilder: (context) {
          return const LoadingShimmerHotel();
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
    );
  }
}

class BottomSheetFilter extends StatelessWidget {
  const BottomSheetFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DecoratedBox(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(''),
            InkWell(
              onTap: () => Get.bottomSheet(
                SizedBox(
                  height: 500,
                  width: Get.width,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: FilterPage(),
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.filter_alt,
                    color: Colors.redAccent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Filter',
                    style: Get.textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const VerticalDivider(
              color: Colors.grey,
              width: 2,
              indent: 8,
              endIndent: 8,
            ),
            Row(
              children: [
                const Icon(
                  Icons.sort,
                  color: Colors.redAccent,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Sort',
                  style: Get.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Text(''),
          ],
        ),
      ),
    );
  }
}
