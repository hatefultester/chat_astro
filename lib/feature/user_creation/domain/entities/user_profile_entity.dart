/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final String birthDate;
  final String birthPlace;
  final String birthTime;
  final String userLanguage;

  const UserInfo({required this.userLanguage, required this.birthDate, required this.birthPlace, required this.birthTime});

  @override
  List<Object?> get props => [birthDate, birthPlace, birthTime];
}
