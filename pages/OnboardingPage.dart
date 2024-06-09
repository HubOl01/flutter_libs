import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/customButton.dart';
import '../../core/storage/storage.dart';
import '../../core/styles/TextStyles.dart';
import '../mainPage/mainPage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // physics: const BouncingScrollPhysics(),
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Image.asset("assets/onboarding.png"),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Welcome",
                style: TextStyles.text32w600,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "It is your pocket guide in the world of origami! With our app you can easily and cheerfully create beautiful origami from paper, following simple and clear instructions. ",
                style: TextStyles.text16w500,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomButton(
                  height: 50,
                  onPressed: () {
                    setState(() {
                      isShowOnboarding = false;
                    });
                    showOnboarding(false);
                    Get.to(const MainPage());
                  },
                  title: "Get started",
                )),
            SizedBox(
              height: 50,
              width: context.width,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch  ,
                children: [
                  Expanded(
                      child: TextButton(
                    child: Text(
                      "Terms of Use",
                      style: context.isTablet
                          ? TextStyles.text24w400Second
                          : TextStyles.text14w400Premium,
                    ),
                    onPressed: () {},
                  )),
                  // Expanded(
                  //     child: TextButton(
                  //         child: Text(
                  //           "Restore",
                  //           style: context.isTablet
                  //               ? TextStyles.text24w400Second
                  //               : TextStyles.text14w400Premium,
                  //         ),
                  //         onPressed: () {})),
                  Expanded(
                      child: TextButton(
                          child: Text(
                            "Privacy Policy",
                            style: context.isTablet
                                ? TextStyles.text24w400Second
                                : TextStyles.text14w400Premium,
                          ),
                          onPressed: () {})),
                ],
              ),
            ),
            // const SizedBox(height: 45,)
          ],
        ),
      ),
    );
  }
}
