import 'package:car_rent_app/theme/colors.dart';
import 'package:flutter/material.dart';

class InfoRowWidget extends StatelessWidget {
  final String title;
  final String value;
  const InfoRowWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.darkBlue50,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.buttonBlue,
          ),
        ),
      ],
    );
  }
}
