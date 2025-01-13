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
