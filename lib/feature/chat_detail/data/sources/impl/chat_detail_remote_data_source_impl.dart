/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/core/utils/open_ai_utils.dart';
import 'package:logger/logger.dart';

import '../chat_detail_remote_data_source.dart';

class ChatDetailRemoteDataSourceImpl implements ChatDetailRemoteDataSource {
  final Logger _logger;
  final OpenAiUtils _openAiUtils;

  ChatDetailRemoteDataSourceImpl(
      {required OpenAiUtils openAiUtils, required Logger logger})
      : _openAiUtils = openAiUtils,
        _logger = logger;
}
