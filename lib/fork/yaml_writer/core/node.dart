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
import 'dart:math';

// import 'package:general_lib/general_lib.dart';

import 'yaml_context.dart';

/// YAML Writer.
sealed class Node {
  /// YAML Writer.
  bool get requiresNewLine => false;

  /// YAML Writer.
  List<String> toYaml(YamlContext context);
}

/// YAML Writer.
class NullNode extends Node {
  @override
  List<String> toYaml(YamlContext context) => ['null'];
}

/// YAML Writer.
class NumNode extends Node {
  /// YAML Writer.
  final num number;

  /// YAML Writer.
  NumNode(this.number);

  @override
  List<String> toYaml(YamlContext context) => ['$number'];
}

/// YAML Writer.
class BoolNode extends Node {
  /// YAML Writer.
  final bool boolean;

  /// YAML Writer.
  BoolNode(this.boolean);

  @override
  List<String> toYaml(YamlContext context) => ['$boolean'];
}

/// YAML Writer.
class StringNode extends Node {
  /// YAML Writer.
  final String text;

  /// YAML Writer.
  StringNode(this.text);

  @override
  List<String> toYaml(YamlContext context) {
    List<String> yamlLines = [];

    if (text.contains('\n')) {
      bool endsWithLineBreak = text.endsWith('\n');

      List<String> lines;
      if (endsWithLineBreak) {
        yamlLines.add('|');
        lines = text.substring(0, text.length - 1).split('\n');
      } else {
        yamlLines.add('|-');
        lines = text.split('\n');
      }

      for (int index = 0; index < lines.length; index++) {
        yamlLines.add(lines[index]);
      }
    } else {
      bool isContainsSingleQuote = text.contains("'");
      // text.printPretty();
      // print(_isValidUnquotedString(text));
      if (context.allowUnquotedStrings &&
          !isContainsSingleQuote &&
          _isValidUnquotedString(text)) {
        yamlLines.add(text);
      } else if (!isContainsSingleQuote) {
        yamlLines.add('\'$text\'');
      } else {
        var str = text.replaceAll('\\', '\\\\').replaceAll('"', '\\"');
        yamlLines.add('"$str"');
      }
    }

    return yamlLines;
  }

  // static final _regexpInvalidUnquotedChars = RegExp(r'[^0-9a-zA-ZàèìòùÀÈÌÒÙáéíóúýÁÉÍÓÚÝâêîôûÂÊÎÔÛãñõÃÑÕäëïöüÿÄËÏÖÜŸçÇßØøÅåÆæœ@/. \t-]');

  bool _isValidUnquotedString(String s) =>
      !s.startsWith('@') && !s.startsWith('-');
}

/// YAML Writer.
class ListNode extends Node {
  /// YAML Writer.
  final List<Node> subnodes;

  /// YAML Writer.
  ListNode(this.subnodes);

  @override
  bool get requiresNewLine => subnodes.isNotEmpty;

  @override
  List<String> toYaml(YamlContext context) {
    if (subnodes.isEmpty) {
      return ['[]'];
    }

    final List<String> lines = [];

    for (final node in subnodes) {
      final nodeYaml = node.toYaml(context);

      final firstIndent = "-${' ' * max(1, context.indentSize - 1)}";
      final subsequentIndent = ' ' * firstIndent.length;

      lines.add("$firstIndent${nodeYaml.first}");
      for (int i = 1; i < nodeYaml.length; i++) {
        lines.add("$subsequentIndent${nodeYaml[i]}");
      }
    }

    return lines;
  }
}

/// YAML Writer.
class MapNode extends Node {
  /// YAML Writer.
  final Map<String, Node> subnodesMap;

  /// YAML Writer.
  MapNode(this.subnodesMap);

  @override
  bool get requiresNewLine => subnodesMap.isNotEmpty;

  @override
  List<String> toYaml(YamlContext context) {
    if (subnodesMap.isEmpty) {
      return ['{}'];
    }

    final List<String> lines = [];

    for (final entry in subnodesMap.entries) {
      final key = entry.key;
      final node = entry.value;

      final nodeYaml = node.toYaml(context);

      final indent = ' ' * context.indentSize;

      if (node.requiresNewLine) {
        lines.add("$key:");
        for (final line in nodeYaml) {
          lines.add("$indent$line");
        }
      } else {
        lines.add("$key: ${nodeYaml.first}");
        for (int i = 1; i < nodeYaml.length; i++) {
          lines.add("$indent${nodeYaml[i]}");
        }
      }
    }

    return lines;
  }
}
