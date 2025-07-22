import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';

class WorkspacePreferencesPage extends StatelessWidget {
  const WorkspacePreferencesPage({super.key});

  // Static data for workspaces
  final List<StaticWorkspace> workspaces = const [
    StaticWorkspace(
      name: 'Workpair Co',
      amenities: ['غرفة الاجتماعات', 'WIFI غير محدود', 'ورشة عمل'],
      rating: 4.9,
      imagePath: 'assets/images/wrokspace-card.jpg',
    ),
    StaticWorkspace(
      name: 'Workpair Co',
      amenities: ['غرفة الاجتماعات', 'WIFI غير محدود', 'ورشة عمل'],
      rating: 4.9,
      imagePath: 'assets/images/wrokspace-card.jpg',
    ),
    StaticWorkspace(
      name: 'Tech Hub',
      amenities: ['مكتب خاص', 'قاعة مؤتمرات', 'مطبخ مجهز', 'موقف سيارات'],
      rating: 4.7,
      imagePath: 'assets/images/wrokspace-card.jpg',
    ),
    StaticWorkspace(
      name: 'Creative Space',
      amenities: ['استوديو تصوير', 'غرفة اجتماعات', 'WIFI عالي السرعة'],
      rating: 4.8,
      imagePath: 'assets/images/wrokspace-card.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Title at the top
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Align(
                alignment: Alignment.topRight, 
                child: Text(
                  'تفضيلاتك ..',
                  style: TextStyle(
                    color: MyColors.bottomColor,
                    fontSize: 24.sp,
                    fontFamily: MyStrings.cairoFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // ListView of workspace cards
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                itemCount: workspaces.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: StaticWorkspaceCard(
                      workspace: workspaces[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StaticWorkspaceCard extends StatefulWidget {
  final StaticWorkspace workspace;
  
  const StaticWorkspaceCard({
    super.key,
    required this.workspace,
  });

  @override
  State<StaticWorkspaceCard> createState() => _StaticWorkspaceCardState();
}

class _StaticWorkspaceCardState extends State<StaticWorkspaceCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to workspace details
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: SizedBox(
                height: 200.h,
                width: double.infinity,
                child: Image.asset(
                  widget.workspace.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.workspace.name,
                      style: TextStyle(
                        color: MyColors.bottomColor,
                        fontSize: 20.sp,
                        fontFamily: MyStrings.cairoFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.workspace.amenities.join(' • '),
                      style: TextStyle(
                        color: MyColors.amenitiesHome,
                        fontSize: 14.sp,
                        fontFamily: MyStrings.cairoFont,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        widget.workspace.rating.toString(),
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14.sp,
                          fontFamily: MyStrings.cairoFont,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}

class StaticWorkspace {
  final String name;
  final List<String> amenities;
  final double rating;
  final String imagePath;

  const StaticWorkspace({
    required this.name,
    required this.amenities,
    required this.rating,
    required this.imagePath,
  });
}