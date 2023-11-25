import 'dart:io';

import 'package:celebrare/styles/app_color.dart';
import 'package:flutter/material.dart';

import 'display_image.dart';

class SelectFrameDialog extends StatefulWidget {
  final File image;
  const SelectFrameDialog({
    super.key,
    required this.image,
  });

  @override
  State<SelectFrameDialog> createState() => _SelectFrameDialogState();
}

class _SelectFrameDialogState extends State<SelectFrameDialog> {
  late File finalImage;
  String? customShape;

  @override
  void initState() {
    finalImage = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: DisplayImage(
        finalImage: finalImage,
        customFrame: customShape,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            frameButton(
              frame: '',
              function: () {
                setState(
                  () => customShape = null,
                );
              },
              noImage: true,
            ),
            frameButton(
              frame: 'assets/images/user_image_frame_1.png',
              function: () {
                setState(
                  () => customShape = 'assets/images/user_image_frame_1.png',
                );
              },
            ),
            frameButton(
              frame: 'assets/images/user_image_frame_2.png',
              function: () {
                setState(
                  () => customShape = 'assets/images/user_image_frame_2.png',
                );
              },
            ),
            frameButton(
              frame: 'assets/images/user_image_frame_3.png',
              function: () {
                setState(
                  () => customShape = 'assets/images/user_image_frame_3.png',
                );
              },
            ),
            frameButton(
              frame: 'assets/images/user_image_frame_4.png',
              function: () {
                setState(
                  () => customShape = 'assets/images/user_image_frame_4.png',
                );
              },
            ),
          ],
        ),
        useThisImageButton(),
      ],
    );
  }

  Widget frameButton({
    required String frame,
    required Function() function,
    bool? noImage,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 2),
        child: GestureDetector(
          onTap: function,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              height: 30,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: (noImage == null && noImage != true)
                    ? Image.asset(frame, fit: BoxFit.contain)
                    : Text(frame),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget useThisImageButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
            backgroundColor: AppColor.teal,
          ),
          onPressed: () {
            Navigator.pop(context, customShape);
          },
          child: const Text('Use this image'),
        ),
      ),
    );
  }
}
