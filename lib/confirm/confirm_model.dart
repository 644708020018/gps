import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textControllerDriverID;
  TextEditingController? textEmailController;
  String? Function(BuildContext, String?)? textControllerValidator;



  late bool VisibilityControllerDriverID;

  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textControllerPassword;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textControllerConfirmPassword;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility1 = false;
    VisibilityControllerDriverID = false;
    passwordVisibility2 = false;
  }

  void dispose() {
    textControllerDriverID?.dispose();
    textControllerPassword?.dispose();
    textControllerConfirmPassword?.dispose();
  }

  /// Additional helper methods are added here.

}
