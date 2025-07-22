// import 'package:flutter/material.dart';
// import 'package:workspace/presention_layer/widgets/book_widgets/date/cleander/closeable_background.dart';
// import 'package:workspace/presention_layer/widgets/book_widgets/date/cleander/opening_window.dart';

// void buildCalnderOverly(
//     BuildContext context,
//     GlobalKey key,
//     OverlayEntry? overlayEntry,
//     DateTime selectedDate,
//     GestureTapCallback removeOverlay,
//     Function(DateTime) press) {
//   final RenderBox renderBox =
//       key.currentContext!.findRenderObject() as RenderBox;
//   final Offset offset = renderBox.localToGlobal(Offset.zero);
//   final Size size = renderBox.size;
//   final double screenHeight = MediaQuery.of(context).size.height;
//   final double availableHeight = screenHeight - offset.dy - size.height - 20;

//   overlayEntry = OverlayEntry(
//     builder: (context) {
//       return Stack(
//         children: [
//           CloseableBackground(onTap: removeOverlay), // transpert background
//           OpeningWindow(
//               availableHeight: availableHeight,
//               selectedDate: selectedDate,
//               press: press)
//         ],
//       );
//     },
//   );

//   Overlay.of(context).insert(overlayEntry);
// }
