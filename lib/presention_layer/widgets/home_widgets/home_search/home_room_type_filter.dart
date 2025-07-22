// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:workspace/busniess_logic_layer/home_cubit/home_cubit_cubit.dart';
// import 'package:workspace/constants/my_colors.dart';
// import 'package:workspace/constants/my_strings.dart';

// import '../../../../data_layer/models/workspace_models/workspace_response_model.dart';

// class HomeRoomTypeFilter extends StatelessWidget {
//   const HomeRoomTypeFilter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, Homestate>(
//       builder: (context, state) {
//         String selectedType = "";
        
//         if (state is HomeLoaded || state is HomeFilteredByRoomType) {
//           final List<RoomType> roomsType =context.read<HomeCubit>().workspaces!.roomTypes ;
//           return SizedBox(
//             height: 40.h,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount:roomsType.length,
//               itemBuilder: (context, index) {
//                 final isSelected = roomsType[index].name == selectedType;
//                 RoomTypeItem(
//                   roomType: roomsType[index],
//                   isSelected: isSelected,
//                   onTap: () {
//                     if (isSelected) {
//                       context.read<HomeCubit>().resetToOriginal();
//                     } else {
//                       context
//                           .read<HomeCubit>()
//                           .filterByRoomType(roomsType[index].name);
//                     }
//                   },
//                 );
//               },
//             ),
//           );
//         } else {
//           return Text('wait unntil home laoded');
//         }
//       },
//     );
//   }
// }

// class RoomTypeItem extends StatelessWidget {
//   final RoomType? roomType;
//   final bool isSelected;
//   final VoidCallback? onTap;

//   const RoomTypeItem({
//     super.key,
//     this.roomType,
//     this.isSelected = false,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 6),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 10,
//           ),
//           decoration: BoxDecoration(
//             color: isSelected
//                 ? MyColors.bottomColor
//                 : MyColors.backgroundColor,
//             borderRadius: BorderRadius.circular(20),
//             border:Border.all(color: MyColors.bottomColor
//           ),),
//           child: Text(
//             roomType?.name ?? '',
//             style: TextStyle(
//               color: isSelected ? Colors.white : Colors.black,
//               fontWeight: FontWeight.w500,
//               fontFamily: MyStrings.cairoFont,
//               fontSize: 14.sp,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
