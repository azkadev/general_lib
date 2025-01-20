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
// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:general_lib/general_lib_core.dart';

/// GeneralLib
class EventEmitter {
  /// GeneralLib
  final Map<String, Map<String, EventEmitterListener>> events = {};

  /// GeneralLib
  EventEmitter();

  /// GeneralLib
  void emit({
    required String eventName,
    required dynamic value,
  }) {
    for (final element in events.putIfAbsent(eventName, () {
      return {};
    }).values) {
      if (element.is_pause) {
        continue;
      }
      element.onUpdate(element, value);
    }
  }

  /// GeneralLib
  EventEmitterListener on({
    required String eventName,
    required FutureOr<dynamic> Function(
            EventEmitterListener listener, dynamic update)
        onCallback,
    Map? stateData,
  }) {
    final Map<String, EventEmitterListener> event_datas =
        events.putIfAbsent(eventName, () {
      return {};
    });

    final EventEmitterListener eventEmitterListenerGeneralLib =
        EventEmitterListener(
      stateData: stateData ?? {},
    );
    eventEmitterListenerGeneralLib.ensureInitiaLized(
      eventName: eventName,
      eventUniqueId: generateNewUniqueId(event_datas: event_datas),
      onUpdate: onCallback,
      onCancel: (event) {
        event_datas.remove(event.event_unique_id);
        remove(eventName: eventName, uniqueId: event.event_unique_id);
        event.dispose();
      },
    );
    event_datas[eventEmitterListenerGeneralLib.event_unique_id] =
        eventEmitterListenerGeneralLib;
    return eventEmitterListenerGeneralLib;
  }

  /// GeneralLib
  void clear() {
    events.clear();
  }

  /// GeneralLib
  void off({
    required EventEmitterListener listener,
  }) {
    remove(eventName: listener.event_name, uniqueId: listener.event_unique_id);
  }

  /// GeneralLib
  void remove({
    required String eventName,
    required String uniqueId,
  }) {
    final Map<String, EventEmitterListener> event_datas =
        events.putIfAbsent(eventName, () {
      return {};
    });
    event_datas.remove(uniqueId);
  }

  /// GeneralLib
  int getListenersCount({
    required String eventName,
  }) {
    return events.putIfAbsent(eventName, () {
      return {};
    }).length;
  }

  /// GeneralLib

  String generateNewUniqueId({
    required Map<String, EventEmitterListener> event_datas,
  }) {
    while (true) {
      final String new_unique_id = generateUuid(Random().nextInt(10) + 10,
          text: "0123456789abcdefghijklmnopqrstuvwxyz-_");
      if (event_datas.containsKey(new_unique_id) == false) {
        return new_unique_id;
      }
    }
  }
}

/// GeneralLib
class EventEmitterListener {
  /// GeneralLib
  late final String event_name;

  /// GeneralLib
  late final String event_unique_id;

  /// GeneralLib
  late final Function(EventEmitterListener event) onCancel;

  /// GeneralLib
  late final Function(EventEmitterListener event, dynamic data) onUpdate;

  /// GeneralLib
  bool is_initialized = false;

  /// GeneralLib
  bool is_cancel = false;

  /// GeneralLib
  bool is_pause = false;

  /// GeneralLib
  final Map stateData;

  /// GeneralLib
  EventEmitterListener({
    required this.stateData,
  });

  /// GeneralLib
  void ensureInitiaLized({
    required String eventName,
    required String eventUniqueId,
    required Function(EventEmitterListener event, dynamic data) onUpdate,
    required Function(EventEmitterListener event) onCancel,
  }) {
    if (is_initialized) {
      return;
    }
    event_name = eventName;
    event_unique_id = eventUniqueId;
    this.onUpdate = onUpdate;
    this.onCancel = onCancel;
    is_initialized = true;
  }

  /// GeneralLib
  void resume() {
    is_pause = false;
  }

  /// GeneralLib
  void pause() {
    is_pause = true;
  }

  // @override
  //
  /// GeneralLib
  void dispose() {
    close();
    stateData.clear();
  }

  /// GeneralLib
  void close() {
    cancel();
    return;
  }

  /// GeneralLib
  bool cancel() {
    if (is_initialized == false) {
      return false;
    }
    is_cancel = true;
    is_pause = true;
    onCancel(this);
    return true;
  }

  @override
  String toString() {
    return "$event_name $event_unique_id ${json.encode(stateData)}";
  }
}
