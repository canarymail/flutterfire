// ignore_for_file: require_trailing_commas
// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart'
    show FirebasePluginPlatform;
import 'package:firebase_messaging_platform_interface/firebase_messaging_platform_interface.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

export 'package:firebase_messaging_platform_interface/firebase_messaging_platform_interface.dart'
    show
        BackgroundMessageHandler,
        AppleShowPreviewSetting,
        AppleNotification,
        AppleNotificationSetting,
        AppleNotificationSound,
        AuthorizationStatus,
        NotificationSettings,
        AndroidNotification,
        AndroidNotificationPriority,
        AndroidNotificationVisibility,
        RemoteMessage,
        RemoteNotification,
        WebNotification;

part 'src/platforms/firebase_messaging_windows_stub.dart';
part 'src/messaging.dart';
