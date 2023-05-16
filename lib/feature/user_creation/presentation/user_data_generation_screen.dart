/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'controllers/impl/user_creation_controller_impl.dart';
import 'sections/background/user_creation_background_section.dart';
import 'sections/form/user_creation_form_section.dart';
import 'sections/loading/user_creation_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCreationScreen extends StatelessWidget {
  const UserCreationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserCreationControllerImpl>(
      init: UserCreationControllerImpl(),
      builder: (UserCreationControllerImpl controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Obx(() {
            if (controller.submitResponseLoading.value) {
              return const Center(
                child: UserCreationLoadingWidget(
                  text: 'user_data_generation_loading',
                ),
              );
            }

            return Column(
              children: const [
                Expanded(
                  flex: 3,
                  child: UserCreationBackgroundSection(),
                ),
                Expanded(
                  flex: 3,
                  child: UserCreationFormSection(),
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
