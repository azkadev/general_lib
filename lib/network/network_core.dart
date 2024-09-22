// ignore_for_file: non_constant_identifier_names, empty_catches

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:general_lib/general_lib.dart';
import 'socket_data.dart';

class NetworkClientGeneralLib {
  String multiCastGroup;
  int port;
  final Map<String, GeneralSocketData> general_socket_data = {};
  final EventEmitter event_emitter = EventEmitter();
  final String event_update;
  final List<NetworkInterface> network_interface_connecteds = [];
  bool isKeepRunning;
  NetworkClientGeneralLib({
    this.event_update = "update",
    this.multiCastGroup = '224.0.0.167',
    this.port = 5194,
    this.isKeepRunning = true,
  });

  EventEmitterListener on({
    required String eventName,
    Object? context,
    required FutureOr<dynamic> Function(GeneralSocketMessageData generalSocketMessageData) onUpdate,
    FutureOr<dynamic> Function(Object e, StackTrace stackTrace)? onError,
  }) {
    return event_emitter.on(
      eventName: eventName,
      
      onCallback:(_, update) async {
        try { 
          if (update is GeneralSocketMessageData) {
            return await onUpdate(update);
          }
        } catch (e, stack) {
          if (onError != null) {
            try {
              await onError(e, stack);
            } catch (e) {}
          }
        }
        return;
      },
    );
  }

  void emit({
    required String eventName,
    Object? context,
    Object? data,
  }) {
    return event_emitter.emit(
      eventName: eventName,
      value: data,
    );
  }

  Future<String> createNewSocketId({
    String? newSocketId,
  }) async {
    newSocketId ??= "";
    if (newSocketId.trim().isNotEmpty) {
      return newSocketId;
    }
    final DateTime dateTime_expired = DateTime.now().add(Duration(seconds: 10));
    while (true) {
      await Future.delayed(Duration(milliseconds: 1));
      if (dateTime_expired.isExpired()) {
        return "";
      }
      final String new_socket_id = generateUuid(10);
      final GeneralSocketData? generalSocketData = general_socket_data[new_socket_id];
      if (generalSocketData == null) {
        return new_socket_id;
      }
    }
  }

  Future<void> initialized() async {
    await reloadAll();
    return;
  }

  Future<void> reloadAll() async {
    for (NetworkInterface networkInterface in await NetworkInterface.list()) {
      await reload(networkInterface: networkInterface);
    }
  }

  void close() {
    isKeepRunning = false;
    for (var element in general_socket_data.entries) {
      element.value.close();
    }
    general_socket_data.clear();
    network_interface_connecteds.clear();
  }

  Future<bool> reload({
    required NetworkInterface networkInterface,
  }) async {
    if (network_interface_connecteds.contains(networkInterface)) {
      return false;
    } else {
      network_interface_connecteds.add(networkInterface);
    }
    final String new_socket_id = await createNewSocketId();
    if (new_socket_id.isEmpty) {
      network_interface_connecteds.remove(networkInterface);
      return false;
    }
    final GeneralSocketData generalSocketData = GeneralSocketData(
      socket_id: new_socket_id,
      multiCastGroup: multiCastGroup,
      port: port,
    );
    general_socket_data[new_socket_id] = generalSocketData;
    await generalSocketData.ensureInitiaLized(
      socket: await RawDatagramSocket.bind(
        InternetAddress(multiCastGroup),
        port,
      ),
      onMessage: (generalSocketMessageData) {
        emit(
          eventName: event_update,
          data: generalSocketMessageData,
        );
      },
      networkInterface: networkInterface,
      onDone: () async {
        general_socket_data.remove(new_socket_id);
        network_interface_connecteds.remove(networkInterface);
        if (isKeepRunning) {
          await reload(networkInterface: networkInterface);
        }
      },
    );
    if (generalSocketData.is_initialized == false) {
      general_socket_data.remove(new_socket_id);
      network_interface_connecteds.remove(networkInterface);
      if (isKeepRunning) {
        return await reload(networkInterface: networkInterface);
      }
      return false;
    }
    return true;
  }

  Future<void> sendMultiCastRaw({
    required List<int> buffer,
  }) async {
    final List<RawDatagramSocket> sockets = [];
    for (var element in await NetworkInterface.list()) {
      final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      socket.joinMulticast(InternetAddress(multiCastGroup), element);
      sockets.add(socket);
    }

    for (final wait in [100, 500, 2000]) {
      await Future.delayed(Duration(milliseconds: wait), () {});
      for (var socket in sockets) {
        try {
          socket.send(buffer, InternetAddress(multiCastGroup), port);
          socket.close();
        } catch (e) {}
      }
    }
  }

  Future<void> sendMultiCastText({
    required String value,
  }) async {
    return await sendMultiCastRaw(buffer: utf8.encode(value));
  }

  Future<void> sendMultiCastJson({
    required Map value,
  }) async {
    return await sendMultiCastRaw(buffer: utf8.encode(json.encode(value)));
  }

  int sendRaw({
    required List<int> buffer,
    required String socketId,
  }) {
    final GeneralSocketData? generalSocketData = general_socket_data[socketId];
    if (generalSocketData != null) {
      return generalSocketData.sendRaw(
        buffer: buffer,
      );
    }
    return 0;
  }

  int sendText({
    required String value,
    required String socketId,
  }) {
    final GeneralSocketData? generalSocketData = general_socket_data[socketId];
    if (generalSocketData != null) {
      return generalSocketData.sendText(
        value: value,
      );
    }
    return 0;
  }

  int sendJson({
    required Map value,
    required String socketId,
  }) {
    final GeneralSocketData? generalSocketData = general_socket_data[socketId];
    if (generalSocketData != null) {
      return generalSocketData.sendJson(
        value: value,
      );
    }
    return 0;
  }
}
