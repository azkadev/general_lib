// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:io_universe/io_universe.dart';
import 'dart:typed_data';

class GeneralSocketMessageData {
  final String socket_id;
  final String ipAddres;
  final Uint8List data;
  GeneralSocketMessageData({
    required this.socket_id,
    required this.ipAddres,
    required this.data,
  });
}

class GeneralSocketData {
  final String socket_id;
  final String multiCastGroup;
  final int port;
  late final RawDatagramSocket _socket;
  bool is_initialized = false;
  GeneralSocketData({
    required this.port,
    required this.socket_id,
    required this.multiCastGroup,
  });

  Future<void> ensureInitiaLized({
    required RawDatagramSocket socket,
    required NetworkInterface networkInterface,
    required FutureOr<void> Function(
            GeneralSocketMessageData generalSocketMessageData)
        onMessage,
    required void Function() onDone,
  }) async {
    if (is_initialized) {
      return;
    }
    _socket = socket;

    socket.joinMulticast(
      InternetAddress(multiCastGroup),
      networkInterface,
    );

    socket.listen(
      (e) async {
        final Datagram? datagram = socket.receive();
        if (datagram == null) {
          return;
        }
        onMessage(GeneralSocketMessageData(
          socket_id: socket_id,
          ipAddres: datagram.address.address,
          data: datagram.data,
        ));
      },
      onDone: () {
        onDone();
      },
    );
    is_initialized = true;
  }

  bool close() {
    if (is_initialized == false) {
      return false;
    }
    _socket.close();
    return true;
  }

  int sendRaw({
    required List<int> buffer,
  }) {
    if (is_initialized == false) {
      return 0;
    }
    return _socket.send(buffer, InternetAddress(multiCastGroup), port);
  }

  int sendText({
    required String value,
  }) {
    return sendRaw(buffer: utf8.encode(value));
  }

  int sendJson({
    required Map value,
  }) {
    return sendRaw(buffer: utf8.encode(json.encode(value)));
  }
}
