import 'package:evernote/blocs/login_signup/login_ui.dart';
import 'package:evernote/helper/validators.dart';
import 'package:evernote/meta/meta_text.dart';
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
    return PlainScreen(
      child: BlocBuilder<LoginUiCubit, LoginUiState>(
        builder: (BuildContext context, LoginUiState state) => Stack(
          children: [
            WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: AbsorbPointer(
                absorbing: state is LoginUiLoading,
                child: Column(
                  children: [
                    Spacer(flex: 1),
                    Image.asset(
                      'assets/logo.svg',
                      height: 50,
                      width: 50,
                      color: Theme.of(context).accentColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 15),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(text: MetaText.evernote),
                        TextSpan(
                          text: MetaText.evernoteMoto,
                        ),
                      ])),
                    ),
                    Spacer(flex: 2),
                    Text(MetaText.loginOrSignup),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: _width * 0.05),
                      child: state is LoginUiInitial
                          ? TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  hintText: MetaText.email,
                                  border: UnderlineInputBorder()),
                            )
                          : MaterialButton(
                              onPressed: () {
                                _loginUiCubit.updateState(LoginUiInitial());
                              },
                              child: Text(_emailController.text),
                              shape: Border(
                                  bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                      width: 1)),
                            ),
                    ),
                    if (state is! LoginUiInitial)
                      Column(
                        children: [
                          TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                hintText: MetaText.password,
                                border: UnderlineInputBorder()),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 10),
                            child: RichText(
                              softWrap: true,
                              maxLines: 4,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: '${MetaText.byCreatingAccount} '),
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
                    GreenButton(
                        width: _width * 0.9,
                        text: state is LoginUiInitial
                            ? MetaText.cContinue
                            : state is Signup
                                ? MetaText.createAccount
                                : MetaText.signIn,
                        onPressed: () {
                          if (state is LoginUiInitial) {
                            if (_emailController.text.length > 0 &&
                                Validators.validateEmail(
                                    _emailController.text)) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: _width * 0.05,
                                            vertical: 10),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: _width * 0.05),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(MetaText.loginError),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 13),
                                              child: Text(MetaText
                                                  .loginErrorDescription),
                                            ),
                                            TextButton(
                                              child: Text(
                                                MetaText.ok,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                              onPressed: () {},
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            } else {
                              // TODO: check whether the email is available
                            }
                          } else if (state is Signup) {
                            //TODO: signup
                          } else {
                            //TODO: signin
                          }
                        }),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 10, left: _width * 0.05, right: _width * 0.05),
                        child: Text(MetaText.forgotPassword)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: _width * 0.05),
                      child: Row(
                        children: [
                          Divider(),
                          Text(MetaText.or),
                          Divider(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 5, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/google.svg'),
                              Text(MetaText.continueWithGoogle)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (state is LoginUiLoading)
              Positioned(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: _width * 0.1),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      CircularProgressIndicator(
                        backgroundColor: Theme.of(context).accentColor,
                      ),
                      Text(MetaText.pleaseWait)
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
