/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


const Color loadingBarColor = Color.fromARGB(255, 255, 140, 105);
const Color textColor = Color.fromARGB(255, 255, 150, 38);

class UserDataGenerationLoadingWidget extends StatelessWidget {
  const UserDataGenerationLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoadingAnimationWidget.dotsTriangle(
            color: loadingBarColor,
            size: 70,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('user_data_generation_loading',
            style: TextStyle(fontSize: 20, color: textColor),
          )
        ],
      ),
    );
  }
}

