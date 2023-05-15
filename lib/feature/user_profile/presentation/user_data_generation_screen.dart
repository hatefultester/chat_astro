import 'package:chat_astro/feature/user_profile/presentation/controllers/impl/user_data_generation_controller_impl.dart';
import 'package:chat_astro/feature/user_profile/presentation/sections/user_data_generation_background_section.dart';
import 'package:chat_astro/feature/user_profile/presentation/sections/user_data_generation_submit_form_section.dart';
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
          body: Column(
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
          ),
        );
      },
    );
  }
}
