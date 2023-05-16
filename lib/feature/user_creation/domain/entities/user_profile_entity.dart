/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable {
  final String birthDate;
  final String birthPlace;
  final String birthTime;

  const UserProfileEntity({required this.birthDate, required this.birthPlace, required this.birthTime});

  @override
  List<Object?> get props => [birthDate, birthPlace, birthTime];
}
