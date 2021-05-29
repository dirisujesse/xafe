import 'package:flutter/widgets.dart';
import 'package:xafe/utils/dimensions.dart';

extension WidgetExtensions on Widget {
  List<Widget> operator *(int count) {
    return List.generate(count, (_) => this);
  }
}

extension ScaleExtension on BuildContext {
  XfScaleUtil get scaler {
    return XfScaleUtil(this);
  }
}

extension SnapshotExtension on AsyncSnapshot {
  bool get isLoading {
    return this.connectionState == ConnectionState.waiting;
  }

  bool get isLoaded {
    return !isLoading && !this.hasError && this.hasData;
  }

  bool get isEmpty {
    if ((this.data is Iterable?) || (this.data is Iterable)) {
      return !this.hasData || ((this.data as Iterable?)?.isEmpty ?? false);
    }
    return !this.hasData;
  }
}

extension DateExtension on DateTime {
  bool operator <(DateTime other) {
    return this.millisecondsSinceEpoch < other.millisecondsSinceEpoch;
  }

  bool operator >(DateTime other) {
    return this.millisecondsSinceEpoch > other.millisecondsSinceEpoch;
  }
}
