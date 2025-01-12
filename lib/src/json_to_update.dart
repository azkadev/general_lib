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
/// GeneralLib
Map jsonUpdate({required Map data, required Map newData}) {
  newData.forEach((key, value) {
    if (value is Map) {
      if (data.containsKey(key)) {
        if (data[key] is Map) {
          Map dataSub = {};
          (data[key] as Map).forEach((keySub, valueSub) {
            dataSub[keySub] = valueSub;
          });
          Map newDataSub = {};
          (newData[key] as Map).forEach((keySub, valueSub) {
            newDataSub[keySub] = valueSub;
          });
          data[key] = jsonUpdate(data: dataSub, newData: newDataSub);
        } else {}
      } else {
        data[key] = value;
      }
    } else if (value is List) {
      if (data.containsKey(key)) {
        if (data[key] is List) {
          List dataSubs = (data[key] as List);
          List newDataSubs = (newData[key] as List);
          if (dataSubs.first is Map) {
            if (newDataSubs.first is Map) {
              Map dataMap = {};
              (dataSubs.first as Map).forEach((keySub, valueSub) {
                dataMap[keySub] = valueSub;
              });
              Map newDataMap = {};
              (newDataSubs.first as Map).forEach((keySub, valueSub) {
                newDataMap[keySub] = valueSub;
              });
              dataMap = jsonUpdate(data: dataMap, newData: newDataMap);

              dataSubs.map((e) {
                if (e is Map) {
                  dataMap = jsonUpdate(data: dataMap, newData: e);
                } else if (e is List) {
                } else {}
              });
              newDataSubs.map((e) {
                if (e is Map) {
                  dataMap = jsonUpdate(data: dataMap, newData: e);
                } else if (e is List) {
                } else {}
              });
              (data[key] as List)[0] = dataMap;
            }
          } else if ((data[key] as List).isEmpty) {
            data[key] = newData[key];
          }
        } else {}
      } else {
        data[key] = value;
      }
    } else {
      if (!data.containsKey(key)) {
        data[key] = value;
      }
    }
  });
  return data;
}
