import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class DiaLogSuccessful extends StatelessWidget {
  final Callback onTap;
  final String text;
  const DiaLogSuccessful({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Text(
                    '',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(textAlign: TextAlign.center, text),
                ),
                InkWell(
                  onTap: onTap,
                  child: SizedBox(
                    width: 200,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(child: Text('Ok')),
                      ),
                    ),
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
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Icon(
                      Icons.thumb_up_off_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Successful!',
                  style: Get.textTheme.titleMedium!
                      .copyWith(color: Colors.redAccent),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
