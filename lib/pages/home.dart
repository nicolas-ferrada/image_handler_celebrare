import 'package:celebrare/styles/app_color.dart';
import 'package:celebrare/widgets/custom_app_bar.dart';
import 'package:celebrare/widgets/custom_container.dart';
import 'package:flutter/material.dart';

import '../widgets/home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: HomeBody(
        childrenPadding: 16,
        children: [
          CustomContainer(
            children: [
              uploadImageText(),
              const SizedBox(height: 8),
              chooseFromDeviceButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget uploadImageText() {
    return const Text(
      'Upload Image',
      style: TextStyle(color: AppColor.grey),
    );
  }

  Widget chooseFromDeviceButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.teal,
        minimumSize: const Size(180, 40),
      ),
      onPressed: () {
        
      },
      child: const Text('Choose from Device'),
    );
  }
}
