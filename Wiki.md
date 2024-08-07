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

## Перемещение объекта в разные стороны + масштабирование
```dart
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

## Перемещение объекта во все стороны + масштабирование
Без масштабирования
```dart
Positioned(
                          left: xTree,
                          bottom: context.width - yTree,
                          child: 
...
GestureDetector(
                                            onPanUpdate: (details) {
                                                setState(() {
                                                  xTree = xTree +
                                                      details.delta.dx
                                                          .toDouble();
                                                  yTree = yTree +
                                                      details.delta.dy
                                                          .toDouble();
                                                });
                                                print(
                                                    "y: ${details.delta.dy.toDouble()}");
                                              },
...
```

С масштабированием
```dart
Positioned(
                          left: xTree,
                          bottom: context.width - yTree,
                          child: 
...
GestureDetector(
                                              onScaleUpdate: (details) {
                                                setState(() {
                                                  scale = details.scale;
                                                  xTree += details
                                                      .focalPointDelta.dx;
                                                  yTree += details
                                                      .focalPointDelta.dy;
                                                });
                                                print(
                                                    "Scale: $scale, x: $xTree, y: $yTree");
                                              },
...
```

## Тень svg-изображения
```dart
Stack(
      children: [
        Positioned(
          top: 4,
          child: SvgPicture.asset(
            assetPath,
            width: width,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.srcIn),
          ),
        ),
        Positioned(
          top: 4,
          child: ClipPath(
            clipper: _InnerShadowClipper(),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: SvgPicture.asset(
                assetPath,
                width: width,
                colorFilter:
                    const ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
              ),
            ),
          ),
        ),
        SvgPicture.asset(
          assetPath,
          width: width,
        ),
      ],
    )
```

## Блюр на примере с алертом
```dart
Stack(
      fit: StackFit.expand,
      children: [
        BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: GestureDetector(
          onTap: ()=> Get.back(),
          child: Container(
              color: Colors.black.withOpacity(.2),
            ),
          ),
        ),
        Dialog(
          backgroundColor: Colors.transparent,
            // shape:
                // RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            insetPadding: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: child),
      ],
    )
```
