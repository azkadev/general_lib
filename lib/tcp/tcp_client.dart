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
// ignore_for_file: non_constant_identifier_names, unused_local_variable, empty_catches

import 'dart:async';
import 'dart:typed_data';

import 'package:general_lib/enum/socket_connection_type.dart';
import 'package:general_lib/scheme/socket_connection.dart';
import 'package:general_lib/scheme/socket_error.dart';
import 'package:general_lib/tcp/tcp_client_data.dart';
// import 'package:general_lib/scheme/scheme.dart';
import 'package:io_universe/io_universe.dart';
/// GeneralLib
class TcpSocketClient implements TcpSocketClientData {
  @override
  late Socket socket;
  @override
  dynamic host;
  @override
  int port;
  @override
  dynamic sourceAddress;
  @override
  int sourcePort = 0;
  @override
  Duration? timeout;
  @override
  bool isConnect = false;
  @override
  Map connect_data = {};
  @override
  late Duration ping_interval;
  /// GeneralLib
  TcpSocketClient({
    required this.host,
    required this.port,
    this.sourceAddress,
    this.sourcePort = 0,
    this.timeout,
    Map? connectData,
    Duration? pingInterval,
  }) {
    pingInterval ??= Duration(seconds: 1);
    ping_interval = pingInterval;
    if (connectData != null) {
      connect_data.addAll(connect_data);
    }
  }

  @override
  Future<void> connect({
    // void Function(dynamic data)? onDataUpdate,
    // void Function(Map data)? onSocketConnection,
    required FutureOr<void> Function(Uint8List data) onSocketData,
    required FutureOr<void> Function(SocketConnection socketConnection)
        onSocketConnection,
    Duration delayDuration = const Duration(milliseconds: 500),
  }) async {
    while (true) {
      await Future.delayed(Duration(milliseconds: 500));
      if (isConnect == false) {
        try {
          socket = await Socket.connect(
            host,
            port,
            sourceAddress: sourceAddress,
            sourcePort: sourcePort,
            timeout: timeout,
          );
          StreamSubscription<Uint8List> listen = socket.listen(
            (Uint8List event) async {
              await onSocketData(event);
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
              await onSocketConnection(SocketConnection({
                "@type": "socketConnection",
                "status": SocketConnectionType.reconnection.name,
              }));
              // await connect(onSocketData: onSocketData, onSocketConnection: onSocketConnection);
              Timer.periodic(ping_interval, (timer) async {
                if (isConnect) {
                  timer.cancel();

                  return;
                }
                try {
                  await connect(
                      onSocketData: onSocketData,
                      onSocketConnection: onSocketConnection);
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
          break;
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

  @override
  Future<void> send({
    required List<int> value,
    Duration durationTimeOut = const Duration(minutes: 1),
    Duration durationDelay = const Duration(milliseconds: 1),
  }) async {
    DateTime dateTime = DateTime.now().add(durationTimeOut);
    await Future.delayed(durationDelay);
    while (true) {
      await Future.delayed(Duration(microseconds: 10));
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

  @override
  void sendSync({
    required List<int> value,
    Duration durationTimeOut = const Duration(minutes: 1),
  }) {
    DateTime dateTime = DateTime.now().add(durationTimeOut);
    while (true) {
      sleep(Duration(microseconds: 10));
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
