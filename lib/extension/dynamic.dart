// ignore_for_file: empty_catches, non_constant_identifier_names, unnecessary_brace_in_string_interps

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

/// GeneralLib

extension DynamicDataFutureExtension on Future<dynamic> {
  /// GeneralLib
  Future<String> toStringifyPretty([int space = 2]) async {
    dynamic data_ = await this;
    if (data_ is Map || data_ is List) {
      return JsonEncoder.withIndent(" " * space).convert(data_);
    } else {
      return data_.toString();
    }
  }

  /// GeneralLib
  Future<void> printPretty([int space = 2]) async {
    dynamic data_ = await this;
    if (data_ is Map || data_ is List) {
      print(JsonEncoder.withIndent(" " * space).convert(data_));
    } else {
      print(data_.toString());
    }
  }
}

/// GeneralLib
extension DynamicDataExtension on dynamic {
  /// GeneralLib
  DateTime? general_lib_utils_toDatetime() {
    DateTime? dateTime;
    try {
      String data = toString();

      int data_number = (num.tryParse(data) ?? 0).toInt();
      if (data_number < 1) {
        dateTime = DateTime.tryParse(toString());
        if (dateTime != null) {
          return dateTime;
        }
        return null;
      } else {
        data = "${data_number}";
      }
      if (data.length >= 10 || data.length <= 16) {
        if (data.length == 13) {
          dateTime = DateTime.fromMillisecondsSinceEpoch(data_number);
        } else if (data.length == 10) {
          dateTime = DateTime.fromMillisecondsSinceEpoch(data_number * 1000);
        } else {
          dateTime = DateTime.fromMicrosecondsSinceEpoch(data_number);
        }
      }
    } catch (e) {}

    return dateTime;
  }

  /// GeneralLib
  String toStringifyPretty([int space = 2]) {
    if (this is Map || this is List) {
      return JsonEncoder.withIndent(" " * space).convert(this);
    } else {
      return toString();
    }
  }

  /// GeneralLib
  void printPretty([int space = 2]) {
    if (this is Map || this is List) {
      print(toStringifyPretty(space));
    } else {
      print(toString());
    }
  }
}
