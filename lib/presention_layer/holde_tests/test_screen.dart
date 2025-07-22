import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: 
      Text("data"),),
    ));
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:workspace/busniess_logic_layer/home_cubit/home_cubit_cubit.dart';
// import 'package:workspace/constants/my_colors.dart';
// import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';

// class HomeRoomTypeFilter extends StatelessWidget {
//   const HomeRoomTypeFilter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, Homestate>(
//       builder: (context, state) {
//         String selectedType = "";
//         if (state is HomeLoaded || state is HomeFilteredByRoomType) {
//           final roomTypes = context.read<HomeCubit>().workspaces!.roomTypes;
//           return RoomsTypesListView(
//               roomTypes: roomTypes, selectedType: selectedType);
//         } else {
//           return const Center(child: Text('Loading room types...'));
//         }
//       },
//     );
//   }
// }

// class RoomsTypesListView extends StatelessWidget {
//   const RoomsTypesListView({
//     super.key,
//     required this.roomTypes,
//     required this.selectedType,
//   });

//   final List<RoomType> roomTypes;
//   final String selectedType;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40.h,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: roomTypes.length,
//         itemBuilder: (context, index) {
//           final isSelected = roomTypes[index].name == selectedType;
//           return RoomTypeItem(
//             roomType: roomTypes[index],
//             onTap: () {
//               if (isSelected) {
//                 context.read<HomeCubit>().resetToOriginal();
//               } else {
//                 context
//                     .read<HomeCubit>()
//                     .filterByRoomType(roomTypes[index].name);
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class RoomTypeItem extends StatelessWidget {
//   final RoomType? roomType;
//    bool isSelected=false;
//   final VoidCallback? onTap;

//    RoomTypeItem({
//     super.key,
//     required this.roomType,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, Homestate>(
//       builder: (context, state) {
//         if(state is HomeFilteredByRoomType){
//           isSelected = state.selectedRoomType == roomType!.name;
//         }
//         return GestureDetector(
//           onTap: onTap,
//           child: Container(
//             margin: EdgeInsets.symmetric(horizontal: 4.w),
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//             decoration: BoxDecoration(
//               color: isSelected ? MyColors.bottomColor : Colors.white,
//               borderRadius: BorderRadius.circular(20.r),
//               border: Border.all(
//                 color: MyColors.bottomColor,
//                 width: 1,
//               ),
//             ),
//             child: Text(
//               roomType?.name ?? '',
//               style: TextStyle(
//                 color: isSelected ? Colors.white : MyColors.bottomColor,
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
