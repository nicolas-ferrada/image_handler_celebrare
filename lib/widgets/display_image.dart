import 'dart:io';

import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class DisplayImage extends StatelessWidget {
  final File finalImage;
  final String? customFrame;
  const DisplayImage({
    super.key,
    required this.finalImage,
    this.customFrame,
  });

  @override
  Widget build(BuildContext context) {
    return (customFrame != null) ? customShapeImageWidget() : imageWidget();
  }

  Widget imageWidget() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 400,
        width: double.infinity,
        child: Image.file(
          finalImage,
          fit: (customFrame != null) ? BoxFit.fill : BoxFit.contain,
        ),
      ),
    );
  }

  Widget customShapeImageWidget() {
    return WidgetMask(
      blendMode: BlendMode.dstATop,
      childSaveLayer: true,
      mask: Image.asset(
        customFrame!,
        fit: BoxFit.contain,
      ),
      child: imageWidget(),
    );
  }
}
