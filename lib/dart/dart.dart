// ignore_for_file: non_constant_identifier_names

/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: camel_case_types

import 'dart:isolate';

import 'package:collection/collection.dart';
import 'package:general_lib/dart/executable_type/executable.dart';
import 'package:general_lib/dart/pub.dart';
import 'package:universal_io/io.dart';

import 'vm.dart';

// Dart dart = Dart();

class Dart {
  static Vm get vm {
    return Vm();
  }

  static ReceivePort receivePortCurrent() {
    return ReceivePort(Isolate.current.debugName ?? "main");
  }

  static Isolate isolateCurrent({
    SendPort? controlPort,
  }) {
    if (controlPort != null) {
      return Isolate(
        controlPort,
        pauseCapability: Isolate.current.pauseCapability,
        terminateCapability: Isolate.current.terminateCapability,
      );
    }
    return Isolate.current;
  }

  static bool get isRelease => const bool.fromEnvironment('dart.vm.product');
  static bool get isProfile => const bool.fromEnvironment('dart.vm.profile');
  static bool get isDebug => (!Dart.isRelease && !Dart.isProfile);
  static bool get isAndroid => Platform.isAndroid;
  static bool get isFuchsia => Platform.isFuchsia;
  static bool get isIOS => Platform.isIOS;
  static bool get isLinux => Platform.isLinux;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isWindows => Platform.isWindows;
  static bool get isIo => const bool.fromEnvironment('dart.library.io');
  static bool get isWeb => const bool.fromEnvironment('dart.library.js_util');

  static bool get isMobile => Dart.isAndroid || Dart.isIOS;
  static bool get isDesktop =>
      Dart.isLinux || Dart.isMacOS || Dart.isWindows || Dart.isFuchsia;

  static Map<String, String> get environment => Platform.environment;

  static String get executable => Platform.executable;

  static List<String> get executableArguments => Platform.executableArguments;

  static String get localHostname => Platform.localHostname;

  static String get localeName => Platform.localeName;

  static String get operatingSystem => Platform.operatingSystem;

  static String get operatingSystemVersion => Platform.operatingSystemVersion;

  static String? get packageConfig => Platform.packageConfig;

  static String get pathSeparator => Platform.pathSeparator;

  static String get resolvedExecutable => Platform.resolvedExecutable;

  static int get numberOfProcessors => Platform.numberOfProcessors;

  static String get version => Platform.version;

  static Pub get pub => Pub();

  static Future<String?> networkLocalIpAddres() async {
    final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4, includeLinkLocal: true);
    try {
      NetworkInterface? interface = interfaces.singleWhereOrNull((element) =>
          RegExp("^(wl)", caseSensitive: false).hasMatch(element.name));
      if (interface != null) {
        return interface.addresses.first.address;
      }
      try {
        NetworkInterface interface =
            interfaces.firstWhere((element) => element.name == "eth0");
        return interface.addresses.first.address;
      } catch (e) {
        // Try any other connection next
        try {
          NetworkInterface interface = interfaces
              .firstWhere((element) => !(["wlan0"].contains(element.name)));
          return interface.addresses.first.address;
        } catch (ex) {
          return null;
        }
      }
    } catch (ex) {
      try {
        NetworkInterface interface =
            interfaces.firstWhere((element) => element.name == "eth0");
        return interface.addresses.first.address;
      } catch (e) {
        // Try any other connection next
        try {
          NetworkInterface interface = interfaces
              .firstWhere((element) => !(["wlan0"].contains(element.name)));
          return interface.addresses.first.address;
        } catch (ex) {
          return null;
        }
      }
    }
  }

  static Uri get script {
    return Platform.script;
  }

  static ExecutableType get executable_type {
    return executableType();
  }
}
