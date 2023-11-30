import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_date/dialog_date_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DiaLogDatePage extends StatelessWidget {
  final DateTimeRange? dateTimeRange;
  const DiaLogDatePage({Key? key, this.dateTimeRange}) : super(key: key);
  static const String routeName = '/DiaLogSelectDiaLog';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiaLogDateController>(
      init: DiaLogDateController(),
      builder: (controller) {
        controller.dateRange?.value = dateTimeRange ??
            DateTimeRange(
              start: DateTime.now(),
              end: DateTime.now().add(
                const Duration(days: 2),
              ),
            );
        return Dialog(
          surfaceTintColor: Colors.transparent,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Text(
                    'Chọn Ngày Nhận - Ngày Trả ',
                    style: Get.textTheme.titleMedium,
                  ),
                ),
                Divider(
                  color: Colors.grey[300],
                  endIndent: 10,
                  indent: 10,
                ),
                const SizedBox(
                  height: 4,
                ),
                SfDateRangePicker(
                  showActionButtons: false,
                  onCancel: () => Get.back(),
                  navigationDirection:
                      DateRangePickerNavigationDirection.horizontal,
                  selectionMode: DateRangePickerSelectionMode.range,
                  showNavigationArrow: true,
                  minDate: DateTime.now(),
                  maxDate: DateTime(3000),
                  headerStyle: const DateRangePickerHeaderStyle(
                    backgroundColor: Colors.redAccent,
                    textStyle: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  todayHighlightColor: Colors.redAccent,
                  rangeTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 18),
                  startRangeSelectionColor: Colors.redAccent,
                  endRangeSelectionColor: Colors.redAccent,
                  rangeSelectionColor: Colors.redAccent.withOpacity(0.3),
                  initialSelectedRange: PickerDateRange(
                    controller.dateRange?.value.start,
                    controller.dateRange?.value.end,
                  ),
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs? args) {
                    if (args?.value is PickerDateRange) {
                      if (args?.value is PickerDateRange) {
                        final newDateRange = DateTimeRange(
                          start: args?.value.startDate,
                          end: args?.value.endDate ?? args?.value.startDate,
                        );
                        controller.updateDateRange(newDateRange);
                      }
                    }
                  },
                ),
                Divider(
                  color: Colors.grey[300],
                  endIndent: 10,
                  indent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nhận Phòng',
                              style: Get.textTheme.bodySmall?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                            ),
                            Obx(
                              () => Text(
                                controller.dateRange?.value.start
                                        .formatDateMonthToString() ??
                                    '',
                                style: Get.textTheme.bodySmall?.copyWith(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Trả Phòng',
                              style: Get.textTheme.bodySmall?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                            ),
                            Obx(
                              () => Text(
                                controller.dateRange?.value.end
                                        .formatDateMonthToString() ??
                                    '',
                                style: Get.textTheme.bodySmall?.copyWith(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Hủy',
                                  style: Get.textTheme.bodySmall?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (controller.dateRange?.value.start.day !=
                              controller.dateRange?.value.end.day) {
                            Get.back(result: controller.dateRange?.value);
                          }
                          return;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(() => DecoratedBox(
                                decoration: BoxDecoration(
                                  color: controller
                                              .dateRange?.value.start.day !=
                                          controller.dateRange?.value.end.day
                                      ? Colors.redAccent
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      'Tiếp Tục',
                                      style: Get.textTheme.bodySmall?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
