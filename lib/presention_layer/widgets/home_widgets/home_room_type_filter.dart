import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/home_cubit/home_cubit_cubit.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';

class HomeRoomTypeFilter extends StatelessWidget {
  const HomeRoomTypeFilter({super.key, required this.roomsType});
  final List<RoomType> roomsType;

  @override
  Widget build(BuildContext context) {
    return RoomsTypesListView(
      roomsType: roomsType,
    );
  }
}

class RoomsTypesListView extends StatelessWidget {
  const RoomsTypesListView({
    super.key,
    required this.roomsType,
  });

  final List<RoomType> roomsType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: roomsType.length,
        itemBuilder: (context, index) {
          return RoomTypeItem(
            roomType: roomsType[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class RoomTypeItem extends StatelessWidget {
  final RoomType? roomType;
  bool isSelected = false;
  final VoidCallback? onTap;

  RoomTypeItem({
    super.key,
    required this.roomType,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, Homestate>(
      builder: (context, state) {
        if (state is HomeFilteredByRoomType) {
          isSelected = state.selectedRoomType == roomType!.name;
        }
        return GestureDetector( 
          onTap: () {
            if (isSelected) {
              context.read<HomeCubit>().resetToOriginal();
              isSelected = false;
            } else {
              context.read<HomeCubit>().filterByRoomType(roomType!.name);
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isSelected ? MyColors.bottomColor : Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: MyColors.bottomColor,
                width: 1,
              ),
            ),
            child: Text(
              roomType?.name ?? '',
              style: TextStyle(
                color: isSelected ? Colors.white : MyColors.bottomColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
