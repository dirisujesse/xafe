import 'dart:async';

import 'package:xafe/utils/typedefs.dart';

Timer countDown({
  int seconds = (60 * 3),
  required OnChanged<int> onTick,
  required OnPressed onComplete,
}) {
  int i = seconds;
  onTick(i);
  return Timer.periodic(Duration(seconds: 1), (_) {
    if (i <= 0) {
      if (_.isActive) _.cancel();
      onComplete();
      return;
    }
    onTick(i - 1);
    i--;
  });
}
