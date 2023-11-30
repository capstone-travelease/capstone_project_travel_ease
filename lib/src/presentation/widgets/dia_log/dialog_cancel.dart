import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class DiaLogCancel extends StatelessWidget {
  final Callback onTap;
  const DiaLogCancel({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            height: 300,
            margin: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 64.0),
                  child: Divider(
                    color: Colors.black,
                    indent: 12,
                    endIndent: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Are you sure you want to cancel your hotel booking',
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Only 80% of the money you can refund from payment according to our policy',
                    style: Get.textTheme.bodySmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey[300]!),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Text('No,Thanks',
                                    style: Get.textTheme.bodyMedium!),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: onTap,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  'Ok',
                                  style: Get.textTheme.bodyMedium!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
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
          Positioned.fill(
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.cancel_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Cancel Booking',
                  style: Get.textTheme.titleMedium!.copyWith(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
