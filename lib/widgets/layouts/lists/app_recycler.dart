import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xafe/utils/typedefs.dart';

class XfRecyclerView extends StatelessWidget {
  final int pageCount;
  final int page;
  final OnPressed onScrollEnd;
  final bool isLoading;

  ///
  /// When canFetch is true on scrolling to the end of the scroll view
  /// a request to fetch new recrods can be made, Otherwise the list
  ///  remains as it is and no new records can be fetched
  ///
  final bool hasNext;
  final ScrollView child;

  XfRecyclerView({
    required this.page,
    required this.pageCount,
    required this.onScrollEnd,
    required this.isLoading,
    required this.child,
    required this.hasNext,
  });

  bool overscrolled(ScrollNotification notifier) {
    if (Platform.isIOS) {
      return notifier.metrics.outOfRange &&
          notifier.metrics.axisDirection == AxisDirection.down;
    }
    return notifier is OverscrollNotification && notifier.overscroll > 0;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notifier) {
        if (!isLoading && (hasNext && overscrolled(notifier))) {
          onScrollEnd();
        }
        return true;
      },
      child: child,
    );
  }
}
