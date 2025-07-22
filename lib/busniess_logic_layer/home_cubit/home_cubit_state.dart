part of 'home_cubit_cubit.dart';

sealed class Homestate extends Equatable {
  const Homestate();

  @override
  List<Object?> get props => [];
}

final class HomeCubitInitial extends Homestate {}

class HomeLoading extends Homestate {}

// When data is successfully loaded
class HomeLoaded extends Homestate {
  final WorkspacesResponse workspacesResponse;

  const HomeLoaded({required this.workspacesResponse});

  @override
  List<Object?> get props => [workspacesResponse];
}

// When there's an error fetching data
class HomeFailed extends Homestate {
  final String errorMessage;

  const HomeFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

// When filtering by room type
class HomeFilteredByRoomType extends Homestate {
  final List<Workspace> filteredWorkspaces;
  final String selectedRoomType;

  const HomeFilteredByRoomType({
    required this.filteredWorkspaces,
    required this.selectedRoomType ,
  });

  @override
  List<Object?> get props => [filteredWorkspaces, selectedRoomType];
}

// When searching workspaces
class HomeSearched extends Homestate {
  final List<Workspace> searchedWorkspaces;
  final String query;

  const HomeSearched({
    required this.searchedWorkspaces,
    required this.query,
  });

  @override
  List<Object?> get props => [searchedWorkspaces, query];
}
