import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/space_details_cubit/space_details_cubit.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/widgets/basic_widgets/submit_button.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/features_section/features_section.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/rating_section/rating_section.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/rooms_text.dart';
import 'package:workspace/presention_layer/widgets/basic_widgets/opining_image.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/sharing_rooms_text.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/starbust_text.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/work_space_descreption/work_space_descreption_item.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/work_space_images/work_space_images_section.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.workspace});
  final Workspace workspace;

  @override
  Widget build(BuildContext context) {
    final deatilsCubit = context.read<SpaceDetailsCubit>();
    return Scaffold(
      // backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OpiningImage(
                  image: 'assets/images/opining_image.jpeg',
                ),
                SizedBox(
                  height: 12,
                ),
                Align(alignment: Alignment.topLeft, child: StarbustText()),
                RoomsText(
                  amenities: workspace.amenities,
                ),
                SharingRoomsText(),
                WorkSpaceDescreptionItem(
                  description: deatilsCubit.workspace.description,
                ),
                WorkSpaceImagesSection(),
                FeaturesSection(
                  amenities: deatilsCubit.workspace.amenities,
                ),
                RatingSection(),
                RoomsCardList(rooms: deatilsCubit.workspace.rooms),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoomsCardList extends StatelessWidget {
  const RoomsCardList({super.key, required this.rooms});
  final List<Room> rooms;
  final x = 10; 
 

  @override
  Widget build(BuildContext context) {
     
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            final String roomPrice;
            if(rooms[index].pricing.isEmpty){
roomPrice ='50';
            }else{
              roomPrice =rooms[index].pricing[0].pricePerHour.toString();
            }
            return RoomCard(
              roomName: rooms[index].typeName,
              roomPrice:roomPrice ,
              roomId: rooms[index].id,
            );
          }),
    );
  }
}

class RoomCard extends StatelessWidget {
  const RoomCard(
      {super.key,
      required this.roomName,
      required this.roomPrice,
      required this.roomId});
  final String roomName;
  final String roomPrice;
  final String roomId;
  final String pricingStandard = "جنية /ساعة";

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      child: Container(
        height: 250.h,
        width: 185.w,
        color: Color(0xffFAFAFA),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 135.h,
              width: double.infinity,
              child: Image.asset('assets/images/roomspace.jpg'),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    roomName,
                    style: TextStyle(
                        fontFamily: MyStrings.cairoFont,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.myBlack),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                VerticalDivider(
                  color: MyColors.dividerColor,
                  thickness: 1.5,
                ),
                Text(
                  roomPrice,
                  style: TextStyle(
                      fontFamily: MyStrings.poppinsFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: MyColors.myRed),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  pricingStandard,
                  style: TextStyle(
                      fontFamily: MyStrings.poppinsFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: MyColors.bottomColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            SubmitButton(
                press: () {
                  context.pushNamed( MyStrings.bookingScreen,
                    extra: {
                        'roomId': roomId,
                        'workspaceId':
                            context.read<SpaceDetailsCubit>().workspace.id,
                        'isCalender': true,
                      });
                },
                text: S.of(context).bookNow,
                height: 30.h,
                width: double.infinity)
          ],
        ),
      ),
    );
  }
}
