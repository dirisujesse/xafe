import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/utils/paints.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';

class AppSpinner extends StatelessWidget {
  const AppSpinner();

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Center(
      child: SizedBox(
        height: scaler.sizer.setHeight(8),
        width: scaler.sizer.setHeight(8),
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          backgroundColor: XfColors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(XfColors.black),
        ),
      ),
    );
  }
}

class AppLinearProgress extends StatelessWidget {
  final double? extent;
  final double width;
  final double height;
  final Color valueColor;
  final bool inferInactiveColor;

  const AppLinearProgress({
    this.extent,
    this.valueColor = XfColors.black,
    this.width = 100,
    this.height = 1.2,
    this.inferInactiveColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: ProgressPainter(
          color: valueColor,
          inactiveColor:
              inferInactiveColor ? valueColor.withOpacity(.1) : XfColors.grey,
          extent: extent ?? 0,
        ),
        child: XfSizedBox(
          height: height,
          width: width,
        ),
      ),
    );
  }
}

class AppBarChart extends StatefulWidget {
  final double? extent;
  final double width;
  final double height;
  final Color valueColor;
  final Color backgroundColor;

  const AppBarChart({
    this.extent,
    this.valueColor = XfColors.white,
    this.width = 30,
    this.height = 40,
    this.backgroundColor = XfColors.transparent,
  });

  @override
  State<StatefulWidget> createState() {
    return _AppBarChartState();
  }
}

class _AppBarChartState extends State<AppBarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      duration: Duration(seconds: 1),
      lowerBound: 0,
      upperBound: widget.extent ?? .001,
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    super.dispose();
    _ctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return XfSizedBox(
      height: widget.height,
      width: widget.width,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, __) {
          return CustomPaint(
            painter: BarPainter(
              color: widget.valueColor,
              inactiveColor: widget.backgroundColor,
              extent: _ctrl.value,
            ),
          );
        },
      ),
    );
  }
}
