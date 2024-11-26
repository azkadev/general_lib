import "dart:convert";
// import "dart:io";
import "dart:typed_data";

import "package:http/http.dart" as http;

import "package:http/browser_client.dart";
import "package:universal_io/io.dart";

class HttpClientGeneralLib implements http.Client {
  late final BrowserClient _client;
  HttpClientGeneralLib(
    HttpClient? httpClient,
  ) {
    _client = BrowserClient();
  }

  @override
  void close() {
    _client.close();
    // TODO: implement close
  }

  @override
  Future<http.Response> delete(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _client.delete(url,
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    return _client.get(url, headers: headers);
  }

  @override
  Future<http.Response> head(Uri url, {Map<String, String>? headers}) {
    return _client.head(url, headers: headers);
  }

  @override
  Future<http.Response> patch(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _client.patch(url, headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _client.post(url, headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> put(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _client.put(url, headers: headers, encoding: encoding);
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) {
    return _client.read(url, headers: headers);
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) {
    return _client.readBytes(url, headers: headers);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request);
  }
}
