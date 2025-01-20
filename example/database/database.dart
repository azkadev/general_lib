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
// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:general_lib/database/database.dart';
import 'package:general_lib/database/database_core.dart';
import 'package:general_lib/general_lib.dart';
import 'package:io_universe/io_universe.dart';

void main(List<String> args) async {
  print("start");
  final DatabaseGeneralLib databaseGeneralLib = DatabaseGeneralLib();
  final DatabaseMiniGeneralLibrary database =
      databaseGeneralLib.openDatabaseMini(
    key: "temp/slewp",
    defaultData: {},
    databaseMiniGeneralLibraryBaseOptions:
        DatabaseMiniGeneralLibraryBaseOptions(
      crypto: Crypto.defaultCrypto(),
      isUseCrypto: true,
      isIgnoreError: true,
    ),
  );
  print(database.databaseMiniGeneralLibraryBaseOptions.crypto.defaultKey);
  print(database.platformName());

  await database.initiaLized(
    defaultData: {
      "lpaslpa": {
        "sapslap": "pslap",
      },
    },
  );
  String keyOne =
      "spaslpalps.as.apd.pe.pf.pg.p.gp.p45.hgp5.phg.p.pth.p54h.p54hp5.hp54php.554p.h54php54h.p54h.p54ph.5php.54h.pd";
  final Slebew? result = await database.get(key: keyOne);

  Map? resultData = database.get<Map>(key: keyOne).sync();
  if (resultData == null) {
    await database.set(key: keyOne, value: {"konyol": "anj"});
  }
  // database["skonaoskao"] = Platform.environment;
  await database.set(key: "anuy", value: DateTime.now());
  await database.set(key: "ebew", value: Slebew({"saplsap": "Ssapslap"}));
  await database.set(key: "slapslap", value: Uri.parse("https://google.com"));
  resultData.printPretty();

  database.get(key: "sa");
  await database.set(
    key: "azkoaksoa",
    value: {
      "sapsap": {
        "sapsapl": "Sa",
      }
    },
  );
  await database.set(
    key: "azkoaksoa",
    value: {
      "sapsap": {
        "sapsapl": "Sa",
      }
    },
  );
  database.toJson()["saspla"] = "saplsap";
  database.toJson().printPretty();
  database.write().sync();

  stdin.listen((e) async {
    String data = utf8.decode(e).trim();
    if (data == "open") {
      return;
    }
    if (data == "write") {
      await database.write();
      print("write");
      return;
    }
    print("Data: ${data}");
    if (database.toJson()["count"] is num == false) {
      database.toJson()["count"] = 0;
    }
    database.toJson()["count"] += 1;
    database.toJson().printPretty();
  });

  print(Duration(milliseconds: 864010000));
}

class Slebew extends JsonScheme {
  Slebew(super.rawData);

  static Map get defaultData {
    return {"@type": "slebew", "soke": "soak", "dia": 1};
  }

  static Slebew empty() {
    return Slebew({});
  }

  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  set special_type(String? value) {
    rawData["@type"] = value;
  }

  String? get soke {
    try {
      if (rawData["soke"] is String == false) {
        return null;
      }
      return rawData["soke"] as String;
    } catch (e) {
      return null;
    }
  }

  set soke(String? value) {
    rawData["soke"] = value;
  }

  num? get dia {
    try {
      if (rawData["dia"] is num == false) {
        return null;
      }
      return rawData["dia"] as num;
    } catch (e) {
      return null;
    }
  }

  set dia(num? value) {
    rawData["dia"] = value;
  }

  static Slebew create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "slebew",
    String? soke,
    num? dia,
  }) {
    // Slebew slebew = Slebew({
    final Map slebewDataCreateJson = {
      "@type": special_type,
      "soke": soke,
      "dia": dia,
    };

    slebewDataCreateJson.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (slebewDataCreateJson.containsKey(key) == false) {
          slebewDataCreateJson[key] = value;
        }
      });
    }
    return Slebew(slebewDataCreateJson);
  }
}
