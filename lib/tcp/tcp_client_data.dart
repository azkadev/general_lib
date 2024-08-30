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

import 'package:general_lib/scheme/socket_connection.dart';
// import 'package:general_lib/scheme/scheme.dart';
import 'package:universal_io/io.dart';

abstract class TcpSocketClientData {
  late Socket socket;
  dynamic host;
  int port;
  dynamic sourceAddress;
  int sourcePort = 0;
  Duration? timeout;
  bool isConnect = false;
  Map connect_data = {};
  late Duration ping_interval;
  TcpSocketClientData({
    required this.host,
    required this.port,
    this.sourceAddress,
    this.sourcePort = 0,
    this.timeout,
    Map? connectData,
    Duration? pingInterval,
  });

  Future<void> connect({
    // void Function(dynamic data)? onDataUpdate,
    // void Function(Map data)? onSocketConnection,
    required FutureOr<void> Function(Uint8List data) onSocketData,
    required FutureOr<void> Function(SocketConnection socketConnection) onSocketConnection,
    Duration delayDuration = const Duration(milliseconds: 500),
  }) async {
    return;
  }

  Future<void> send({
    required List<int> value,
    Duration durationTimeOut = const Duration(minutes: 1),
    Duration durationDelay = const Duration(milliseconds: 1),
  }) async {
    return;
  }

  void sendSync({
    required List<int> value,
    Duration durationTimeOut = const Duration(minutes: 1),
  }) {
    return;
  }
}
