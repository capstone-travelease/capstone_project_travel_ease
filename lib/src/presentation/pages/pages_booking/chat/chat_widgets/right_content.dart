import 'package:flutter/material.dart';

class RightContent extends StatelessWidget {
  // final MessageModel? last;
  // final MessageModel current;
  // final MessageModel? next;
  // final int currentIndex;

  const RightContent({
    Key? key,
    // required this.current,
    // required this.last,
    // required this.next,
    // required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.65),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[500],
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ),
            // if (currentIndex == 0)
            //   Center(
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //       child: CustomText(
            //         text: dayFormat(current.time!),
            //         textSize: 15,
            //         fontWeight: FontWeight.w300,
            //         textColor: getSuitableColor(AppColor.black, AppColor.white),
            //       ),
            //     ),
            //   )
          ],
        ),
      ],
    );
  }
}
