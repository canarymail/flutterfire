// ignore_for_file: require_trailing_commas
// Copyright 2020, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

part of '../../firebase_messaging.dart';

/// Windows stub implementation of [FirebaseMessagingPlatform].
///
/// This provides no-op implementations that don't use the C++ SDK,
/// avoiding linker compatibility issues on Windows.
class FirebaseMessagingWindowsStub extends FirebaseMessagingPlatform {
  /// Create an instance using [app].
  FirebaseMessagingWindowsStub({super.appInstance});

  /// Returns a stub instance to allow the platform interface to access
  /// the class instance statically.
  static FirebaseMessagingWindowsStub get instance {
    return FirebaseMessagingWindowsStub._();
  }

  /// Internal stub class initializer.
  ///
  /// When the user code calls a messaging method, the real instance is
  /// then initialized via the [delegateFor] method.
  FirebaseMessagingWindowsStub._() : super(appInstance: null);

  /// Create a stub instance with a [FirebaseApp] using an existing instance.
  factory FirebaseMessagingWindowsStub.instanceFor({
    required FirebaseApp app,
    required Map<dynamic, dynamic> pluginConstants,
  }) {
    return FirebaseMessagingWindowsStub(appInstance: app)
        .setInitialValues(
          isAutoInitEnabled: pluginConstants['AUTO_INIT_ENABLED'] ?? false,
        ) as FirebaseMessagingWindowsStub;
  }

  bool _autoInitEnabled = false;

  // ignore: close_sinks, never closed
  static final StreamController<String> _tokenStreamController =
      StreamController<String>.broadcast();

  @override
  FirebaseMessagingPlatform delegateFor({required FirebaseApp app}) {
    return FirebaseMessagingWindowsStub(appInstance: app);
  }

  @override
  FirebaseMessagingPlatform setInitialValues({bool? isAutoInitEnabled}) {
    _autoInitEnabled = isAutoInitEnabled ?? false;
    return this;
  }

  @override
  bool get isAutoInitEnabled {
    return _autoInitEnabled;
  }

  @override
  Future<RemoteMessage?> getInitialMessage() async {
    // Stub implementation - returns null
    return null;
  }

  @override
  void registerBackgroundMessageHandler(BackgroundMessageHandler handler) {
    // Stub implementation - no-op
  }

  @override
  Future<void> deleteToken() async {
    // Stub implementation - no-op
  }

  @override
  Future<String?> getAPNSToken() async {
    // Stub implementation - returns null (not applicable on Windows)
    return null;
  }

  @override
  Future<String?> getToken({String? vapidKey}) async {
    // Stub implementation - returns null
    return null;
  }

  @override
  Stream<String> get onTokenRefresh {
    // Stub implementation - returns empty stream
    return _tokenStreamController.stream;
  }

  @override
  Future<NotificationSettings> getNotificationSettings() async {
    // Stub implementation - returns default settings
    // Using NotificationSettings with default values
    return const NotificationSettings(
      authorizationStatus: AuthorizationStatus.authorized,
      alert: AppleNotificationSetting.notSupported,
      announcement: AppleNotificationSetting.notSupported,
      badge: AppleNotificationSetting.notSupported,
      carPlay: AppleNotificationSetting.notSupported,
      lockScreen: AppleNotificationSetting.notSupported,
      notificationCenter: AppleNotificationSetting.notSupported,
      showPreviews: AppleShowPreviewSetting.notSupported,
      sound: AppleNotificationSetting.notSupported,
      timeSensitive: AppleNotificationSetting.notSupported,
      criticalAlert: AppleNotificationSetting.notSupported,
      providesAppNotificationSettings: AppleNotificationSetting.notSupported,
    );
  }

  @override
  Future<bool> isSupported() async {
    // Stub implementation - returns false (not supported on Windows)
    return false;
  }

  @override
  Future<NotificationSettings> requestPermission({
    bool alert = true,
    bool announcement = false,
    bool badge = true,
    bool carPlay = false,
    bool criticalAlert = false,
    bool provisional = false,
    bool sound = true,
    bool providesAppNotificationSettings = false,
  }) async {
    // Stub implementation - returns default settings
    return const NotificationSettings(
      authorizationStatus: AuthorizationStatus.authorized,
      alert: AppleNotificationSetting.notSupported,
      announcement: AppleNotificationSetting.notSupported,
      badge: AppleNotificationSetting.notSupported,
      carPlay: AppleNotificationSetting.notSupported,
      lockScreen: AppleNotificationSetting.notSupported,
      notificationCenter: AppleNotificationSetting.notSupported,
      showPreviews: AppleShowPreviewSetting.notSupported,
      sound: AppleNotificationSetting.notSupported,
      timeSensitive: AppleNotificationSetting.notSupported,
      criticalAlert: AppleNotificationSetting.notSupported,
      providesAppNotificationSettings: AppleNotificationSetting.notSupported,
    );
  }

  @override
  Future<void> setAutoInitEnabled(bool enabled) async {
    // Stub implementation - no-op
    _autoInitEnabled = enabled;
  }

  @override
  Future<void> setForegroundNotificationPresentationOptions({
    required bool alert,
    required bool badge,
    required bool sound,
  }) async {
    // Stub implementation - no-op
  }

  @override
  Future<void> subscribeToTopic(String topic) async {
    // Stub implementation - no-op
  }

  @override
  Future<void> unsubscribeFromTopic(String topic) async {
    // Stub implementation - no-op
  }

  @override
  Future<void> setDeliveryMetricsExportToBigQuery(bool enabled) async {
    // Stub implementation - no-op
  }
}
