import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:space_game/const/const.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorialController extends GetxController {
  late TutorialCoachMark tutorialCoachMark;
  final targets = <TargetFocus>[];

  @override
  void onInit() {
    createTutorial();
    super.onInit();
  }

  void showTutorial(BuildContext context) {
    tutorialCoachMark.show(context: context);
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      hideSkip: true,
      targets: _createTargets(),
    );
  }

  List<TargetFocus> _createTargets() {
    if (targets.isNotEmpty) return targets;

    targets.add(
      TargetFocus(
        shape: ShapeLightFocus.Circle,
        color: niceBlackColor,
        enableOverlayTab: true,
        identify: "market",
        keyTarget: GlobalKey(),
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return IgnorePointer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Lottie.asset("assets/lotties/loginPage.json"),
                    const Text(
                      "Welcome to Cosmic Clicker. In this unique adventure, we will travel from planets to stars, from stars to galaxies. If you're ready, let's begin.",
                      style: TextStyle(
                        color: moneyCircleColor,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "The part shown above is where you will buy the items.",
                      style: TextStyle(
                        color: moneyCircleColor,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    return targets;
  }
}
