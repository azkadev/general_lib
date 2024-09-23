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
// ignore_for_file: non_constant_identifier_names

import 'package:universal_io/io.dart';

class TcpSocketServer {
  late ServerSocket server;
  late SecureServerSocket server_secure;

  TcpSocketServer();

  Future<ServerSocket> listen({
    required String host,
    required int port,
    required void Function(Socket socket) onData,
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
    int backlog = 0,
    bool v6Only = false,
    bool shared = true,
  }) async {
    server = await ServerSocket.bind(
      host,
      port,
      backlog: backlog,
      v6Only: v6Only,
      shared: shared,
    );
    server.listen(
      onData,
      onDone: onDone,
      onError: onError,
      cancelOnError: cancelOnError,
    );
    return server;
  }

  Future<SecureServerSocket> listenSecure({
    required String host,
    required int port,
    SecurityContext? context,
    required void Function(SecureSocket secureSocket) onData,
    Function? onError,
    void Function()? onDone,
    bool cancelOnError = true,
    int backlog = 0,
    bool v6Only = false,
    bool requestClientCertificate = false,
    bool requireClientCertificate = false,
    List<String>? supportedProtocols,
    bool shared = true,
  }) async {
    server_secure = await SecureServerSocket.bind(
      host,
      port,
      context,
      backlog: backlog,
      v6Only: v6Only,
      requestClientCertificate: requestClientCertificate,
      requireClientCertificate: requireClientCertificate,
      supportedProtocols: supportedProtocols,
      shared: shared,
    );

    server_secure.listen(
      onData,
      onDone: onDone,
      onError: onError,
      cancelOnError: cancelOnError,
    );
    return server_secure;
  }
}
