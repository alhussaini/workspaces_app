import 'package:flutter/material.dart';
import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';
import 'package:workspace/presention_layer/holde_tests/workspace_card_test.dart';

class WorkspacesList extends StatelessWidget {
  final List<Workspace> workspaces;

  const WorkspacesList({
    super.key,
    required this.workspaces,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      physics: const BouncingScrollPhysics(),
      itemCount: workspaces.length,
      itemBuilder: (context, index) {
        final workspace = workspaces[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: WorkspaceCardTest(workspace: workspace),
        );
      },
    );
  }
}
