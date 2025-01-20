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
