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
// coverage:ignore-file
// ignore_for_file: public_member_api_docs, constant_identifier_names, camel_case_types, non_constant_identifier_names, lines_longer_than_80_chars

// cspell:words tcgetattr BRKINT ICRNL INPCK ISTRIP IXON lflag CSIZE
// cspell:words fildes termios ospeed ispeed tcflag ncss vtime vmin cflag
// cspell:words icanon isig iexten tcsanow tcsetattr FILENO iflag oflag OPOST

import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:general_lib/fork/mason_logger/src/ffi/terminal.dart';

class UnixTerminal implements Terminal {
  UnixTerminal() {
    _lib = Platform.isMacOS
        ? DynamicLibrary.open('/usr/lib/libSystem.dylib')
        : DynamicLibrary.open('libc.so.6');

    _tcgetattr = _lib.lookupFunction<TCGetAttrNative, TCGetAttrDart>(
      'tcgetattr',
    );
    _tcsetattr = _lib.lookupFunction<TCSetAttrNative, TCSetAttrDart>(
      'tcsetattr',
    );

    _origTermIOSPointer = calloc<TermIOS>();
    _tcgetattr(_STDIN_FILENO, _origTermIOSPointer);
  }

  late final DynamicLibrary _lib;
  late final Pointer<TermIOS> _origTermIOSPointer;
  late final TCGetAttrDart _tcgetattr;
  late final TCSetAttrDart _tcsetattr;

  @override
  void enableRawMode() {
    final origTermIOS = _origTermIOSPointer.ref;
    final newTermIOSPointer = calloc<TermIOS>()
      ..ref.c_iflag =
          origTermIOS.c_iflag & ~(_BRKINT | _ICRNL | _INPCK | _ISTRIP | _IXON)
      ..ref.c_oflag = origTermIOS.c_oflag & ~_OPOST
      ..ref.c_cflag = (origTermIOS.c_cflag & ~_CSIZE) | _CS8
      ..ref.c_lflag = origTermIOS.c_lflag & ~(_ECHO | _ICANON | _IEXTEN | _ISIG)
      ..ref.c_cc = origTermIOS.c_cc
      ..ref.c_cc[_VMIN] = 0
      ..ref.c_cc[_VTIME] = 1
      ..ref.c_ispeed = origTermIOS.c_ispeed
      ..ref.c_oflag = origTermIOS.c_ospeed;

    _tcsetattr(_STDIN_FILENO, _TCSANOW, newTermIOSPointer);
    calloc.free(newTermIOSPointer);
  }

  @override
  void disableRawMode() {
    if (nullptr == _origTermIOSPointer.cast()) return;
    _tcsetattr(_STDIN_FILENO, _TCSANOW, _origTermIOSPointer);
  }
}

// Input Modes
// https://ftp.gnu.org/old-gnu/Manuals/glibc-2.2.3/html_node/libc_352.html
const int _BRKINT = 0x00000002;
const int _INPCK = 0x00000010;
const int _ISTRIP = 0x00000020;
const int _ICRNL = 0x00000100;
const int _IXON = 0x00000200;

// Output Modes
// https://ftp.gnu.org/old-gnu/Manuals/glibc-2.2.3/html_node/libc_353.html#SEC362
const int _OPOST = 0x00000001;

// Control Modes
// https://ftp.gnu.org/old-gnu/Manuals/glibc-2.2.3/html_node/libc_354.html#SEC363
const int _CSIZE = 0x00000300;
const int _CS8 = 0x00000300;

// Local Modes
// https://ftp.gnu.org/old-gnu/Manuals/glibc-2.2.3/html_node/libc_355.html#SEC364
const int _ECHO = 0x00000008;
const int _ISIG = 0x00000080;
const int _ICANON = 0x00000100;
const int _IEXTEN = 0x00000400;
const int _TCSANOW = 0;
const int _VMIN = 16;
const int _VTIME = 17;

typedef tcflag_t = UnsignedLong;
typedef cc_t = UnsignedChar;
typedef speed_t = UnsignedLong;

// The default standard input file descriptor number which is 0.
const _STDIN_FILENO = 0;

// The number of elements in the control chars array.
const _NCSS = 20;

final class TermIOS extends Struct {
  @tcflag_t()
  external int c_iflag; // input flags
  @tcflag_t()
  external int c_oflag; // output flags
  @tcflag_t()
  external int c_cflag; // control flags
  @tcflag_t()
  external int c_lflag; // local flags
  @Array(_NCSS)
  external Array<cc_t> c_cc; // control chars
  @speed_t()
  external int c_ispeed; // input speed
  @speed_t()
  external int c_ospeed; // output speed
}

// int tcgetattr(int, struct termios *);
typedef TCGetAttrNative = Int32 Function(
  Int32 fildes,
  Pointer<TermIOS> termios,
);
typedef TCGetAttrDart = int Function(int fildes, Pointer<TermIOS> termios);

// int tcsetattr(int, int, const struct termios *);
typedef TCSetAttrNative = Int32 Function(
  Int32 fildes,
  Int32 optional_actions,
  Pointer<TermIOS> termios,
);
typedef TCSetAttrDart = int Function(
  int fildes,
  int optional_actions,
  Pointer<TermIOS> termios,
);
