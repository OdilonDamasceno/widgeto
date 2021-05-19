# widgeto

A simple way to transform your widget into other formats

## Add to pubspec.yaml

```yaml
dependencies:
  widgeto: 0.0.1
```

## Example

```dart
import 'package:widgeto/widgeto.dart';
import 'package:flutter/material.dart';

void main() async {
    Widgeto widgeto = new Widgeto();
    await widgeto.pdf(Container(
        height: 100,
        width: 200,
        color: Colors.red,
    );
}
```

