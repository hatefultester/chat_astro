/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/core/services/impl/cache_service_impl.dart';
import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {

  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(CacheServiceImpl.to.userProfileData?.chatResponse ?? 'DATA NOT FOUND',
        style: const TextStyle(
          color: Colors.white, fontSize: 20,
        ),),
      ),
    );
  }
}

