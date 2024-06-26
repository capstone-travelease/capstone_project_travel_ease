import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/domain/models/my_booking_model.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHotelMyBooking extends StatelessWidget {
  const ListHotelMyBooking({
    Key? key,
    required this.decoratedBox,
    required this.myBooking,
    required this.onTap,
    this.text,
  }) : super(key: key);
  final DecoratedBox decoratedBox;
  final MyBookingModel myBooking;
  final VoidCallback onTap;
  final TextButton? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Hero(
        tag: UniqueKey(),
        child: InkWell(
          onTap: onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: Row(
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
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
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
                                decoratedBox,
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const WidgetSpan(
                                      child: Icon(
                                        Icons.star,
                                        size: 18,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    TextSpan(
                                      text: myBooking.ratePoint.toString(),
                                      style:
                                          Get.textTheme.bodySmall!.copyWith(),
                                    )
                                  ],
                                ),
                              ),
                              text ?? const SizedBox.shrink(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
