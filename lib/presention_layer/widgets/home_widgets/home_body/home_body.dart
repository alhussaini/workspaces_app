import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/home_cubit/home_cubit_cubit.dart';
import 'package:workspace/presention_layer/widgets/home_widgets/home_body/workspaces_list.dart';
import 'package:workspace/presention_layer/widgets/home_widgets/home_nearby_spaces_header.dart';
import 'package:workspace/presention_layer/widgets/home_widgets/home_room_type_filter.dart';
import 'package:workspace/presention_layer/widgets/home_widgets/home_search/home_search_bar.dart';
import 'package:workspace/presention_layer/widgets/home_widgets/top_bar/home_top_bar.dart';
import 'package:workspace/presention_layer/widgets/home_widgets/top_bar/home_welcome_text.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late final HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<HomeCubit>();
    _cubit.loadWorkspaces(); 
  }

  @override
  Widget build(BuildContext context) {
    return ItemsHomeScreenBody();
  }
}

class ItemsHomeScreenBody extends StatelessWidget {
  const ItemsHomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Align(
        alignment: Alignment.topRight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              HomeTopBar(),
              SizedBox(height: 20.h),
              HomeWelcomeText(),
              SizedBox(height: 20.h),
              BlocBuilder<HomeCubit, Homestate>(buildWhen: (previous, current) {
                bool dobuild =
                    (previous is HomeLoading || previous is HomeFailed) &&
                        (current is HomeLoaded);
                return dobuild;
              }, builder: (context, state) {
                if (state is HomeLoaded) {
                  return Column( 
                    children: [
                      HomeSearchBar(
                        onSearchTap: () {
                          
                        },
                        onCouponTap: () {},
                      ),
                      SizedBox(height: 20.h),
                      HomeRoomTypeFilter(
                        roomsType: state.workspacesResponse.roomTypes,
                      ),
                    ],
                  );
                } else {
                  return Text("wait ");
                }
              }),
              SizedBox(height: 20.h),      
              HomeNearbySpacesHeader(),
              SizedBox(height: 20.h),
              SizedBox(
                height: 300,
                child: BlocBuilder<HomeCubit, Homestate>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      );
                    } else if (state is HomeLoaded) {
                      return WorkspacesList(
                          workspaces: state.workspacesResponse.workspaces);
                    } else if (state is HomeFilteredByRoomType) {
                      return WorkspacesList(workspaces: state.filteredWorkspaces);
                    } else if (state is HomeSearched) {
                      return WorkspacesList(workspaces: state.searchedWorkspaces);
                    } else if (state is HomeFailed) {
                      return Center(child: Text(state.errorMessage));
                    } else {
                      return const Center(child: Text("Unknown error"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
