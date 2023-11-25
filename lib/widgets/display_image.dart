import 'dart:io';

import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class DisplayImage extends StatelessWidget {
  final File image;
  final String? customShape;
  final bool? expandsImage;
  const DisplayImage({
    super.key,
    required this.image,
    this.customShape,
    this.expandsImage,
  });

  @override
  Widget build(BuildContext context) {
    return (customShape == null) ? imageWidget() : customShapeImageWidget();
  }

  Widget imageWidget() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 400,
        width: double.infinity,
        child: Image.file(
          image,
          fit: (expandsImage != null && expandsImage == true)
              ? BoxFit.fill
              : BoxFit.contain,
        ),
      ),
    );
  }

  Widget customShapeImageWidget() {
    return WidgetMask(
      blendMode: BlendMode.dstATop,
      childSaveLayer: true,
      mask: Image.asset(
        customShape!,
        fit: BoxFit.contain,
      ),
      child: DisplayImage(
        image: image,
        expandsImage: true,
      ),
    );
  }
}
