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
// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "template_data.dart";

class TemplateDatas extends JsonScheme {
  TemplateDatas(super.rawData);

  static Map get defaultData {
    return {
      "@type": "TemplateDatas",
      "count": 0,
      "templates": [
        {
          "@type": "TemplateData",
          "name": "",
          "path": "",
          "data": [0]
        }
      ]
    };
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

  int? get count {
    try {
      if (rawData["count"] is int == false) {
        return null;
      }
      return rawData["count"] as int;
    } catch (e) {
      return null;
    }
  }

  List<TemplateData> get templates {
    try {
      if (rawData["templates"] is List == false) {
        return [];
      }
      return (rawData["templates"] as List)
          .map((e) => TemplateData(e as Map))
          .toList()
          .cast<TemplateData>();
    } catch (e) {
      return [];
    }
  }

  static TemplateDatas create({
    String special_type = "TemplateDatas",
    int? count,
    List<TemplateData>? templates,
  }) {
    // TemplateDatas templateDatas = TemplateDatas({
    Map templateDatas_data_create_json = {
      "@type": special_type,
      "count": count,
      "templates": (templates != null) ? templates.toJson() : null,
    };

    templateDatas_data_create_json.removeWhere((key, value) => value == null);
    TemplateDatas templateDatas_data_create =
        TemplateDatas(templateDatas_data_create_json);

    return templateDatas_data_create;
  }
}
