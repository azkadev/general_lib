// ignore_for_file: unused_import

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

// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:general_lib/dart/dart.dart';
import 'package:general_lib/extension/dynamic.dart';
import 'package:http/http.dart';
import "package:path/path.dart" as path;
import 'package:io_universe/io_universe.dart';

enum DownloadFileCategory {
  application,
  compressed,
  programs,
  video,
  unknown,
}

class DownloadClientData {
  File file;
  Uri uri;
  ByteStream byteStream;
  late StreamSubscription<List<int>> stream;
  Completer<bool> completer;
  DateTime date_time_start;
  void Function(List<int> chunk) onData;
  FutureOr<void> Function(DownloadClientData downloadClientData) onDone;
  bool is_failed;
  DownloadClientData({
    required this.date_time_start,
    required this.file,
    required this.uri,
    required this.byteStream,
    required this.completer,
    required this.is_failed,
    required this.onData,
    required this.onDone,
  }) {
    stream = byteStream.listen(
      onData,
      onDone: () async {
        await onDone(this);
      },
    );
  }

  bool is_complete() {
    return completer.isCompleted;
  }

  bool is_paused() {
    return stream.isPaused;
  }

  void pause() {
    stream.pause();
  }

  void resume() {
    stream.resume();
  }

  Future<void> cancel() async {
    await stream.cancel();
  }
}

class DownloadClient {
  final Client httpClient;
  Directory directoryDownload = Directory("");

  DownloadClient({
    Client? httpClient,
    Directory? directoryDownload,
  })  : httpClient = httpClient ?? Client(),
        directoryDownload = directoryDownload ??
            Directory(path.join(Directory.current.path, "temp")) {
    checkDir(directoryDownload: this.directoryDownload);
  }

  final List<DownloadClientData> downloadClientDatas = [];
  DownloadClientData? getDownloadClientData({
    required Uri uri,
  }) {
    return downloadClientDatas
        .firstWhereOrNull((element) => element.uri == uri);
  }

  void deleteDownloadClientData({
    required Uri uri,
  }) {
    // download_client_datas.remo;
    downloadClientDatas.removeWhere((element) => element.uri == uri);
  }

  void checkDir({
    required Directory directoryDownload,
  }) {
    if (Dart.isWeb) {
      return;
    }
    if (directoryDownload.existsSync() == false) {
      directoryDownload.createSync(recursive: true);
    }
  }

  static int getContentLength({
    required Map headers,
  }) {
    return int.tryParse(headers['content-length'] ?? "0") ?? 0;
  }

  static String? getContentName({
    required Map headers,
  }) {
    try {
      final res = (headers["content-disposition"] as String).split(";");

      for (final element in res) {
        if (element.contains('filename')) {
          final result =
              element.substring(element.indexOf("=") + 2, element.length - 1);
          try {
            return Uri.decodeFull(result);
          } catch (e) {
            try {
              return json.decode(result);
            } catch (e) {
              return result;
            }
          }
        }
      }
    } catch (e) {}
    return null;
  }

  Future<DownloadClientData> downloadRaw({
    required Uri url,
    required Directory? directoryDownload,
    required String? newFileName,
    Map<String, String>? headers,
    required bool isAutoDeleteDownloadClientData,
    required FutureOr<dynamic> Function(double proggres, File file) onProggres,
    required FutureOr<dynamic> Function(DownloadClientData downloadClientData)
        onDone,
  }) async {
    directoryDownload ??= this.directoryDownload;
    checkDir(directoryDownload: directoryDownload);
    Response response_head = await httpClient.head(url, headers: headers);
    // response_head.printPretty();

    int downloadUntil = getContentLength(headers: response_head.headers);

    String new_file_name = [
          newFileName,
          getContentName(headers: response_head.headers),
          url.pathSegments.lastOrNull
        ].firstWhereOrNull(
            (element) => (element != null && element.trim().isNotEmpty)) ??
        "${url.toString()}";

    File file = File(path.join(directoryDownload.path, new_file_name));

    int downloadFrom = await Future(() async {
      if (file.existsSync()) {
        return await file.length();
      } else {
        await file.create(recursive: true);
      }
      return 0;
    });
    Completer<bool> completer = Completer<bool>();
    if (downloadUntil != 0) {
      if (downloadFrom == downloadUntil) {
        return DownloadClientData(
          date_time_start: DateTime.now(),
          file: file,
          uri: url,
          byteStream: ByteStream.fromBytes([]),
          completer: completer,
          is_failed: false,
          onData: (chunk) {},
          onDone: (downloadClientData) async {
            completer.complete(true);
            if (isAutoDeleteDownloadClientData) {
              deleteDownloadClientData(uri: url);
            }
            await onDone(downloadClientData);
          },
        );
      }
    }

    int downloaded = downloadFrom;

    Request request = Request('GET', (url));
    request.headers.addAll(
      {
        'Range': 'bytes=${downloadFrom}-${downloadUntil}',
      },
    );

    request.headers.addAll(headers ?? {});

    StreamedResponse streamedResponse = await httpClient.send(request);

    RandomAccessFile randomAccessFile = await file.open(mode: FileMode.append);

    return DownloadClientData(
      date_time_start: DateTime.now(),
      file: file,
      uri: url,
      byteStream: streamedResponse.stream,
      completer: completer,
      is_failed: false,
      onData: (chunk) {
        double proggres = (downloaded / (downloadUntil) * 100);
        try {
          onProggres(proggres, file);
        } catch (e) {}
        randomAccessFile.setPositionSync(downloaded);
        randomAccessFile.writeFromSync(chunk);
        downloaded += chunk.length;
        if (downloaded == downloadUntil) {
          double proggres = (downloaded / (downloadUntil) * 100);
          try {
            onProggres(proggres, file);
          } catch (e) {}
        }
      },
      onDone: (downloadClientData) async {
        randomAccessFile.closeSync();
        completer.complete(true);

        if (isAutoDeleteDownloadClientData) {
          deleteDownloadClientData(uri: url);
        }

        await onDone(downloadClientData);
      },
    );
  }

  Future<DownloadClientData> download({
    required Uri url,
    Directory? directoryDownload,
    String? newFileName,
    bool isAutoDeleteDownloadClientData = true,
    required FutureOr<dynamic> Function(double proggres, File file) onProggres,
    required FutureOr<dynamic> Function(DownloadClientData downloadClientData)
        onDone,
  }) async {
    DownloadClientData? downloadClientData = getDownloadClientData(uri: url);

    if (downloadClientData == null) {
      downloadClientData = await downloadRaw(
        url: url,
        directoryDownload: directoryDownload,
        newFileName: newFileName,
        isAutoDeleteDownloadClientData: isAutoDeleteDownloadClientData,
        onProggres: onProggres,
        onDone: onDone,
      );

      downloadClientDatas.add(downloadClientData);
      return downloadClientData;
    } else {
      if (downloadClientData.is_complete()) {
        if (isAutoDeleteDownloadClientData) {
          deleteDownloadClientData(uri: url);
        }
      }
      return downloadClientData;
    }
  }
}
