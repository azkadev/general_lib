// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:general_lib/database/database.dart';
import 'package:general_lib/database/database_core.dart';
import 'package:general_lib/general_lib.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) async {
  print("start");
  final DatabaseGeneralLib databaseGeneralLib = DatabaseGeneralLib();
  final DatabaseMiniGeneralLibrary database = databaseGeneralLib.openDatabaseMini(
    key: "temp/data",
    databaseMiniGeneralLibraryBaseOptions: DatabaseMiniGeneralLibraryBaseOptions(
      crypto: Crypto.defaultCrypto(),
      isEncrypt: true,
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
  // database.reset();
  database.toJson().printPretty();
  final Slebew? result = await database.get(key: "azka.salpslaps.aslpalspa.sapldpwlpf.efpe.pfepf.pefpe.fp.epf.pe");
  print(result);

  Map? resultData = database.get<Map>(key: "azka.salpslaps.aslpalspa.sapldpwlpf.efpe.pfepf.pefpe.fp.epf.pe").sync();
  if (resultData == null) {
    await database.set(key: "azka.salpslaps.aslpalspa.sapldpwlpf.efpe.pfepf.pefpe.fp.epf.pe", value: {"konyol": "anj"});
  }
  // database["skonaoskao"] = Platform.environment;

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
    final Map slebew_data_create_json = {
      "@type": special_type,
      "soke": soke,
      "dia": dia,
    };

    slebew_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (slebew_data_create_json.containsKey(key) == false) {
          slebew_data_create_json[key] = value;
        }
      });
    }
    return Slebew(slebew_data_create_json);
  }
}
