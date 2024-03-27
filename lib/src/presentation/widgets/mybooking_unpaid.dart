import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/domain/models/my_booking_model.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnpaidBooking extends StatelessWidget {
  const UnpaidBooking({
    super.key,
    required this.myBooking,
  });
  final MyBookingModel myBooking;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: Get.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Auto Cancel After 5 Minutes',
                        style: Get.textTheme.titleSmall?.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: ExtendedImage.network(
                    Constant.baseImageUrl + (myBooking.fileUrl ?? ''),
                    fit: BoxFit.cover,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                myBooking.hotelName ?? '',
                                style: Get.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        size: 18,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' ',
                                    ),
                                    TextSpan(
                                      text: myBooking.hotelCity ?? '',
                                      style: Get.textTheme.bodySmall!
                                          .copyWith(color: Colors.grey[500]),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Divider(
                                color: Colors.grey[300],
                              ),
                              Text(
                                'View now >>',
                                style: Get.textTheme.bodyMedium!.copyWith(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // decoratedBox,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey[200]!,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Cancel',
                              style: Get.textTheme.bodyMedium!.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
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
                      onTap: () {},
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Pay now',
                              style: Get.textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
