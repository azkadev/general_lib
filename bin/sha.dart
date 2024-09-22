import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:pointycastle/export.dart' hide Signer hide RSASigner;

void main() async { 
  final signer = Signer(RSASigner(RSASignDigest.SHA256));

  final message = 'hello world'; 
  print(signer.sign(message).base64);
  // expect(signer.sign(message).base64, equals(digest));
  // expect(signer.verify(message, Encrypted.from64(digest)), isTrue);
  // expect(signer.verify(message, Encrypted.from64('eW91J3JlIHZlcnkgY3VyaW91cywgYXJlbid0IHlvdT8=')), isFalse);
  // expect(signer.verify('test', Encrypted.from64(externalDigest)), isTrue);
}
