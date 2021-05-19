import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widgeto/widgeto.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Widgeto widgeto = new Widgeto();
  test("rawImage", () async {
    expect(
        await widgeto.rawImage(Container(
          height: 100,
          width: 200,
          color: Colors.green,
        )),
        isInstanceOf<Uint8List>());
  });
  test("pdf", () async {
    expect(
        await widgeto.pdf(Container(
          height: 100,
          width: 200,
          color: Colors.red,
        )),
        isInstanceOf<File>());
  });
}
