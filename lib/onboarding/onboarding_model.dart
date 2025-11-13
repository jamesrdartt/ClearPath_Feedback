import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_profilePhoto = false;
  FFUploadedFile uploadedLocalFile_profilePhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_profilePhoto = '';

  // State field(s) for Onboarding-Name widget.
  FocusNode? onboardingNameFocusNode;
  TextEditingController? onboardingNameTextController;
  String? Function(BuildContext, String?)?
      onboardingNameTextControllerValidator;
  // State field(s) for Onboarding-Email widget.
  FocusNode? onboardingEmailFocusNode;
  TextEditingController? onboardingEmailTextController;
  String? Function(BuildContext, String?)?
      onboardingEmailTextControllerValidator;
  // State field(s) for Onboarding-Password widget.
  FocusNode? onboardingPasswordFocusNode;
  TextEditingController? onboardingPasswordTextController;
  late bool onboardingPasswordVisibility;
  String? Function(BuildContext, String?)?
      onboardingPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    onboardingPasswordVisibility = false;
  }

  @override
  void dispose() {
    onboardingNameFocusNode?.dispose();
    onboardingNameTextController?.dispose();

    onboardingEmailFocusNode?.dispose();
    onboardingEmailTextController?.dispose();

    onboardingPasswordFocusNode?.dispose();
    onboardingPasswordTextController?.dispose();
  }
}
