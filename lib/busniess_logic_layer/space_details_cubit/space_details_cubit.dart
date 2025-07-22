import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';

part 'space_details_state.dart';

class SpaceDetailsCubit extends Cubit<SpaceDetailsState> {
  SpaceDetailsCubit(this.workspace) : super(SpaceDetailsInitial());
  final Workspace workspace;

  String createImageUrl() {
    return '${MyStrings.baseImageUrl}${workspace.directory}/${workspace.image}';
  }
 
}
