// ignore_for_file: unnecessary_string_interpolations, empty_catches

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
// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:general_lib/extension/extension.dart';

String generateDataSqlJson({
  required Map data,
}) {
  String script_data = "";
  data.forEach((key, value) {
    if (RegExp(r"^(@)", caseSensitive: false).hasMatch(key)) {
      return;
    }
    if (key == "id") {
      return;
    }
    String type_data = "";
    String default_data = "default";
    if (value is num) {
      type_data = "bigint";
      // type_data += " 0";
      default_data += " 0";
    } else if (value is Map || value is List) {
      // type_data = "json";
      // new
      type_data = "jsonb";
      default_data += (" '${json.encode(value)}'::json");
    } else if (value is String) {
      type_data = "text";
      default_data += " format(''::text)";
    } else if (value is bool) {
      type_data = "boolean";
      default_data += " false";
    } else {
      throw "not found type";
    }
    String script_data_loop = """
${key} ${type_data} null ${default_data},
"""
        .trim();
    script_data += "        ${script_data_loop}";
    script_data += "\n";
  });
  return script_data.replaceAll(RegExp(r"(,|,\n)$", caseSensitive: false), "");
}

String generate_add_sql_data({
  required String tableName,
  required Map data,
}) {
  String script_data = "";
  data.forEach((key, value) {
    if (RegExp(r"^(@)", caseSensitive: false).hasMatch(key)) {
      return;
    }
    if (key == "id") {
      return;
    }
    String type_data = "";
    String default_data = "DEFAULT";
    if (value is num) {
      type_data = "bigint";
      // type_data += " 0";
      default_data += " 0";
    } else if (value is Map || value is List) {
      type_data = "json";
      default_data += (" '${json.encode(value)}'");
    } else if (value is String) {
      type_data = "text";
      default_data += " format(''::text)";
    } else if (value is bool) {
      type_data = "boolean";
      default_data += " false";
    } else {
      throw "not found type";
    }
// ${key} ${type_data} ${default_data},
    String script_data_loop = """
ALTER TABLE ${tableName} ADD COLUMN ${key} ${type_data} ${default_data};
"""
        .trim();
    script_data += "${script_data_loop}";
    script_data += "\n";
  });
  return script_data.replaceAll(RegExp(r"(,|,\n)$", caseSensitive: false), "").trim();
}

// add column in
// ALTER TABLE accounts ADD COLUMN new_column text;
//
// delete column
// ALTER TABLE accounts DROP COLUMN new_column;
//
// edit
// ALTER TABLE accounts ALTER COLUMN total_price_amount TYPE boolean;
String jsonToSqlSupabase({
  required Map jsonData,
  Map? originData,
  bool isEnableRls = true,
  String? tableName,
}) {
  // Map origin_data = originData ?? {};
  if (jsonData["@type"] is String == false) {
    jsonData["@type"] = "";
  }

  tableName ??= (jsonData["@type"] as String).snakeCaseClass();
  // https://supabase.com/docs/guides/database/tables?database-method=sql
  String script = """
-- 1. Create table
DO \$\$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = '{table_name}') THEN
      CREATE TABLE {table_name} ( 
        
"""
      .trim();
  script += "\n";
  script += generateDataSqlJson(
    data: jsonData,
  );
  script += "\n";
  // script = script.replaceAll(RegExp(r"({table_name})", caseSensitive: false), table_name).trim();

  script += """

      ) WITH (OIDS=FALSE);
    END IF;
END \$\$;

"""
      .trim();
  if (isEnableRls) {
    script += "\n\n";
    script += """
-- 2. Enable RLS
alter table {table_name} enable row level security;
"""
        .trim();
    script += "\n\n";
    script += """
-- 3. ADD Column in Tabble Exist (Optional)
"""
        .trim();
    script += "\n";
    script += generate_add_sql_data(
      data: jsonData,
      tableName: tableName,
    ).trim();
  }

  script += "\n\n";
  script += "-- Recommendation";

  return (script.trim().replaceAll(RegExp(r"({table_name})", caseSensitive: false), tableName).trim());
}
