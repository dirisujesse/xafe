// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:xafe/models/enums/future_state.dart';
// import 'package:xafe/utils/helpers.dart';
// import 'package:xafe/utils/typedefs.dart';
// import 'package:xafe/widgets/fragments/indicators/dialog_message.dart';
// import 'package:xafe/widgets/layouts/scaffolds/dialog_scaffold.dart';

// Future<T?> formSubmitDialog<T>({
//   required BuildContext context,
//   required Future<T> future,
//   String errorMessage =
//       "An unexpected error occurred and the request failed, please try again",
//   String prompt = "Processing your request...",
//   String promptMessage = "Please wait as we carry out your request",
//   String successTitle = "Request Successful",
//   String successMessage = "Your request was carried out successflly",
//   bool forceErrorMessage = false,
//   OnChanged<T?>? onComplete,
// }) async {
//   ValueNotifier<FutureState> isResolved = ValueNotifier(FutureState.Loading);
//   final T? result = await showDialog<T?>(
//     context: context,
//     barrierDismissible: false,
//     builder: (ctx) {
//       return WillPopScope(
//         child: ValueListenableBuilder(
//           valueListenable: isResolved,
//           builder: (ctx, FutureState val, _) {
//             return XfDialogScaffold(
//               child: FutureBuilder(
//                 future: future,
//                 builder: (ctx, AsyncSnapshot<T> res) {
//                   if (res.hasData) {
//                     WidgetsBinding.instance?.addPostFrameCallback(
//                       (_) {
//                         Timer(
//                           Duration(milliseconds: 500),
//                           () {
//                             if (onComplete != null) {
//                               onComplete(res.data);
//                               return;
//                             }
//                             Navigator.of(ctx).maybePop(res.data);
//                           },
//                         );
//                         isResolved.value = FutureState.Complete;
//                       },
//                     );
//                     return DialogMessage(
//                       title: successTitle,
//                       message: successMessage,
//                       messageType: MessageType.Success,
//                     );
//                   }
//                   if (res.hasError) {
//                     WidgetsBinding.instance?.addPostFrameCallback(
//                       (_) {
//                         isResolved.value = FutureState.Fail;
//                       },
//                     );

//                     return DialogMessage(
//                       title: "Request Failed",
//                       message: parseError(res.error, errorMessage),
//                       messageType: MessageType.Error,
//                     );
//                   }
//                   return DialogMessage(
//                     title: prompt,
//                     message: promptMessage,
//                     messageType: MessageType.Pending,
//                   );
//                 },
//               ),
//               showClose: val == FutureState.Fail,
//             );
//           },
//         ),
//         onWillPop: () async => isResolved.value != FutureState.Loading,
//       );
//     },
//   );
//   return result;
// }
