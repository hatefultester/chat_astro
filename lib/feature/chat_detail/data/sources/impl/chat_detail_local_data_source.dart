/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */
import 'package:chat_astro/feature/user_creation/domain/entities/user_profile_data.dart';
import 'package:logger/logger.dart';

import '../../../../../core/services/impl/session_service_impl.dart';
import '../chat_detail_local_data_source.dart';

class ChatDetailLocalDataSourceImpl implements ChatDetailLocalDataSource {
  final Logger _logger;
  final SessionServiceImpl _sessionServiceImpl;

  ChatDetailLocalDataSourceImpl(
      {required SessionServiceImpl sessionServiceImpl, required Logger logger})
      : _sessionServiceImpl = sessionServiceImpl,
        _logger = logger;

  @override
  Future<UserProfile> getUserProfile() async {
    _logger.i('getting userProfile data from Session Storage');
    try {
      UserProfile userProfile = _sessionServiceImpl.userProfileData!;
      return userProfile;
    } on Exception catch (e) {
      _logger
          .e('Exception caught during get User profile data : ${e.toString()}');
      rethrow;
    }
  }
}
