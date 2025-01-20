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
import 'dart:convert';
import 'dart:math';

import 'node.dart';

import 'yaml_context.dart';

/// YAML Writer.
class YamlWriterGeneralLib extends Converter<Object?, String> {
  static dynamic _defaultToEncodable(dynamic object) => object.toJson();

  /// The indentation size.
  ///
  /// Must be greater or equal to `1`.
  ///
  /// Defaults to `2`.
  final int indentSize;

  /// If `true` it will allow unquoted strings.
  final bool allowUnquotedStrings;

  /// Used to convert objects to an encodable version.
  final Object? Function(dynamic object) toEncodable;

  /// YAML Writer.
  YamlWriterGeneralLib({
    int indentSize = 2,
    this.allowUnquotedStrings = false,
    Object? Function(dynamic object)? toEncodable,
  })  : indentSize = max(1, indentSize),
        toEncodable = toEncodable ?? _defaultToEncodable;

  /// Converts [input] to an YAML document as [String].
  ///
  /// This implements `dart:convert` [Converter].
  ///
  /// - Calls [write].
  @override
  String convert(Object? input) => write(input);

  /// Writes [object] to an YAML document as [String].
  String write(Object? object) {
    final node = _parseNode(object);
    final context = YamlContext(
      indentSize: indentSize,
      allowUnquotedStrings: allowUnquotedStrings,
    );
    final yaml = node.toYaml(context);
    return '${yaml.join('\n')}\n';
  }

  Node _parseNode(Object? object) {
    if (object == null) {
      return NullNode();
    } else if (object is num) {
      return NumNode(object);
    } else if (object is bool) {
      return BoolNode(object);
    } else if (object is String) {
      return StringNode(object);
    } else if (object is List) {
      return ListNode(object.map(_parseNode).toList());
    } else if (object is Map) {
      return MapNode(object.map((k, v) => MapEntry(k, _parseNode(v))));
    } else {
      return _parseNode(toEncodable(object));
    }
  }
}
