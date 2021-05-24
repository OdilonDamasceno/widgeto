library widgeto;

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:widgeto/src/image.dart';
import 'package:widgeto/src/pdf.dart';
import 'package:widgeto/src/rawImage.dart';

class Widgeto {
  Future<Uint8List> rawImage(Widget widget) => toRawImage(widget);

  /// Return a [Image] Widget
  Future<Image> image(Widget widget) => toImage(widget);

  /// Create a pdf file
  Future<File> pdf(
    Widget widget, {
    String path,
    String fileName,
  }) =>
      toPdf(widget, path: path, fileName: fileName);

  Future<File> multiPagePdf(
    List<Widget> widgets, {
    String path,
    String fileName,
  }) =>
      toMultiPagePdf(widgets, path: path, fileName: fileName);

  Future<ImageProvider> imageProvider(Widget widget, {double scale = 1}) =>
      toImageProvider(widget, scale: scale);
}
