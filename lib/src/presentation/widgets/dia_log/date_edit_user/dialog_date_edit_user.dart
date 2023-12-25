import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/date_edit_user/dialog_date_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DiaLogDateEditUserPage extends StatelessWidget {
  final DateTime? dateTime;
  const DiaLogDateEditUserPage({Key? key, this.dateTime}) : super(key: key);
  static const String routeName = '/DiaLogSelectDiaLog';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiaLogDateEditUserController>(
        init: DiaLogDateEditUserController(initialValue: dateTime),
        builder: (controller) {
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
                      'Chọn Ngày Sinh',
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
                    selectionMode: DateRangePickerSelectionMode.single,
                    showNavigationArrow: true,
                    minDate: DateTime(1960),
                    maxDate: DateTime(3000),
                    headerStyle: const DateRangePickerHeaderStyle(
                      backgroundColor: Colors.redAccent,
                      textStyle: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    initialSelectedDate: controller.date!.value,
                    initialDisplayDate: controller.date!.value,
                    // rangeTextStyle:
                    //     const TextStyle(color: Colors.white, fontSize: 18),
                    // rangeSelectionColor: Colors.redAccent.withOpacity(0.3),
                    onSelectionChanged:
                        (DateRangePickerSelectionChangedArgs args) {
                      if (args.value is DateTime) {
                        DateTime selectedDate = args.value;
                        controller.updateDateRange(selectedDate);
                      }
                    },
                  ),
                  Divider(
                    color: Colors.grey[300],
                    endIndent: 10,
                    indent: 10,
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
                            Get.back(result: controller.date?.value);
                          },
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
                                    'Tiếp Tục',
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
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
