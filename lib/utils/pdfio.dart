/// This package contains dart bindings for the PdfIO C library.
import 'dart:ffi' as ffi;
import 'dart:io' show Directory, Platform;

import 'package:path/path.dart' as path;

final ffi.DynamicLibrary pdfIoLib = ffi.DynamicLibrary.open(_libPath);

/// This is a collection of all externalised methods.
abstract class PdfIO {
  static void test() {
    print(pdfIoLib.providesSymbol("pdfioFileOpen"));
  }
}

String get _libPath {
  if (Platform.isMacOS) {
    return path.join(
      Directory.current.path,
      "src",
      "libpdfio.1.dylib",
    );
  }
  return path.join(
    Directory.current.path,
    "src",
    "libpdfio.1.dll",
  );
}
