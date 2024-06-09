class ButtomNavigation extends StatefulWidget {
  const ButtomNavigation({super.key});

  @override
  State<ButtomNavigation> createState() => _ButtomNavigationState();
}
class _ButtomNavigationState extends State<ButtomNavigation> {
  @override
  void initState() {
    if (isShowOnboarding) {
      Future(() async => await showDialog(
          barrierDismissible: false,
          context: context,
          useSafeArea: false,
          builder: (context) => const OnboardingDialog()));
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtomNavigationBarCubit(),
      child: BlocBuilder<ButtomNavigationBarCubit, int>(
          builder: (context, currentIndex) {
        final changeIndex = BlocProvider.of<ButtomNavigationBarCubit>(context);

        return Scaffold(
            body:IndexedStack(
                  index: changeIndex.state,
                  children: pages,
                ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                changeIndex.changeTabIndex(index);
              },
              backgroundColor: bgColor,
              currentIndex: currentIndex,
              selectedItemColor: BarColors.selected,
              unselectedItemColor: BarColors.unselected,
              showSelectedLabels: true,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              showUnselectedLabels: true,
              enableFeedback: true,
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/bar/main.svg",
                      colorFilter: ColorFilter.mode(
                          currentIndex == 0
                              ? BarColors.selected
                              : BarColors.unselected,
                          BlendMode.srcIn),
                    ),
                    label: "Main",
                    tooltip: "Main"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/bar/One.svg",
                      colorFilter: ColorFilter.mode(
                          currentIndex == 1
                              ? BarColors.selected
                              : BarColors.unselected,
                          BlendMode.srcIn),
                    ),
                    label: "One",
                    tooltip: "One"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/bar/Two.svg",
                      colorFilter: ColorFilter.mode(
                          currentIndex == 2
                              ? BarColors.selected
                              : BarColors.unselected,
                          BlendMode.srcIn),
                    ),
                    label: "Two",
                    tooltip: "Two"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/bar/settings.svg",
                      colorFilter: ColorFilter.mode(
                          currentIndex == 3
                              ? BarColors.selected
                              : BarColors.unselected,
                          BlendMode.srcIn),
                    ),
                    label: "Settings",
                    tooltip: "Settings"),
              ],
            ));
      }),
    );
  }
}

List<Widget> pages = [
  const MainPage(),
  const OnePage(),
  const TwoPage(),
  const SettingsPage()
];
