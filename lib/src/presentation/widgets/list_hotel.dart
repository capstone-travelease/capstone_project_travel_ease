import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/domain/models/hotel_model.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListHotelView extends StatelessWidget {
  const ListHotelView({Key? key, required this.hotelModel, required this.onTap})
      : super(key: key);
  final HotelModel hotelModel;
  final VoidCallback onTap;
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
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: ExtendedImage.network(
                            Constant.baseImageUrl + (hotelModel.images ?? ''),
                            fit: BoxFit.cover,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
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
                        const SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hotelModel.hotelName ?? '',
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
                                      text: hotelModel.hotelCity ?? '',
                                      style: Get.textTheme.bodySmall!
                                          .copyWith(color: Colors.grey[500]),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: NumberFormat.currency(
                                              locale: 'vi_VN', symbol: 'VND')
                                          .format(hotelModel.price),
                                      style: Get.textTheme.bodySmall!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    TextSpan(
                                      text: "/per night",
                                      style: Get.textTheme.bodySmall!
                                          .copyWith(color: Colors.grey[500]),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.redAccent,
                              ),
                            ),
                            const TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: hotelModel.starRating.toString(),
                              style: Get.textTheme.bodySmall!.copyWith(),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Icon(
                          Icons.bookmark_outline_outlined,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
