import 'package:evernote/blocs/data_connection.dart';
import 'package:evernote/blocs/login_signup/login_ui.dart';
import 'package:evernote/helper/validators.dart';
import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/routes/routes.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginSignup extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginUiCubit _loginUiCubit = context.watch<LoginUiCubit>();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    bool _isOnline = context.watch<ConnectionHelperCubit>().state;
    return PlainScreen(
      color: Colors.white,
      child: BlocConsumer<LoginUiCubit, LoginUiState>(
        listener: (oldstate, newstate) {
          if (newstate is LoginSignupSuccess) {
            if (newstate.showTryForFree) {
              Navigator.pushReplacementNamed(context, Routes.tryEvernote);
            } else {
              Navigator.pushReplacementNamed(context, Routes.allNotes);
            }
          } else if (newstate is LoginSignupError) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(newstate.error),
            ));
          } else if (newstate is UpgradePremium) {
            showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel:
                    MaterialLocalizations.of(context).modalBarrierDismissLabel,
                barrierColor: Colors.black45,
                transitionDuration: const Duration(milliseconds: 200),
                pageBuilder: (BuildContext buildContext, Animation animation,
                    Animation secondaryAnimation) {
                  return UpgradePremiumScreen(width: _width);
                });
          }
        },
        builder: (BuildContext context, LoginUiState state) => Stack(
          children: [
            WillPopScope(
              onWillPop: () async {
                if (state is Signup || state is Signin) {
                  _loginUiCubit.handleBackPress(LoginUiInitial());
                  return false;
                } else {
                  return true;
                }
              },
              child: IgnorePointer(
                ignoring: state is LoginUiLoading,
                // absorbing: false,
                child: ListView(
                  padding: EdgeInsets.only(
                      left: _width * 0.05,
                      right: _width * 0.05,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  children: [
                    Container(
                      height: _height,
                      child: Column(
                        children: [
                          Spacer(flex: 1),
                          SvgPicture.asset(
                            'assets/logo.svg',
                            height: 60,
                            width: 60,
                            color:
                                Theme.of(context).accentColor.withOpacity(0.9),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 15),
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: '${MetaText.evernote}\n\n',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 40,
                                          fontFamily: 'Prata',
                                          fontWeight: FontWeight.w900)),
                                  TextSpan(
                                      text: MetaText.evernoteMoto,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      )),
                                ])),
                          ),
                          Spacer(flex: 2),
                          Text(
                            MetaText.loginOrSignup,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: state is LoginUiInitial
                                ? customTextField(
                                    controller: _emailController,
                                    hintText: MetaText.email)
                                : MaterialButton(
                                    onPressed: () {
                                      _loginUiCubit
                                          .updateState(LoginUiInitial());
                                    },
                                    minWidth: _width * 0.9,
                                    child: Text(
                                      _emailController.text,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.start,
                                    ),
                                    shape: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey, width: 1)),
                                  ),
                          ),
                          if (state is! LoginUiInitial)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Column(
                                children: [
                                  customTextField(
                                    controller: _passwordController,
                                    hintText: MetaText.password,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 5, bottom: 10),
                                    child: RichText(
                                      softWrap: true,
                                      maxLines: 4,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                '${MetaText.byCreatingAccount} '),
                                        TextSpan(
                                            text: MetaText.termsOfService,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                launch(
                                                  'https://evernote.com/legal/terms-of-service/',
                                                  enableJavaScript: true,
                                                  forceWebView: true,
                                                );
                                              }),
                                        TextSpan(text: ' and '),
                                        TextSpan(
                                            text: MetaText.privacyPolicy,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                launch(
                                                  'https://evernote.com/privacy/',
                                                  enableJavaScript: true,
                                                  forceWebView: true,
                                                );
                                              }),
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          GreenButton(
                              width: _width * 0.9,
                              text: getButtonText(state),
                              onPressed: () {
                                if (state is LoginUiInitial) {
                                  if (_emailController.text.length > 0 &&
                                      Validators.validateEmail(
                                          _emailController.text)) {
                                    //TODO:
                                    _loginUiCubit.isEmailAvailable(
                                        _emailController.text);
                                  } else if (!_isOnline) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            loginErrorDialog(_width, context,
                                                MetaText.errorNoInternet));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            loginErrorDialog(_width, context,
                                                MetaText.loginErrorEmail));
                                  }
                                } else if (state is Signup) {
                                  _loginUiCubit.signUpWithEmailPassword(
                                      _emailController.text,
                                      _passwordController.text);
                                } else {
                                  _loginUiCubit.signInWithEmailPassword(
                                      _emailController.text,
                                      _passwordController.text);
                                }
                              }),
                          Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                              ),
                              child: Text(MetaText.forgotPassword)),
                          Text(MetaText.or),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: MaterialButton(
                              elevation: 5,
                              color: Colors.white,
                              minWidth: 0,
                              onPressed: () {
                                if (_isOnline) {
                                  _loginUiCubit.signinWithGoogle();
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          loginErrorDialog(_width, context,
                                              MetaText.errorNoInternet));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 5, top: 12, bottom: 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/google.svg',
                                      height: Theme.of(context)
                                              .primaryIconTheme
                                              .size *
                                          0.8,
                                      width: Theme.of(context)
                                              .primaryIconTheme
                                              .size *
                                          0.8,
                                    ),
                                    Text(
                                      '  ${MetaText.continueWithGoogle}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // if (state is LoginUiLoading)
            //   Positioned(
            //     child: Container(
            //       margin: EdgeInsets.symmetric(horizontal: _width * 0.1),
            //       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //       child: Row(
            //         children: [
            //           CircularProgressIndicator(
            //             backgroundColor: Theme.of(context).accentColor,
            //           ),
            //           Text(MetaText.pleaseWait)
            //         ],
            //       ),
            //     ),
            //   )
          ],
        ),
      ),
    );
  }

  TextField customTextField(
      {@required TextEditingController controller, @required String hintText}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
          )),
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  String getButtonText(LoginUiState state) {
    if (state is LoginUiInitial) {
      return MetaText.cContinue;
    } else if (state is Signup) {
      return MetaText.createAccount;
    } else if (state is Signin) {
      return MetaText.signIn;
    } else {
      return MetaText.pleaseWait;
    }
  }

  Dialog loginErrorDialog(double _width, BuildContext context, String error) =>
      Dialog(
        child: Container(
          color: Colors.white,
          padding:
              EdgeInsets.symmetric(horizontal: _width * 0.05, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                MetaText.loginError,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 8),
                child: Text(
                  error,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.5,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  child: Text(
                    MetaText.ok,
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      );
}

class UpgradePremiumScreen extends StatelessWidget {
  final double width;

  const UpgradePremiumScreen({Key key, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Spacer(
            flex: 1,
          ),
          Text(
            MetaText.pleaseUpgrade,
            style: Theme.of(context).primaryTextTheme.headline2,
            maxLines: 4,
            softWrap: true,
          ),
          Spacer(
            flex: 1,
          ),
          GreenButton(
              width: width * 0.9,
              text: MetaText.upgradeAccount,
              onPressed: () {})
        ],
      ),
    );
  }
}
