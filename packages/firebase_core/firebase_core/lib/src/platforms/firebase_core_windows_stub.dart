// ignore_for_file: require_trailing_commas
// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of '../../firebase_core.dart';

/// Windows stub implementation of [FirebasePlatform].
///
/// This provides no-op implementations that don't use the C++ SDK,
/// avoiding linker compatibility issues on Windows.
class FirebaseCoreWindowsStub extends FirebasePlatform {
  /// Returns a stub instance to allow the platform interface to access
  /// the class instance statically.
  static FirebaseCoreWindowsStub get instance {
    return FirebaseCoreWindowsStub._();
  }

  /// Internal stub class initializer.
  FirebaseCoreWindowsStub._() : super();

  /// Tracks local [FirebaseAppPlatform] instances.
  @visibleForTesting
  static Map<String, FirebaseAppPlatform> appInstances = {};

  /// Returns the created [FirebaseAppPlatform] instances.
  @override
  List<FirebaseAppPlatform> get apps {
    return appInstances.values.toList(growable: false);
  }

  /// Initializes a Firebase app instance (stub - no-op).
  ///
  /// Returns a stub app instance that doesn't use the C++ SDK.
  @override
  Future<FirebaseAppPlatform> initializeApp({
    String? name,
    FirebaseOptions? options,
  }) async {
    final appName = name ?? defaultFirebaseAppName;

    // If app already exists, return it
    if (appInstances.containsKey(appName)) {
      return appInstances[appName]!;
    }

    // Create a stub app instance
    final stubApp = FirebaseAppWindowsStub(
      appName,
      options ?? FirebaseOptions(
        apiKey: '',
        appId: '',
        messagingSenderId: '',
        projectId: '',
      ),
    );

    appInstances[appName] = stubApp;
    return stubApp;
  }

  /// Returns a [FirebaseAppPlatform] by [name].
  ///
  /// Returns a stub app even if not initialized (stub behavior).
  @override
  FirebaseAppPlatform app([String name = defaultFirebaseAppName]) {
    if (appInstances.containsKey(name)) {
      return appInstances[name]!;
    }

    // Return a stub app even if not initialized (stub behavior)
    return FirebaseAppWindowsStub(
      name,
      FirebaseOptions(
        apiKey: '',
        appId: '',
        messagingSenderId: '',
        projectId: '',
      ),
    );
  }
}

/// Windows stub implementation of [FirebaseAppPlatform].
///
/// This provides no-op implementations that don't use the C++ SDK.
class FirebaseAppWindowsStub extends FirebaseAppPlatform {
  FirebaseAppWindowsStub(super.name, super.options);

  bool _isAutomaticDataCollectionEnabled = false;
  bool _isDeleted = false;

  /// Returns whether this instance is the default Firebase app.
  bool get _isDefault => name == defaultFirebaseAppName;

  /// Returns whether automatic data collection enabled or disabled.
  @override
  bool get isAutomaticDataCollectionEnabled {
    return _isAutomaticDataCollectionEnabled;
  }

  /// Deletes the current Firebase app instance (stub - no-op).
  @override
  Future<void> delete() async {
    if (_isDefault) {
      // Don't allow deleting default app
      return;
    }

    if (_isDeleted) {
      return;
    }

    FirebaseCoreWindowsStub.appInstances.remove(name);
    _isDeleted = true;
  }

  /// Sets whether automatic data collection is enabled or disabled (stub - no-op).
  @override
  Future<void> setAutomaticDataCollectionEnabled(bool enabled) async {
    _isAutomaticDataCollectionEnabled = enabled;
  }

  /// Sets whether automatic resource management is enabled or disabled (stub - no-op).
  @override
  Future<void> setAutomaticResourceManagementEnabled(bool enabled) async {
    // Stub implementation - no-op
  }
}
