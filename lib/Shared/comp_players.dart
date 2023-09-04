import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Colors.dart';
import 'Fonts.dart';

Widget info({
  required String img,
  required String text2,
}) {
  return Column(
    children: [
      Image(
        image: AssetImage(img),
        width: 30,
        height: 30,
      ),
      Text(
        text2,
        style: TextStyle(color: AppColors.textcolor),
      ),
    ],
  );
}

Widget verticalline({dynamic}) {
  return Container(
    alignment: Alignment.center,
    height: 30,
    width: 1,
    color: AppColors.textcolor,
  );
}

Widget info2({
  required IconData icon,
  required String title,
  required String describtion,
}) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.secondaryColor))),
    child: Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.secondaryColor,
          ),
          child: Icon(
            icon,
            color: AppColors.textcolor,
            size: 15,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    color: AppColors.textcolor,
                    fontSize: AppFonts.fontsize16,
                    fontWeight: FontWeight.w600)),
            Text(describtion,
                style: TextStyle(color: AppColors.textcolor, fontSize: 14)),
          ],
        )
      ],
    ),
  );
}
