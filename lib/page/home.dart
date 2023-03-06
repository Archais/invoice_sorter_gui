import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invoice_sorter/utils/pdfio.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoaded = false;

  final List<dynamic> invoices = [];
  @override
  void initState() {
    super.initState();

    _loadInvoices();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoaded
        ? Scaffold(
            appBar: AppBar(title: const Text("Invoice Sorter")),
            body: SingleChildScrollView(
              child: Column(
                children: invoices.map((e) => Text(e.path)).toList(),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(title: const Text("Loading Invoices")),
            body: const Center(
              child: Text("Load invoices"),
            ),
          );
  }

  void _loadInvoices() async {
    final Directory inspectionDirectory = Directory(
      "/Users/andrew/development/testing_assets",
    );

    for (FileSystemEntity i in inspectionDirectory.listSync()) {
      File invoice = File(i.path);
      // print(i.statSync().modified);
      pdfIo.pdfioFileOpen(
        invoice.path.toNativeUtf8().cast<Char>(),
        Pointer.fromFunction(
          (Pointer<Void> a, Pointer<Char> b) => "".toNativeUtf8().cast<Char>(),
        ),
        "".toNativeUtf8().cast<Void>(),
        Pointer.fromFunction(
          (Pointer<Void> a, Pointer<Char> b, Pointer<Void> c) =>
              "true".toNativeUtf8().cast<Bool>().value,
        ),
        "".toNativeUtf8().cast<Void>(),
      );

      print(pdfIo.timezone);
    }

    // invoices.addAll(items);
    setState(() => _isLoaded = true);
  }
}
