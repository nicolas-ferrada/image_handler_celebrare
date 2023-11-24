import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final File image;
  const DisplayImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 400,
        width: double.infinity,
        child: Image.file(image, fit: BoxFit.contain),
      ),
    );
  }
}
