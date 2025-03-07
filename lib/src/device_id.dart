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
import "package:io_universe/io_universe.dart";

/// GeneralLibrary
DeviceId? getDeviceId({bool isGetProductId = false}) {
  if (Platform.isAndroid) {
    ProcessResult res =
        Process.runSync("settings", ["get", "secure", "android_id"]);
    return DeviceId(res);
  }

  if (Platform.isWindows) {
    ProcessResult res = Process.runSync("wmic", ["os", "get", "serialnumber"]);
    return DeviceId(res);
  }

  if (Platform.isLinux) {
    if (isGetProductId) {
      ProcessResult res = Process.runSync("dmidecode", ["-s", "system-uuid"]);
      return DeviceId(res);
    } else {
      ProcessResult res = Process.runSync("cat", ["/etc/machine-id"]);
      return DeviceId(res);
    }
  }
  return null;
}

/// GeneralLibrary
class DeviceId {
  /// GeneralLibrary
  ProcessResult data;

  /// GeneralLibrary
  DeviceId(this.data);

  /// GeneralLibrary
  bool get isError {
    if (data.exitCode != 0) {
      return true;
    }
    return false;
  }

  /// GeneralLibrary
  String get errorMessage {
    return data.stderr.toString().replaceAll(RegExp(r"\n"), "");
  }

  /// GeneralLibrary
  String get deviceId {
    if (Platform.isWindows) {
      return RegExp(r"([a-z0-9]+)-([a-z0-9]+)-([a-z0-9]+)-([a-z0-9]+)",
                  caseSensitive: false)
              .stringMatch(
                  data.stdout.toString().replaceAll(RegExp(r"\n"), "")) ??
          "";
    }
    return data.stdout.toString().replaceAll(RegExp(r"\n"), "");
  }

  /// GeneralLibrary
  Map toJson() {
    if (!isError) {
      return {
        "@type": "device",
        "device_id": deviceId,
      };
    } else {
      return {"@type": "error", "message": errorMessage};
    }
  }
}
