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


## Текст с границами 
как на примере <img width="160" alt="image" src="https://github.com/user-attachments/assets/e9ea061c-1adf-4333-92ee-d8213f9166b1">

```dart
Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            "Adds free!".toUpperCase(),
                            style: TextStyle(
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2
                                ..color = Colors.black.withOpacity(.5),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Adds free!".toUpperCase(),
                            style: TextStyles.text20w400SB,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
```
