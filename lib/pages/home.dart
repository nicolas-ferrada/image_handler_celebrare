import 'dart:io';

import 'package:celebrare/styles/app_color.dart';
import 'package:celebrare/widgets/custom_app_bar.dart';
import 'package:celebrare/widgets/custom_container.dart';
import 'package:celebrare/widgets/frame_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/display_image.dart';
import '../widgets/home_body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? widgetImage;
  String? customFrame;

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
          (widgetImage != null)
              ? DisplayImage(
                  finalImage: widgetImage!,
                  customFrame: customFrame,
                )
              : const SizedBox.shrink(),
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
      onPressed: () async => selectNewImage(),
      child: const Text('Choose from Device'),
    );
  }

  void selectNewImage() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    File? galleryImage = File(pickedImage.path);
    File? finalImage = await cropImage(image: galleryImage);
    if (finalImage == null || !context.mounted) return;
    String? selectedFrame = await showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return SelectFrameDialog(image: finalImage);
      },
    );
    if (selectedFrame != null) {
      setState(() => customFrame = selectedFrame);
    }
    setState(() => widgetImage = finalImage);
  }

  Future<File?> cropImage({
    required File image,
  }) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: image.path,
      uiSettings: [
        AndroidUiSettings(
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
      ],
    );
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }
}
