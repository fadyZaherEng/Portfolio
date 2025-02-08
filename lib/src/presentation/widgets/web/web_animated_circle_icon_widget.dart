// import 'package:flutter/material.dart';
// import 'package:my_portfolio/src/config/theme/color_schemes.dart';
// import 'package:my_portfolio/src/presentation/screens/landing_app/landing_mobile/widgets/circle_icon_widget.dart';
// import 'package:my_portfolio/src/presentation/screens/landing_app/landing_web/widgets/web_circle_icon_widget.dart';
//
// class WebAnimatedCircleIconWidget extends StatefulWidget {
//   final double width;
//   final double height;
//   final String imagePath;
//   final double animatedBorderWidth;
//   final Function onTap;
//   final bool isNetwork;
//
//   const WebAnimatedCircleIconWidget({
//     super.key,
//     required this.width,
//     required this.height,
//     required this.imagePath,
//     required this.onTap,
//     this.animatedBorderWidth = 4,
//     required this.isNetwork,
//   });
//
//   @override
//   State<WebAnimatedCircleIconWidget> createState() =>
//       _WebAnimatedCircleIconWidgetState();
// }
//
// class _WebAnimatedCircleIconWidgetState
//     extends State<WebAnimatedCircleIconWidget> {
//   bool _isCursorsEnter = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) {
//         _isCursorsEnter = true;
//         setState(() {});
//       },
//       onExit: (_) {
//         _isCursorsEnter = false;
//         setState(() {});
//       },
//       child: Stack(
//         children: [
//           Container(
//             width: widget.width,
//             height: widget.height,
//             decoration: const BoxDecoration(
//               color: Colors.transparent,
//               shape: BoxShape.circle,
//             ),
//           ),
//           Visibility(
//             visible: _isCursorsEnter,
//             child: Positioned(
//               top: 0,
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: ColorSchemes.primary.withOpacity(0.6),
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: widget.animatedBorderWidth,
//             bottom: widget.animatedBorderWidth,
//             left: widget.animatedBorderWidth,
//             right: widget.animatedBorderWidth,
//             child: MediaQuery.of(context).size.width < 850
//                 ? CircleIconWidget(
//                     width: widget.width,
//                     height: widget.height,
//                     imagePath: widget.imagePath,
//                     iconColor: ColorSchemes.primary,
//                     borderColor: ColorSchemes.primary,
//                     onTap: () {
//                       widget.onTap();
//                     })
//                 : WebCircleIconWidget(
//                     width: widget.width,
//                     height: widget.height,
//                     imagePath: widget.imagePath,
//                     borderColor: ColorSchemes.primary,
//                     isNetwork: widget.isNetwork,
//                     onTap: () {
//                       widget.onTap();
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
