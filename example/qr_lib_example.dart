import 'package:general_lib/qr/qr.dart';
import 'package:io_universe/io_universe.dart';

void main(List<String> args) async {
  QrGeneralLib.qrPrintToTerminal(
    input: "https://tokopedia.link/q0Yvvvv4gNb",
  );
  File("./temp/slebew.png").writeAsBytesSync(QrGeneralLib.generateImagePngBytes(
    text: "https://tokopedia.link/q0Yvvvv4gNb",
  ));
}
