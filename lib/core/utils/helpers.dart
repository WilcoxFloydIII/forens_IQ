// import 'dart:async';
// import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';
// import 'dart:ui' as ui;
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Debouncer {
//   final int milliseconds;
//   VoidCallback? action;
//   Timer? _timer;

//   Debouncer({required this.milliseconds});

//   void run(VoidCallback action) {
//     _timer?.cancel();
//     _timer = Timer(Duration(milliseconds: milliseconds), action);
//   }
// }

// String formatNumber(num number) {
//   return NumberFormat().format(number);
// }

// Future<BitmapDescriptor> bitmapDescriptorFromSvgAsset(
//     BuildContext context, String assetName,
//     {double width = 50, double height = 50}) async {
//   // Load the SVG string from assets
//   String svgString = await DefaultAssetBundle.of(context).loadString(assetName);

//   // Create a DrawableRoot from the SVG string
//   final SvgStringLoader svgStringLoader = SvgStringLoader(svgString);
//   final PictureInfo pictureInfo = await vg.loadPicture(svgStringLoader, null);

//   // Convert the Picture to a ui.Image
//   ui.Image image =
//       await pictureInfo.picture.toImage(width.toInt(), height.toInt());

//   // Get the byte data in PNG format
//   ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);

//   // Return BitmapDescriptor from the byte data
//   return BitmapDescriptor.bytes(bytes!.buffer.asUint8List());
// }
