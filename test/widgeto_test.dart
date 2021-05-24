import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widgeto/widgeto.dart';

void main() {
  Map<String, dynamic> env = Platform.environment;

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
    expect(await widgeto.rawImage(MyTestStateless().build(null)),
        isInstanceOf<Uint8List>());
    expect(await widgeto.rawImage(MyTestStateful().createState().build(null)),
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

  test("multiPagePdf", () async {
    expect(
        await widgeto.multiPagePdf([
          Container(
            height: 100,
            width: 200,
            color: Colors.red,
          ),
          Container(
            height: 100,
            width: 200,
            color: Colors.yellow,
          ),
          Container(
            height: 100,
            width: 200,
            color: Colors.blue,
          ),
          Container(
            height: 100,
            width: 200,
            color: Colors.green,
          ),
        ], path: "${env['HOME']}/", fileName: "superexample"),
        isInstanceOf<File>());
  });

  test("imageProvider", () async {
    expect(await widgeto.imageProvider(MyTestStateless().build(null)),
        isInstanceOf<ImageProvider>());
  });
}

class MyTestStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      color: Colors.yellow,
    );
  }
}

class MyTestStateful extends StatefulWidget {
  @override
  _MyTestStatefulState createState() => _MyTestStatefulState();
}

class _MyTestStatefulState extends State<MyTestStateful> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      color: Colors.yellow,
    );
  }
}
