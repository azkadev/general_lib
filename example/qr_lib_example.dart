import 'package:general_lib/qr/qr.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) async{
  QrGeneralLib.qrPrintToTerminal(
    input: "https://tokopedia.link/q0Yvvvv4gNb",
  );
  File("./temp/slebew.png").writeAsBytesSync(
   QrGeneralLib.generateImagePngBytes(
    text:"https://tokopedia.link/q0Yvvvv4gNb",
  ));
}
