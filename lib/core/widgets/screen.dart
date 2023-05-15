import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../abstractions/base_controller.dart';

abstract class Screen<Controller extends BaseController> extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  Widget buildScreen(Controller controller, SyncState state, Size size);

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.find<Controller>();
    return Obx(() {
      SyncState state = controller.state.value;
      Size size = MediaQuery.of(context).size;
      return buildScreen(controller, state, size);
    });
  }
}
