import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHotelMyBooking extends StatelessWidget {
  final DecoratedBox decoratedBox;
  const ListHotelMyBooking({Key? key, required this.decoratedBox})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Hero(
        tag: UniqueKey(),
        child: InkWell(
          // onTap: () => Get.toNamed(HotelDetailPage.routeName),
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
                            'https://www.hotelgrandsaigon.com/wp-content/uploads/sites/227/2017/12/GRAND_SEDK_01.jpg',
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
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Intercontinental Hotel',
                                style: Get.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 16,
                                  ),
                                  Text(
                                    'Hồ Chí Minh',
                                    style: Get.textTheme.bodySmall!.copyWith(),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              decoratedBox,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.redAccent,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '5.0',
                            style: Get.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '(1000 View)',
                        style: Get.textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Icon(
                        Icons.bookmark_outline_outlined,
                        size: 30,
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