import 'package:celebrare/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: exitAppIcon(),
      title: const Text('Add Image / Icon'),
      titleTextStyle: const TextStyle(color: AppColor.grey, fontSize: 24),
      leadingWidth: 65,
      centerTitle: true,
      elevation: 2,
      backgroundColor: Colors.white,
    );
  }

  Widget exitAppIcon() {
    return IconButton(
      onPressed: () => SystemNavigator.pop(),
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 30,
        color: AppColor.grey,
      ),
    );
  }
}
