import '/confirm/confirm_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textEmailController;
  TextEditingController? textPasswordController;
  String? Function(BuildContext, String?)? textControllerValidator;
  late bool passwordVisibility;

  // String? Function(BuildContext, String?)? textController2Validator;


  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;

  }

  void dispose() {
    textEmailController?.dispose();
    textPasswordController?.dispose();
  }

  /// Additional helper methods are added here.

}
