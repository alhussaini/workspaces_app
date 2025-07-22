import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';
import 'package:go_router/go_router.dart';

class WorkspaceCardTest extends StatefulWidget {
  final Workspace workspace;
  const WorkspaceCardTest({super.key, required this.workspace});

  @override
  State<WorkspaceCardTest> createState() => _WorkspaceCardTestState();
}

class _WorkspaceCardTestState extends State<WorkspaceCardTest> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(MyStrings.workSpaceDetailsScreen,
            extra: widget.workspace);
      },
      child: Container(
        height: 310.h,
        width: 310.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: SizedBox(
                height: 180.h,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/wrokspace-card.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? MyColors.bottomColor : Colors.grey,
                      size: 24.sp,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.workspace.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: MyColors.bottomColor,
                        fontSize: 24.sp,
                        fontFamily: MyStrings.cairoFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '4.9',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14.sp,
                          fontFamily: MyStrings.cairoFont,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: AmenitiesHomeWorkSpaces(
                      amenities: widget.workspace.amenities,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:workspace/constants/my_colors.dart';
// import 'package:workspace/constants/my_strings.dart';
// import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';

// class WorkspaceCardTest extends StatelessWidget {
//   final Workspace workspace;
//   const WorkspaceCardTest({super.key, required this.workspace});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, MyStrings.workSpaceDetailsScreen,
//             arguments: workspace);
//       },
//       child: Container(
//         height: 350.h,
//         width: 310.w,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),

//         ),
//         child: Column(
//           children: [
//             SizedBox(
//                 height: 180.h,
//                 width: double.infinity,
//                 child: Image.asset(
//                   'assets/images/wrokspace-card.jpg',
//                   fit: BoxFit.cover,
//                 )),
//             SizedBox(
//               height: 10.h,
//             ),
//             RPadding(
//               padding: EdgeInsets.symmetric(horizontal: 16.r),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     workspace.name,
//                     style: TextStyle(
//                         color: MyColors.bottomColor,
//                         fontSize: 24.sp,
//                         fontFamily: MyStrings.cairoFont),
//                   ),
//                 ],
//               ),
//             ),
//             AmenitiesHomeWorkSpaces(
//               amenities: workspace.amenities,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

//******************Amenities Widget*********************** */
class AmenitiesHomeWorkSpaces extends StatelessWidget {
  final List<Amenity> amenities;
  const AmenitiesHomeWorkSpaces({
    super.key,
    required this.amenities,
  });

  @override
  Widget build(BuildContext context) {
    final amenitiesString = amenities.map((a) => a.name).join(' • ');
    return Text(
      amenitiesString,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: MyColors.amenitiesHome,
          fontSize: 14.sp,
          fontFamily: MyStrings.cairoFont),
    );
  }
}
