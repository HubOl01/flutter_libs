import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_trending/core/styles/TextStyles.dart';

import '../../components/customListTile.dart';
import '../../core/storage/storage.dart';
import '../premium/PremiumPage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Settings",
          style: TextStyles.text24w500,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // const Si
          isPremium
              ? const SizedBox()
              : CustomListTile(
                  onTap: () {
                    Get.to(const PremiumPage());
                  },
                  icon: "assets/settings/premium.svg",
                  title: "Subscription management",
                ),
          const SizedBox(
            height: 10,
          ),
          CustomListTile(
            onTap: () {},
            icon: "assets/settings/privacy_policy.svg",
            title: "Privacy policy",
          ),
          const SizedBox(
            height: 10,
          ),
          CustomListTile(
            onTap: () {},
            icon: "assets/settings/terms_of_use.svg",
            title: "Terms of Use",
          ),
        ],
      ),
    );
  }
}
