import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gps_project/login/login_widget.dart';

class RegisterPage extends StatefulWidget {
  // String email;

  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController textControllerDriverID = TextEditingController();
  final TextEditingController textEmailController = TextEditingController();
  final TextEditingController textControllerPassword = TextEditingController();
  final TextEditingController textControllerConfirmPassword =
      TextEditingController();

  // late bool VisibilityControllerDriverID = false;
  late bool passwordVisibility1 = false;
  late bool passwordVisibility2 = false;

  String? Function(BuildContext, String?)? textControllerValidator;
  String? Function(BuildContext, String?)? textController1Validator;
  String? Function(BuildContext, String?)? textController2Validator;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
              title: const Text('Error'),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: const Text(
                  'Motorcycle GPS Tracker',
                ),
              ),
              body: SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                2.0, 20.0, 2.0, 0.0),
                            child: Container(
                              padding: EdgeInsets.zero,
                              width: 380.0,
                              height: 350.0,
                              child: Image.asset(
                                'assets/images/2-1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      width: 320.0,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 10.0, 0.0, 0.0),
                                        child: TextFormField(
                                          validator: EmailValidator(
                                              errorText:
                                                  "Email format is invalid."),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: textEmailController,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            hintText: 'Email',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            filled: true,
                                            suffixIcon: Icon(
                                              Icons.email_rounded,
                                              color: Color(0xFF757575),
                                              size: 22.0,
                                            ),
                                          ),
                                          // validator: _model
                                          //     .textControllerValidator
                                          //     .(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 10.0, 24.0, 0.0),
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      width: 320.0,
                                      child: TextFormField(
                                        controller: textControllerDriverID,
                                        decoration: const InputDecoration(
                                          hintText: 'DriverID',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          suffixIcon: Icon(
                                            Icons.motorcycle_outlined,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 10.0, 24.0, 0.0),
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      width: 320.0,
                                      child: TextFormField(
                                        controller: textControllerPassword,
                                        validator: RequiredValidator(
                                            errorText: "Password is empty"),
                                        autofocus: false,
                                        obscureText: !passwordVisibility1,
                                        decoration: InputDecoration(
                                          hintText: 'Password',
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => passwordVisibility1 =
                                                  !passwordVisibility1,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              passwordVisibility1
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: const Color(0xFF757575),
                                              size: 22.0,
                                            ),
                                          ),
                                        ),
                                        textAlign: TextAlign.start,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        // validator: _model
                                        //     .textController2Validator
                                        //     .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      width: 320.0,
                                      child: TextFormField(
                                        validator: RequiredValidator(
                                            errorText:
                                                "Confirm Password is empty"),
                                        controller:
                                            textControllerConfirmPassword,
                                        autofocus: false,
                                        obscureText: !passwordVisibility2,
                                        decoration: InputDecoration(
                                          hintText: 'Confirm Password',
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => passwordVisibility2 =
                                                  !passwordVisibility2,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              passwordVisibility2
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: const Color(0xFF757575),
                                              size: 22.0,
                                            ),
                                          ),
                                        ),
                                        textAlign: TextAlign.start,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        // validator: _model
                                        //     .textController3Validator
                                        //     .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 40.0, 0.0, 0.0),
                                    child: SizedBox(
                                      height: 45,
                                      width: 300,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.blue),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: const BorderSide(
                                                width: 1,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          "Submit",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        onPressed: () async {
                                          String username =
                                              textEmailController.text.trim();
                                          // String driverId = _model
                                          //     .textControllerDriverID.text
                                          //     .trim();
                                          String password =
                                              textControllerPassword.text
                                                  .trim();
                                          String confirmPassword =
                                              textControllerConfirmPassword.text
                                                  .trim();

                                          if (textEmailController
                                              .text.isEmpty) {
                                            Fluttertoast.showToast(
                                              msg: "Email format is invalid.",
                                              gravity: ToastGravity.TOP,
                                              //backgroundColor: Colors.red,
                                            );
                                          } else if (password ==
                                              confirmPassword) {
                                            try {
                                              await FirebaseAuth.instance
                                                  .createUserWithEmailAndPassword(
                                                      email: username,
                                                      password: password);

                                              textControllerPassword?.clear();
                                              textControllerConfirmPassword
                                                  ?.clear();

                                              // ignore: use_build_context_synchronously
                                              Fluttertoast.showToast(
                                                msg: "Successful registration",
                                                gravity: ToastGravity.TOP,
                                                //backgroundColor: Colors.red,
                                              );
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginWidget(),
                                                ),
                                              );
                                            } on FirebaseAuthException catch (e) {
                                              Fluttertoast.showToast(
                                                msg: e.message.toString(),
                                                gravity: ToastGravity.TOP,
                                                //backgroundColor: Colors.red,
                                              );
                                            }
                                          } else {
                                            Fluttertoast.showToast(
                                              msg: "Passwords do not match.",
                                              gravity: ToastGravity.TOP,
                                              //backgroundColor: Colors.red,
                                            );
                                          }
                                        },
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
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
