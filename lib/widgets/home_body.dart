import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  final List<Widget> children;
  final double childrenPadding;
  const HomeBody({
    super.key,
    required this.children,
    required this.childrenPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(childrenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
