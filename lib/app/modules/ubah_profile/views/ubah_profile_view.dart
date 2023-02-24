import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ubah_profile_controller.dart';

class UbahProfileView extends GetView<UbahProfileController> {
  const UbahProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UbahProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UbahProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
