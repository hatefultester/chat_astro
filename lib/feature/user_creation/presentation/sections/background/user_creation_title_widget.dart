/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';

const Color titleColor = Color.fromARGB(255, 255, 140, 105);
const Color borderColor = Color.fromARGB(255, 255, 150, 38);

class UserCreationTitleWidget extends StatelessWidget {
  const UserCreationTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 80),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  const Text(
                      'Astro',
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 50,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: borderColor,
                        width: 2.5
                      )
                    ),
                    child: const Text(
                      'Chat app',
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 50,
                       // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        const Spacer(),
      ],
    );
  }
}
