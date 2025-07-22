import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:workspace/busniess_logic_layer/Copouns/copouns_cubit.dart';
import 'package:workspace/busniess_logic_layer/home_cubit/home_cubit_cubit.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/data_layer/models/workspace_models/copoun_model.dart';
import 'package:workspace/presention_layer/screens/favourites_screen.dart';
import 'package:workspace/presention_layer/screens/profile_screen.dart';
import 'package:workspace/presention_layer/widgets/home_widgets/drawer/custom_drawer.dart';
import 'package:workspace/presention_layer/widgets/home_widgets/home_body/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  int _currentPageIndex = 3;
  
  final _screens = [
    ProfileScreen(onPressed: () {
      // Add your profile functionality here
    }),
    WorkspacePreferencesPage(),
    CopounsBody(),
    
    HomeScreenBody(),
  
    
  ];

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    
    
  }

  @override
  void dispose() {
    _motionTabBarController?.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: const CustomDrawer(),
        
        body: _screens[_currentPageIndex],
        
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.ltr,
          child: buildMotionBar()),
      ),
    );
  }

  MotionTabBar buildMotionBar() {
    return MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "الرئيسية",
        useSafeArea: true,
        labels: const ["الملف الشخصي", "المفضلة", "العروض", "الرئيسية"],

        icons: const [
          Icons.person,
          Icons.favorite,
          Icons.hot_tub,
          Icons.home,
          
          
          
        ],
        
        // Styling
        tabSize: 50,
        tabBarHeight: 65,
        textStyle:  TextStyle(
          fontSize: 14.sp,
          color: MyColors.bottomColor,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Color(0xffC8DBCF),
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: MyColors.bottomColor,
        tabIconSelectedColor: MyColors.backgroundColor,
        tabBarColor: MyColors.backgroundColor,
        
        onTabItemSelected: (int value) {
          setState(() {
            _currentPageIndex = value;
          });
        },
      );
  }
}




class CopounsBody extends StatelessWidget {
  const CopounsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CopounsCubit()
          ..loadCoupons(context.read<HomeCubit>().copouns),
      child: BlocBuilder<CopounsCubit, CopounsState>(
        builder: (context, state) {
          if (state is CopounsLoaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              itemCount: state.coupons.length,
              itemBuilder: (context, index) {
                return CouponCard(coupon: state.coupons[index]);
              },
            );
          } else if (state is CopounsEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_offer_outlined,
                    size: 64.sp,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'لا توجد كوبونات متاحة حاليًا',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey[600],
                      fontFamily: MyStrings.cairoFont,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64.sp,
                    color: Colors.red[400],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'حدث خطأ في تحميل الكوبونات',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.red[600],
                      fontFamily: MyStrings.cairoFont,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CopounsCubit>().loadCoupons(
                          context.read<HomeCubit>().copouns);
                    },
                    child: Text(
                      'إعادة المحاولة',
                      style: TextStyle(
                        fontFamily: MyStrings.cairoFont,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}




class CouponCard extends StatelessWidget {
  final CoupounModel coupon;
  
  const CouponCard({
    super.key,
    required this.coupon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
                    Container(
            width: 75.w,
            height: 75.h,
            margin: EdgeInsets.only(right: 16.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image:AssetImage("assets/images/copouns.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Left green section
          
          
          // Right content section
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Workspace name
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      coupon.workspaceName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w900,
                        color: MyColors.bottomColor,
                        fontFamily: MyStrings.cairoFont,
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 8.h),
                  
                  // Amenities
                 Text(
                    coupon.workspaceAmenities.map((a) => a.name).join(' • '),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14.sp,
                      fontFamily: MyStrings.cairoFont,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  SizedBox(height: 12.h),
                  
                  // Monthly package text
                  Text(
                    'باقة شهرية :',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black54,
                      fontFamily: MyStrings.cairoFont,
                    ),
                  ),
                  
                  SizedBox(height: 4.h),
                  
                  // Hours and price
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${coupon.hours} ساعة ب ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color:  Color(0xFFFF6542),
                            fontFamily: MyStrings.cairoFont,
                          ),
                        ),
                        TextSpan(
                          text: '${coupon.price.toInt()} جنيه',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFF6542),
                            fontFamily: MyStrings.cairoFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 8.h),
                  
                  // Additional description
                  Text(
                    'استخدم ساعاتك متى شئت خلال الشهر بكل حرية وبدون قيود',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                      fontFamily: MyStrings.cairoFont,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          
          Container(
            width: 67.w,
            height: 90.h,
            decoration: BoxDecoration(
              color: const Color(0xFF66A185),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'احصل عليها',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: MyStrings.cairoFont,
                  ),
                ),
                SizedBox(height: 8.h),
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}