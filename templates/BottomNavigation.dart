class ButtomNavigation extends StatefulWidget {
  const ButtomNavigation({super.key});

  @override
  State<ButtomNavigation> createState() => _ButtomNavigationState();
}

class _ButtomNavigationState extends State<ButtomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtomNavigationBarCubit, int>(
        builder: (context, currentIndex) {
      final changeIndex = BlocProvider.of<ButtomNavigationBarCubit>(context);

      return Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: changeIndex.state,
              children: pages,
            ),
            MediaQuery.of(context).viewInsets.bottom == 0
                ? Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: BarColors.bgColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconBar(
                                icon: "assets/icons/appbar1.svg",
                                index: 0,
                                onTap: () {
                                  changeIndex.changeTabIndex(0);
                                },
                                currentIndex: currentIndex,
                              ),
                              IconBar(
                                icon: "assets/icons/appbar2.svg",
                                index: 1,
                                onTap: () {
                                  changeIndex.changeTabIndex(1);
                                },
                                currentIndex: currentIndex,
                              ),
                              IconBar(
                                icon: "assets/icons/appbar3.svg",
                                index: 2,
                                onTap: () {
                                  changeIndex.changeTabIndex(2);
                                },
                                currentIndex: currentIndex,
                              )
                            ],
                          ),
                        )),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      );
    });
  }
}

List<Widget> pages = [
  const MainPage(),
  const OnePage(),
  const TwoPage()
];
