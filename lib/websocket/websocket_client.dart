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
// ignore_for_file: unused_local_variable, non_constant_identifier_names, empty_catches

import 'dart:async';

import 'package:general_lib/enum/socket_connection_type.dart';
import 'package:general_lib/scheme/socket_connection.dart';
import 'package:general_lib/scheme/socket_error.dart';
// import 'package:general_lib/scheme/scheme.dart';
import 'package:io_universe/io_universe.dart';

class WebSocketClient {
  String url;
  Iterable<String>? protocols;
  Map<String, dynamic>? headers;
  Duration? pingInterval;
  bool isConnect = false;
  late WebSocket socket;

  String event_name_update = "update";
  String event_name_connection = "connection";
  String event_name_invoke = "invoke";
  CompressionOptions compression;
  HttpClient? customClient;
  WebSocketClient(
    this.url, {
    this.protocols,
    this.headers,
    this.compression = CompressionOptions.compressionDefault,
    this.customClient,
    this.pingInterval,
    String eventNameUpdate = "update",
    String eventNameConnection = "connection",
    String eventNameInvoke = "invoke",
  }) {
    event_name_update = eventNameUpdate;
    event_name_connection = eventNameConnection;
    event_name_invoke = eventNameInvoke;
  }

  Future<void> connect({
    required Future<void> Function(dynamic data) onSocketData,
    required FutureOr<void> Function(SocketConnection socketConnection)
        onSocketConnection,
    Duration delayDuration = const Duration(milliseconds: 500),
  }) async {
    while (true) {
      await Future.delayed(delayDuration);
      if (isConnect == false) {
        try {
          socket = await WebSocket.connect(
            url,
            protocols: protocols,
            headers: headers,
            compression: compression,
            customClient: customClient,
          );
          socket.pingInterval = pingInterval;
          StreamSubscription scoketListen = socket.listen(
            (event) async {
              await onSocketData(event);
              return;
            },
            onError: (a, b) {
              isConnect = false;
            },
            onDone: () async {
              isConnect = false;

              await onSocketConnection(SocketConnection({
                "@type": "socketConnection",
                "status": SocketConnectionType.disconnect.name,
              }));
              Timer.periodic(pingInterval ?? Duration(seconds: 2),
                  (timer) async {
                if (isConnect) {
                  timer.cancel();
                  return;
                }
                try {
                  await connect(
                      onSocketData: onSocketData,
                      onSocketConnection: onSocketConnection,
                      delayDuration: delayDuration);
                } catch (e) {}
              });
            },
            cancelOnError: true,
          );
          isConnect = true;

          await onSocketConnection(SocketConnection({
            "@type": "socketConnection",
            "status": SocketConnectionType.connected.name,
          }));
          return;
        } catch (e) {
          isConnect = false;
          if (e is SocketException) {
            isConnect = false;
          }
          try {
            await socket.done;
            await socket.close();

            await onSocketConnection(SocketConnection({
              "@type": "socketConnection",
              "status": SocketConnectionType.reconnection.name,
            }));
            await connect(
              onSocketData: onSocketData,
              onSocketConnection: onSocketConnection,
              delayDuration: delayDuration,
            );
          } catch (e) {
            await onSocketConnection(SocketConnection({
              "@type": "socketConnection",
              "status": SocketConnectionType.reconnection.name,
            }));
          }
        }
      }
    }
  }

  Future<void> add({
    required dynamic value,
    Duration durationTimeOut = const Duration(minutes: 1),
    Duration durationDelay = const Duration(milliseconds: 1),
  }) async {
    DateTime dateTime = DateTime.now().add(durationTimeOut);
    await Future.delayed(durationDelay);
    while (true) {
      await Future.delayed(durationDelay);
      if (dateTime.isBefore(DateTime.now())) {
        throw SocketError({
          "@type": "socketError",
          "message": "send_data_time_out",
          "description": "Send Data time out "
        });
      }
      if (isConnect) {
        break;
      }
    }
    return socket.add(value);
  }

  Future<void> send({
    required List<int> value,
    Duration durationTimeOut = const Duration(minutes: 1),
    Duration durationDelay = const Duration(milliseconds: 1),
  }) async {
    await Future.delayed(durationDelay);
    DateTime dateTime = DateTime.now().add(durationTimeOut);
    while (true) {
      await Future.delayed(durationDelay);
      if (dateTime.isBefore(DateTime.now())) {
        throw SocketError({
          "@type": "socketError",
          "message": "send_data_time_out",
          "description": "Send Data time out "
        });
      }
      if (isConnect) {
        break;
      }
    }
    return socket.add(value);
  }

  void sendSync({
    required List<int> value,
    Duration durationTimeOut = const Duration(minutes: 1),
    Duration durationDelay = const Duration(milliseconds: 1),
  }) {
    DateTime dateTime = DateTime.now().add(durationTimeOut);
    sleep(durationDelay);
    while (true) {
      sleep(durationDelay);

      if (dateTime.isBefore(DateTime.now())) {
        throw SocketError({
          "@type": "socketError",
          "message": "send_data_time_out",
          "description": "Send Data time out "
        });
      }

      if (isConnect) {
        break;
      }
    }
    return socket.add(value);
  }
}
