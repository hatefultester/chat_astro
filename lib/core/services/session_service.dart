/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

abstract class SessionService {
  Future<bool> get isConnected;
  Future<void> clearSession();
}
