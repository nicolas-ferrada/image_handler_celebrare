import 'package:flutter/material.dart';

import '../styles/app_color.dart';

class CustomContainer extends StatelessWidget {
  final List<Widget> children;
  const CustomContainer({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColor.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...children,
          ],
        ),
      ),
    );
  }
}
