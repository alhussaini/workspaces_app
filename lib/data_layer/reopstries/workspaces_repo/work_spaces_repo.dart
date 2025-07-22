import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:workspace/data_layer/error/fauiler.dart';
import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';
import 'package:workspace/data_layer/web_servives/workspace_services/get_workspaces_data_service.dart';

class WorkSpacesRepo {
  final GetWorkspacesDataService getWorkspacesDataService;

  WorkSpacesRepo({required this.getWorkspacesDataService});

  Future<Either<Failure, WorkspacesResponse>> getWorkspacesDataFromService(
      ) async {
    try {
      var data = await getWorkspacesDataService.getWorkspacesData();
      // print("Response from WorkSpacesRepo repo is $data");
      return right(WorkspacesResponse.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        print("fauiler from WorkSpacesRepo repo is $e");
        return left(ServerFailure.fromDioError(e));
      } else {
        print("fauiler from WorkSpacesRepo repo is $e");
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
