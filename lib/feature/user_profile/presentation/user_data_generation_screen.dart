/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'controllers/impl/user_data_generation_controller_impl.dart';
import 'sections/user_data_generation_background_section.dart';
import 'sections/user_data_generation_submit_form_section.dart';
import 'widgets/user_data_generation_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDataGenerationScreen extends StatelessWidget {
  const UserDataGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDataGenerationControllerImpl>(
      init: UserDataGenerationControllerImpl(),
      builder: (UserDataGenerationControllerImpl controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Obx(() {
            if (controller.submitResponseLoading.value) {
              return const Center(
                child: UserDataGenerationLoadingWidget(),
              );
            }

            return Column(
              children: const [
                Expanded(
                  flex: 3,
                  child: UserDataGenerationBackgroundSection(),
                ),
                Expanded(
                  flex: 3,
                  child: UserDataGenerationSubmitFormSection(),
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
