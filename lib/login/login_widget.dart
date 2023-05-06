import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user/home/home_widget.dart';

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
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  late LoginModel _model;
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.textEmailController ??= TextEditingController();
    _model.textPasswordController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Error'),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme
                  .of(context)
                  .primaryBackground,
              body: SingleChildScrollView(
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 50, 0.0, 10.0),
                        child: Text(
                          'Motorcycle GPS Tracker',
                          style: FlutterFlowTheme
                              .of(context)
                              .bodyMedium
                              .override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF2B84DC),
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              width: 390.0,
                              height: 350.0,
                              decoration: BoxDecoration(
                                color:
                                FlutterFlowTheme
                                    .of(context)
                                    .secondaryBackground,
                              ),
                              child: Image.asset(
                                'assets/images/2-1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: Container(
                                      width: 320.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional
                                            .fromSTEB(
                                            0.0, 30.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .textEmailController,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Email ...',
                                            hintStyle: FlutterFlowTheme
                                                .of(context)
                                                .bodySmall,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius
                                                  .only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(
                                                    4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius
                                                  .only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(
                                                    4.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius
                                                  .only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(
                                                    4.0),
                                              ),
                                            ),
                                            focusedErrorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius
                                                  .only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(
                                                    4.0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: FlutterFlowTheme
                                                .of(context)
                                                .lineColor,
                                            suffixIcon: Icon(
                                              Icons.email_rounded,
                                              color: Color(0xFF757575),
                                              size: 22.0,
                                            ),
                                          ),
                                          style: FlutterFlowTheme
                                              .of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.normal,
                                          ),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ).animateOnPageLoad(animationsMap[
                                        'textFieldOnPageLoadAnimation']!),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: Container(
                                      width: 320.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional
                                            .fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .textPasswordController,
                                          autofocus: false,
                                          obscureText: !_model
                                              .passwordVisibility,
                                          decoration: InputDecoration(
                                            hintText: 'Password',
                                            hintStyle: FlutterFlowTheme
                                                .of(context)
                                                .bodySmall,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius
                                                  .only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(
                                                    4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius
                                                  .only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(
                                                    4.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius
                                                  .only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(
                                                    4.0),
                                              ),
                                            ),
                                            focusedErrorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius
                                                  .only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(
                                                    4.0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: FlutterFlowTheme
                                                .of(context)
                                                .lineColor,
                                            suffixIcon: InkWell(
                                              onTap: () =>
                                                  setState(
                                                        () =>
                                                    _model
                                                        .passwordVisibility =
                                                    !_model
                                                        .passwordVisibility,
                                                  ),
                                              focusNode:
                                              FocusNode(skipTraversal: true),
                                              child: Icon(
                                                _model.passwordVisibility
                                                    ? Icons
                                                    .visibility_outlined
                                                    : Icons
                                                    .visibility_off_outlined,
                                                color: Color(0xFF757575),
                                                size: 22.0,
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme
                                              .of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.normal,
                                          ),
                                          textAlign: TextAlign.start,
                                          keyboardType: TextInputType
                                              .visiblePassword,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: 320.0,
                                      decoration: BoxDecoration(),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        try {
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                              email: _model
                                                  .textEmailController
                                                  .text
                                                  .trim(),
                                              password: _model
                                                  .textPasswordController
                                                  .text.trim());

                                          _model.textEmailController
                                              ?.clear();
                                          _model.textPasswordController
                                              ?.clear();

                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .leftToRight,
                                              duration: Duration(
                                                  milliseconds: 300),
                                              reverseDuration:
                                              Duration(milliseconds: 300),
                                              child: HomeWidget(),
                                            ),
                                          );
                                        } on FirebaseAuthException catch (e) {
                                          print(e.message);
                                        }
                                        // await Navigator.push(
                                        //   context,
                                        //   PageTransition(
                                        //     type: PageTransitionType.leftToRight,
                                        //     duration: Duration(milliseconds: 300),
                                        //     reverseDuration:
                                        //     Duration(milliseconds: 300),
                                        //     child: HomeWidget(),
                                        //   ),
                                        // );
                                      },
                                      text: 'Login',
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional
                                            .fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding: EdgeInsetsDirectional
                                            .fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme
                                            .of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme
                                            .of(context)
                                            .titleSmall
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            8.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ConfirmWidget(),
                                          ),
                                        );
                                      },
                                      text: 'Register',
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional
                                            .fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding: EdgeInsetsDirectional
                                            .fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme
                                            .of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme
                                            .of(context)
                                            .titleSmall
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
