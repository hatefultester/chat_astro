/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';

const List<String> specialCharacters = [
  '♈ ♉', '♊ ♋ ♌ ♍', '♎ ♏', '♐'
];

class UserCreationSpecialSymbolsWidget extends StatelessWidget {
  const UserCreationSpecialSymbolsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        for(int i = 0; i < specialCharacters.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                specialCharacters[i],
                style: const TextStyle(
                    fontSize: 32,
                ),
              ),
            ),
          ),
        const Spacer(),
      ],
    );
  }
}
