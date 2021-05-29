import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/utils/dimensions.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/widgets/fragments/buttons/app_back_button.dart';

class DetailScaffold extends StatefulWidget {
  final List<Widget> actions;
  final String title;
  final Widget body;
  final Widget? header;
  final double headerRatio;
  final ScrollController? controller;
  final bool implyLeading;

  DetailScaffold({
    this.actions = const [],
    this.title = "",
    required this.body,
    this.header,
    this.headerRatio = .26,
    this.controller,
    this.implyLeading = true,
  }) : assert(headerRatio >= .2 && headerRatio <= 1);

  @override
  State<StatefulWidget> createState() => _DetailScaffoldState();
}

class _DetailScaffoldState extends State<DetailScaffold> {
  late final ValueNotifier<double> _ratioRef;
  late final XfScaleUtil scaler;

  @override
  void initState() {
    super.initState();
    scaler = context.scaler;
    _ratioRef = ValueNotifier(widget.headerRatio);
    if (widget.controller != null) {
      widget.controller!.addListener(() {
        if (widget.controller!.position.isScrollingNotifier.value) {
          final scrollExtentFraction = widget.controller!.position.pixels /
              widget.controller!.position.maxScrollExtent;
          final fraction = widget.headerRatio * scrollExtentFraction;
          final _newHeightFraction = widget.headerRatio - fraction;
          if (_newHeightFraction >= widget.headerRatio) {
            _ratioRef.value = widget.headerRatio;
            return;
          }
          if (_newHeightFraction >= .05) {
            _ratioRef.value = _newHeightFraction;
          }
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  // _disposeController() {
  //   if (widget.controller != null) {
  //     widget.controller?.dispose();
  //   }
  // }

  Container _iconContainer(Widget? child) {
    return Container(
      padding: scaler.insets.all(.2),
      child: Center(
        child: child,
      ),
      decoration: BoxDecoration(
        color: XfColors.trueBlack.withOpacity(_ratioRef.value > .1 ? 0 : .3),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: XfColors.transparent,
        body: ValueListenableBuilder<double>(
          valueListenable: _ratioRef,
          builder: (context, ratio, child) {
            return Stack(
              alignment: AlignmentDirectional.bottomEnd,
              fit: StackFit.expand,
              children: [
                Container(
                  height: scaler.sizer.setHeight(100 * ratio),
                  child: Stack(
                    children: [
                      widget.header ?? Offstage(),
                    ],
                  ),
                ),
                Positioned.fill(
                  top: scaler.sizer.setHeight(100 * ratio - 1),
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: scaler.sizer.setHeight((100 / ratio) - 1),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: XfColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(scaler.fontSizer.sp(80)),
                      ),
                    ),
                    child: child,
                  ),
                ),
                if (widget.implyLeading)
                  Positioned(
                    top: scaler.sizer.setHeight(5),
                    left: scaler.sizer.setWidth(3),
                    child: _iconContainer(
                      AppBackButton(color: XfColors.white),
                    ),
                  ),
                Positioned(
                  top: scaler.sizer.setHeight(5),
                  right: scaler.sizer.setWidth(3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (final action in widget.actions)
                        _iconContainer(action),
                    ],
                  ),
                ),
              ],
            );
          },
          child: widget.body,
        ),
      ),
      onWillPop: () async {
        return true;
      },
    );
  }
}
