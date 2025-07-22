import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workspace/data_layer/models/workspace_models/copoun_model.dart';
import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';
import 'package:workspace/data_layer/reopstries/workspaces_repo/work_spaces_repo.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<Homestate> {
  final WorkSpacesRepo workSpacesRepo;
  List<CoupounModel> copouns=[];
  final TextEditingController searchController = TextEditingController();
  HomeCubit(this.workSpacesRepo) : super(HomeCubitInitial());
WorkspacesResponse? workspaces;


  // Load all workspaces
  Future<void> loadWorkspaces() async {
    emit(HomeLoading());
    try {
      final response = await workSpacesRepo.getWorkspacesDataFromService();
      response.fold(
        (failure) => emit(HomeFailed(errorMessage: failure.errorMessage)),
        (responseModel) {
          workspaces = responseModel;
          copouns=extractAllCoupons();
          emit(HomeLoaded(workspacesResponse: responseModel));
        },
      );
    } catch (e) {
      emit(HomeFailed(errorMessage: e.toString()));
    }
  }

  // Filter by room type
  void filterByRoomType(String roomType) {
    final currentWorkspaces = workspaces!.workspaces;

    final filtered = currentWorkspaces
        .where((ws) => ws.rooms.any((room) => room.typeName == roomType))
        .toList();

    emit(HomeFilteredByRoomType(
      filteredWorkspaces: filtered,
      selectedRoomType: roomType,
    ));
  }

  // Search workspaces by name or description
  void searchWorkspaces(String query) {
    if (query.isEmpty) {
      return; // Do nothing if query is empty
    }

      final currentWorkspaces =workspaces!.workspaces;

      final result = currentWorkspaces
          .where((ws) =>
              ws.name.toLowerCase().contains(query.toLowerCase()) ||
              ws.description.toLowerCase().contains(query.toLowerCase()))
          .toList();

      emit(HomeSearched(searchedWorkspaces: result, query: query));
    
  }
// Inside HomeCubit class

List<CoupounModel> extractAllCoupons() {
  if (workspaces == null) return [];

  List<CoupounModel> myCoupons = [];

  for (var workspace in workspaces!.workspaces) {
    if (workspace.coupons != null && workspace.coupons.isNotEmpty) {
      for (var coupon in workspace.coupons) {
        myCoupons.add(
          CoupounModel(
            id: coupon.id,
            hours: int.tryParse(coupon.hours) ?? 0,
            expiresAt: int.tryParse(coupon.expiresAt) ?? 0,
            price: double.tryParse(coupon.price) ?? 0.0,
            workspaceId: workspace.id,
            workspaceName: workspace.name,
            workspaceAmenities: workspace.amenities,
            directory: workspace.directory,
          ),
        );
      }
    }
  }

  return myCoupons;
}
  // Reset to original list
  void resetToOriginal() {
    
      emit(HomeLoaded(workspacesResponse: workspaces!)); // Re-emit the current loaded state
    
  }
}
