import 'dart:typed_data';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

Future<Uint8List> toRawImage(Widget widget) async {
  assert(widget != null);

  final _properties = DiagnosticPropertiesBuilder();
  widget.debugFillProperties(_properties);

  final _constraints = _properties.properties
      .whereType<DiagnosticsProperty<BoxConstraints>>()
      .first
      .value;

  assert(_constraints != null);
  assert(_constraints.hasBoundedHeight && _constraints.hasBoundedWidth);

  final RenderRepaintBoundary _repaintBoundary = RenderRepaintBoundary();

  final RenderView _renderView = RenderView(
    child: RenderPositionedBox(
        alignment: Alignment.center, child: _repaintBoundary),
    configuration: ViewConfiguration(
        size: Size(_constraints.maxWidth, _constraints.maxHeight),
        devicePixelRatio: ui.window.devicePixelRatio),
    window: null,
  );

  final PipelineOwner _pipelineOwner = PipelineOwner()..rootNode = _renderView;
  _renderView.prepareInitialFrame();

  final BuildOwner _buildOwner = BuildOwner(focusManager: FocusManager());
  final RenderObjectToWidgetElement<RenderBox> _rootElement =
      RenderObjectToWidgetAdapter<RenderBox>(
    container: _repaintBoundary,
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: IntrinsicHeight(child: IntrinsicWidth(child: widget)),
    ),
  ).attachToRenderTree(_buildOwner);

  _buildOwner
    ..buildScope(_rootElement)
    ..finalizeTree();
  _pipelineOwner
    ..flushLayout()
    ..flushCompositingBits()
    ..flushPaint();

  ui.Image _image =
      await _repaintBoundary.toImage(pixelRatio: ui.window.devicePixelRatio);
  ByteData _byteData = await _image.toByteData(format: ui.ImageByteFormat.png);
  return _byteData.buffer.asUint8List();
}
