/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContextWrapper {
  BuildContext get context => Get.context!;
  BuildContext get overlayContext => Get.overlayContext!;
}