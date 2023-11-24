import 'package:celebrare/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: HomeBody(
        childrenPadding: 8,
        children: [],
      ),
    );
  }
}
