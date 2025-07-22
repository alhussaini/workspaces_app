// import 'package:flutter/material.dart';

// import 'package:workspace/presention_layer/widgets/new_book_widgets/rooms_type/room_type.dart';

// class RoomsTypeTest extends StatefulWidget {
//   const RoomsTypeTest({super.key});

//   @override
//   State<RoomsTypeTest> createState() => _RoomsTypeTestState();
// }

// class _RoomsTypeTestState extends State<RoomsTypeTest> {
//   int selectedIndex = 0;
//   onTap(int listIndex) {
//     setState(() {
//       selectedIndex = listIndex;
//     });
//   }

//   List<String> roomTypes = ["غرفة مشتركة", "فردية", "اجتماعات", "عمل حر"];
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Scaffold(
//         body: SizedBox(
//           height: height / 15,
//           child: Center(
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: roomTypes.length,
//                 itemBuilder: (context, index) {
//                   return RoomType(
//                       onTap: () => onTap(index),
//                       isSelected: false,
//                       text: roomTypes[index]);
//                 }),
//           ),
//         ),
//       ),
//     );
//   }
// }
