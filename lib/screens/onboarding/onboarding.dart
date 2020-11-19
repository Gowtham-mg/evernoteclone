import 'package:evernote/blocs/onboarding_cubit.dart';
import 'package:evernote/hive_helper.dart';
import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/routes/routes.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OnboardingCubit onboardingCubit = context.watch<OnboardingCubit>();
    double _width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: ()async{
        if(onboardingCubit.state < 5){

        }
        return ;
      },
      child: PlainScreen(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CloseButton(
                  color: Colors.grey,
                  onPressed: () {
                    showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (BuildContext context) {
                          return QuitTourDialog();
                        });
                  },
                ),
              ),
              if (onboardingCubit.state == 2 || onboardingCubit.state == 4)
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          onboardingCubit.state == 2
                              ? MetaText.wowTryScaningDocs
                              : MetaText.greatSyncNow,
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
              Spacer(
                flex: 2,
              ),
              if (onboardingCubit.state == 1)
                SvgPicture.asset(
                  'assets/notepad-check.svg',
                  height: 100,
                  width: 100,
                ),
              if (onboardingCubit.state != 1)
                Icon(
                  Icons.mobile_screen_share,
                  size: 100,
                  color: Colors.black,
                ),
              Spacer(
                flex: 1,
              ),
              Text(
                onboardingCubit.state == 1
                    ? MetaText.onboarding1Description
                    : onboardingCubit.state == 2
                        ? MetaText.onboarding2Description
                        : MetaText.onboarding3Description,
                style: Theme.of(context).textTheme.caption,
              ),
              Spacer(
                flex: 2,
              ),
              if (onboardingCubit.state == 1)
                GreenButton(
                    width: _width * 0.9,
                    text: MetaText.createANote,
                    onPressed: () {
                      onboardingCubit.updateIndex(onboardingCubit.state + 1);
                      updateOnboarding(onboardingCubit.state);
                    }),
              if (onboardingCubit.state == 2)
                GreenButton(
                    width: _width * 0.9,
                    text: MetaText.tryTheCamera,
                    onPressed: () {
                      onboardingCubit.updateIndex(onboardingCubit.state + 1);
                      updateOnboarding(onboardingCubit.state);
                    }),
              if (onboardingCubit.state == 3)
                GreenButton(
                    width: _width * 0.9,
                    text: MetaText.showMeHow,
                    onPressed: () {
                      launch(
                        'https://evernote.com/webclipper/android',
                        enableJavaScript: true,
                        forceWebView: true,
                      );
                      onboardingCubit.updateIndex(onboardingCubit.state + 1);
                      updateOnboarding(onboardingCubit.state);
                    }),
              if (onboardingCubit.state == 4)
                GreenButton(
                    width: _width * 0.9,
                    text: MetaText.emailMeALink,
                    onPressed: () {
                      onboardingCubit.updateIndex(onboardingCubit.state + 1);
                      showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context)
                              .modalBarrierDismissLabel,
                          barrierColor: Colors.black45,
                          transitionDuration: const Duration(milliseconds: 200),
                          pageBuilder: (BuildContext buildContext,
                              Animation animation, Animation secondaryAnimation) {
                            return TourCompleted(width: _width);
                          });
                    }),
              if (onboardingCubit.state == 4)
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: TextButton(
                    child: Text(
                      MetaText.noThanks,
                      style: Theme.of(context).primaryTextTheme.caption,
                    ),
                    onPressed: () {
                      onboardingCubit.updateIndex(onboardingCubit.state+1);
                      updateOnboarding(onboardingCubit.state);
                      Navigator.pushNamed(context, Routes.allNotes);
                    },
                  ),
                ),
              Spacer(
                flex: 2,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  '${onboardingCubit.state} of 4',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  updateOnboarding(int val){
    HiveHelper.putValue(HiveHelper.auth, HiveHelper.onboarding, val);
  }
}

class TourCompleted extends StatelessWidget {
  const TourCompleted({
    Key key,
    @required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      padding: EdgeInsets.symmetric(horizontal: _width * 0.05, vertical: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CloseButton(
              color: Colors.grey,
              onPressed: () {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return QuitTourDialog();
                    });
              },
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Icon(
            Icons.check,
            color: Colors.green,
            size: 60,
          ),
          Spacer(
            flex: 1,
          ),
          Text(MetaText.niceWork, style: Theme.of(context).textTheme.subtitle2),
          Text(MetaText.nowYouHaveGotBasics,
              style: Theme.of(context).textTheme.subtitle2),
          Spacer(
            flex: 2,
          ),
          GreenButton(
              width: _width * 0.9,
              text: MetaText.gotomyNotes,
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.allNotes);
              }),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

class QuitTourDialog extends StatelessWidget {
  const QuitTourDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        MetaText.takeTheTourLater,
        style: Theme.of(context).textTheme.caption.copyWith(fontSize: 23),
      ),
      content: Text(MetaText.takeTheTourLaterDescription,
          style: Theme.of(context).textTheme.subtitle2),
      actions: [
        TextButton(
          child: Text(
            MetaText.takeTourLater,
            style: Theme.of(context).primaryTextTheme.caption,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text(
            MetaText.quitTour,
            style: Theme.of(context).primaryTextTheme.caption,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, Routes.allNotes);
          },
        ),
      ],
    );
  }
}
