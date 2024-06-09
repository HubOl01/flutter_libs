import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/customButton.dart';
import '../../core/storage/storage.dart';
import '../../core/styles/Colors.dart';
import '../../core/styles/TextStyles.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                // color: Colors.red,
                width: context.width,
                height: context.height - 280,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          context.isTablet
                              ? "assets/premium_table/cards.png"
                              : "assets/premium-mobile/cards.png",
                          height: context.height,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          context.isTablet
                              ? "assets/premium_table/Rectangle.png"
                              : "assets/premium-mobile/Rectangle.png",
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              // alignment: Alignment.topRight,
                              decoration: BoxDecoration(
                                  color: cardColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SvgPicture.asset(
                                      "assets/icons/close.svg")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // const Spacer(),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Dear friend!",
                    style: context.isTablet
                        ? TextStyles.text32w500
                        : TextStyles.text24w500,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Lots origami to go, get access for \$0,49",
                    style: TextStyles.text18w500Second,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CustomButton(
                      onPressed: () {
                        setState(() {
                          isPremium = true;
                        });
                        showPremium(true);
                        if (isPremium) {
                          Get.back();
                        }
                      },
                      title: "Get for \$0.49",
                    )),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
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
                                ? TextStyles.text24w400Premium
                                : TextStyles.text14w400Premium,
                          ),
                          onPressed: () {},
                        )),
                        Expanded(
                            child: TextButton(
                                child: Text(
                                  "Restore",
                                  style: context.isTablet
                                      ? TextStyles.text24w400Premium
                                      : TextStyles.text14w400Premium,
                                ),
                                onPressed: () {})),
                        Expanded(
                            child: TextButton(
                                child: Text(
                                  "Privacy Policy",
                                  style: context.isTablet
                                      ? TextStyles.text24w400Premium
                                      : TextStyles.text14w400Premium,
                                ),
                                onPressed: () {})),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
