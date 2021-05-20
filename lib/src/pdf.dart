import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:widgeto/src/rawImage.dart';
import 'package:path_provider/path_provider.dart' as provider;

Future<File> toPdf(Widget widget, {String path, String fileName}) async {
  var pdf = pw.Document();
  var image = pw.MemoryImage(
    await toRawImage(widget),
  );

  pdf.addPage(
    pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(image),
          );
        },
        pageFormat: PdfPageFormat.undefined),
  );

  Directory dir = await provider.getApplicationDocumentsDirectory();

  var file = File((path ?? dir.path) + "/${fileName ?? 'example'}.pdf");
  return await file.writeAsBytes(await pdf.save());
}
