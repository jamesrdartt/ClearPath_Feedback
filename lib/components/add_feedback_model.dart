import '/flutter_flow/flutter_flow_util.dart';
import 'add_feedback_widget.dart' show AddFeedbackWidget;
import 'package:flutter/material.dart';

class AddFeedbackModel extends FlutterFlowModel<AddFeedbackWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
