import 'package:flutter/widgets.dart';
import 'package:xafe/utils/extensions.dart';

class XfSizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;

  const XfSizedBox({this.height = 0, this.width = 0, this.child});

  @override
  Widget build(BuildContext context) {
    final sizer = context.scaler.sizer;

    return SizedBox(
      height: sizer.setHeight(height),
      width: sizer.setWidth(width),
      child: child,
    );
  }
}
