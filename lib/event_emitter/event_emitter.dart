// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:general_lib/general_lib_core.dart';

class EventEmitter {
  final Map<String, Map<String, EventEmitterListener>> events = {};
  EventEmitter();

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

  EventEmitterListener on({
    required String eventName,
    required FutureOr<dynamic> Function(EventEmitterListener listener, dynamic update) onCallback,
    Map? stateData,
  }) {
    final Map<String, EventEmitterListener> event_datas = events.putIfAbsent(eventName, () {
      return {};
    });

    final EventEmitterListener eventEmitterListenerGeneralLib = EventEmitterListener(
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
    event_datas[eventEmitterListenerGeneralLib.event_unique_id] = eventEmitterListenerGeneralLib;
    return eventEmitterListenerGeneralLib;
  }

  void clear() {
    events.clear();
  }

  void off({
    required EventEmitterListener listener,
  }) {
    remove(eventName: listener.event_name, uniqueId: listener.event_unique_id);
  }

  void remove({
    required String eventName,
    required String uniqueId,
  }) {
    final Map<String, EventEmitterListener> event_datas = events.putIfAbsent(eventName, () {
      return {};
    });
    event_datas.remove(uniqueId);
  }

  int getListenersCount({
    required String eventName,
  }) {
    return events.putIfAbsent(eventName, () {
      return {};
    }).length;
  }

  String generateNewUniqueId({
    required Map<String, EventEmitterListener> event_datas,
  }) {
    while (true) {
      final String new_unique_id = generateUuid(Random().nextInt(10) + 10, text: "0123456789abcdefghijklmnopqrstuvwxyz-_");
      if (event_datas.containsKey(new_unique_id) == false) {
        return new_unique_id;
      }
    }
  }
}

class EventEmitterListener {
  late final String event_name;
  late final String event_unique_id;

  late final Function(EventEmitterListener event) onCancel;
  late final Function(EventEmitterListener event, dynamic data) onUpdate;

  bool is_initialized = false;
  bool is_cancel = false;
  bool is_pause = false;
  final Map stateData;
  EventEmitterListener({
    required this.stateData,
  });

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

  void resume() {
    is_pause = false;
  }

  void pause() {
    is_pause = true;
  }

  // @override
  void dispose() {
    close();
    stateData.clear();
  }

  void close() {
    cancel();
    return;
  }

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
