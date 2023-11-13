import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class DiaLogSignOut extends StatelessWidget {
  final Callback onTap;
  const DiaLogSignOut({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: Container(
        height: 280,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text(
                'Sign Out',
                style: Get.textTheme.titleLarge?.copyWith(
                    color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                  textAlign: TextAlign.center,
                  'Are you sure you want to sign out?'),
            ),
            Divider(
              color: Colors.grey[300],
              endIndent: 20,
              indent: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
                      'Yes, Sign out',
                      style: Get.textTheme.bodyMedium
                          ?.copyWith(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
                        child: Text(
                      'Cancel',
                      style: Get.textTheme.bodyMedium?.copyWith(),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
