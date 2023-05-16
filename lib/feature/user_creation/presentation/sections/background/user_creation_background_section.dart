/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/impl/user_data_generation_controller_impl.dart';
import '../widgets/user_data_generation_special_symbols_widget.dart';
import '../widgets/user_data_generation_title_widget.dart';

class UserDataGenerationBackgroundSection
    extends GetView<UserDataGenerationControllerImpl> {
  const UserDataGenerationBackgroundSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/backgrounds/user_data_generation_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Row(
              children: const [
                Expanded(
                  flex: 3,
                  child: UserDataGenerationTitleWidget(),
                ),
                Expanded(
                    flex: 2, child: UserDataGenerationSpecialSymbolsWidget())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
