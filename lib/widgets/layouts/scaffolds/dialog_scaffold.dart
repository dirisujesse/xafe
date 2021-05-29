import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/utils/extensions.dart';

class XfDialogScaffold extends StatelessWidget {
  final Widget child;
  final bool showClose;

  XfDialogScaffold({
    required this.child,
    required this.showClose,
  });

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: scaler.insets.symmetric(
            horizontal: 3,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: XfColors.white,
            borderRadius: BorderRadius.circular(
              scaler.fontSizer.sp(80),
            ),
          ),
          child: SingleChildScrollView(
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: scaler.insets.only(
                    top: 0,
                    bottom: 3,
                    left: 4,
                    right: 4,
                  ),
                  child: child,
                ),
                if (showClose)
                  Positioned(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).maybePop(null);
                        },
                        child: Container(
                          padding: scaler.insets.all(3),
                          child: Icon(
                            Icons.close,
                            color: XfColors.darkGrey,
                            size: scaler.fontSizer.sp(100),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
