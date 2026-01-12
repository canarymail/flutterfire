// ignore_for_file: require_trailing_commas
// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io' show Platform;

import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart'
    hide MethodChannelFirebaseApp, MethodChannelFirebase;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform, visibleForTesting;

export 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart'
    show FirebaseOptions, defaultFirebaseAppName, FirebaseException;

part 'src/firebase.dart';
part 'src/firebase_app.dart';
part 'src/platforms/firebase_core_windows_stub.dart';
part 'src/port_mapping.dart';
