// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:general_lib/general_lib.dart';
import 'package:test/test.dart';

void main() {
  final EventEmitter eventEmitter = EventEmitter();

  final String event = "invoke";
  eventEmitter.on(
    eventName: "update",
    onCallback: (listener, update) {},
  );
  // eventEmitter.on("update", null, (ev, e) {});
  Timer.periodic(Duration(seconds: 1), (t) {
    eventEmitter.emit(eventName: event, value: "s: ${t.tick}");
    // eventEmitter.emit(event, null, "Sasa");
  });
  test("slebew", () async {
    print("start");
    print(
        "event before loop: ${eventEmitter.getListenersCount(eventName: event)}");

    print("Wait");
    await Future.delayed(Duration(seconds: 10));
    EventEmitterListener slebew() {
      slapslap() {}
      return eventEmitter.on(
        eventName: event,
        onCallback: (listener, update) {
          print("listener: ${listener.event_unique_id}: ${update}");
          slapslap();
        },
      );
    }

    await loop(
      count: 10,
      onFunction: (index, countLoop) async {
        late final EventEmitterListener listener;
        await Future(() async {
          listener = slebew();
        });
        // if (index == 0) {
        //   return;
        // }
        // listener.cancel();
        print("wait 2");
        // await Future.delayed(Duration(seconds: 2));
        eventEmitter.off(listener: listener);
        print("done");
      },
    );
    print(
        "event after loop: ${eventEmitter.getListenersCount(eventName: event)}");
    print("Wait");
    await Future.delayed(Duration(seconds: 10));
    print(
        "event after delay: ${eventEmitter.getListenersCount(eventName: event)}");
    expect(0, eventEmitter.getListenersCount(eventName: event));
  }, timeout: Timeout(Duration(days: 12100)));
}

FutureOr<dynamic> loop({
  required int count,
  required FutureOr<dynamic> Function(int index, int countLoop) onFunction,
}) async {
  for (var i = 0; i < count; i++) {
    await onFunction(i, count);
  }
}
