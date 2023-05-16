/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../feature/user_creation/domain/entities/user_profile_data.dart';
import '../session_service.dart';

class SessionServiceImpl extends GetxService implements SessionService {
  static SessionServiceImpl get to => Get.find();

  Locale? locale;

  UserProfileData? userProfileData;

  final Connectivity _connectivity = Connectivity();

  Stream<ConnectivityResult> get connectivityStream =>
      _connectivity.onConnectivityChanged;

  @override
  Future<bool> get isConnected async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<void> clearSession() async {
    userProfileData = null;
  }
}
