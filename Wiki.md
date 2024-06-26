# Wiki

## flutter как перейти на другой экран не убирая bottombar?

Для этого нужно в bottomBar написать так:
```dart
...
 GlobalKey<NavigatorState> navKey = GlobalKey();
...
CupertinoTabView(
              builder: (_) {
                return IndexedStack(
                  index: changeIndex.state,
                  children: pages,
                );
              },
              navigatorKey: navKey,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationBar(
                  onTap: (index) {
                    changeIndex.changeTabIndex(index);
                    navKey = GlobalKey();
                    setState(() {
                      if (changeIndex.state != index) {
                        Navigator.popUntil;
                      }
                    });
                  },
...
```

и для перехода на другой экран используем
```dart
 Navigator.of(context, rootNavigator: false).push(CupertinoPageRoute(builder: (context) => Page2()));
```

для выхода назад
```dart
Navigator.of(context, rootNavigator: false).pop(),
```

Источник: https://stackoverflow.com/questions/49628510/flutter-keep-bottomnavigationbar-when-push-to-new-screen-with-navigator
