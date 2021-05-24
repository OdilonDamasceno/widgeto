import 'package:flutter/widgets.dart';
import 'package:widgeto/src/rawImage.dart';

Future<Image> toImage(Widget widget) async {
  assert(widget != null);
  final _rawImage = await toRawImage(widget);
  return Image.memory(_rawImage, filterQuality: FilterQuality.high);
}

Future<ImageProvider> toImageProvider(Widget widget, {double scale = 1}) async {
  assert(widget != null);
  final _rawImage = await toRawImage(widget);
  return MemoryImage(_rawImage, scale: scale);
}
