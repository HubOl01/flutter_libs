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

## Градиент текста
как на примере <img width="170" alt="image" src="https://github.com/user-attachments/assets/2133cbb0-c17c-408f-8826-fdc7707c7194">

```dart
style: TextStyles.text54w300.copyWith(foreground: Paint()..shader = LinearGradient(
                    colors: <Color>[yellowColor, greenColor],
                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0)))),
```

Источник: https://stackoverflow.com/questions/51686868/gradient-text-in-flutter

## Градиент SvgPicture
как на примере <img width="55" alt="image" src="https://github.com/user-attachments/assets/268d8a40-f07c-45ad-824f-a77f7f28b34e">

```dart
ShaderMask(
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: index == 0
                                            ? [
                                                const Color(0xFF90D6EB),
                                                const Color(0xFF43A6C5),
                                              ]
                                            : [
                                                IconColors.unselected,
                                                IconColors.unselected
                                              ])
                                    .createShader(bounds);
                              },
                              child: SvgPicture.asset(
                                upper1[0].asset,
                                colorFilter: const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              ),
                            )
```


## Листание свайпом по экрану
```dart
 GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    _goToPrevious();
                  } else if (details.primaryVelocity! < 0) {
                    _goToNext();
                  }
                },
```

## парсер всего текста более 200 строк

Если нужно сделать автоматизацию текста более 200 повторяющихся по свойству в список моделей dart, то нужно на python писать
```py
import re

# Input data
data = """
● Think Like a Wizard’s Clock: Plan your day in blocks, visualizing tasks as time segments.
● Write in Your Spellbook: Keep a journal or planner to track tasks and ideas.
● Brew Your Morning Elixir: Start your day with a drink that energizes you, like coffee or
tea.
"""

# Extract advice and format
advices = []

for match in re.finditer(r"\u25cf\s*(.*?):\s*(.*)", data):
    title = match.group(1).strip().replace('"', "'")
    desc = match.group(2).strip().replace('"', "'")
    advices.append(f'AdviceModel(title: "{title}", desc: "{desc}"),')

# Join and display the output
output = "\n".join(advices)
print(output)
```

## Создание уведомлений

Сам сервис уведомлений есть в [core/notific.dart](core/notific.dart)

1. Добавляем разрешения в Info.plist
```
<key>UIBackgroundModes</key>
		<array>
			<string>fetch</string>
			<string>remote-notification</string>
		</array>
		<key>NSUserTrackingUsageDescription</key>
		<string>This identifier will be used to deliver personalized ads to you.</string>
		<key>NSAppTransportSecurity</key>
		<dict>
			<key>NSAllowsArbitraryLoads</key>
			<true />
		</dict>
```
2. Добавляем в main.dart если уведомление с таймером
```dart
tz.initializeTimeZones();
```
3. Запуск уведомления
```dart
await NotificationService.initialize();

await NotificationService.scheduleNotification(
title: "Internal: Mirror of thought",
body: "The time for reflection has ended.",
scheduledTime: thought.dateTimeThink,
);
```

## TimePicker/DatePicker 
<img width="300" alt="image" src="https://github.com/user-attachments/assets/d5dc9196-5982-4e59-b21a-77bf3169e6ae">

Шаблоны в файлах

- [templates/TimePickerWidget.dart](templates/TimePickerWidget.dart)
- [templates/DatePickerWidget.dart](templates/DatePickerWidget.dart)

## Текст с разными цветами или стилями
<img width="300" alt="image" src="https://github.com/user-attachments/assets/4ed05e85-fd87-41ef-850c-9c498039abd9" />

```dart
Text.rich(TextSpan(
                          text:
                              'Immerse yourself in the wonderful world of birds with '
                                  .toUpperCase(),
                          style: TextStyles.text21w800
                              .copyWith(color: TextColors.textPrimary),
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Wingsej: flights and more'.toUpperCase(),
                              style: TextStyles.text21w800
                                  .copyWith(color: TextColors.textSecond),
                            )
                          ])),
```

## Работа с БД и bloc

- Полный образец model в: [core/models/favoriteModel.dart](core/models/favoriteModel.dart)
- Полный образец database в: [core/data/database.dart](core/data/database.dart)
- Полный образец repository в: [core/repositories/FavoriteRepository.dart](core/repositories/FavoriteRepository.dart)
- Полный образец bloc в: [core/bloc](core/bloc)

Подключаем bloc так
```dart
...
BlocProvider(
      create: (context) => FavoriteBloc(FavoriteRepository()),
      child: ...
```

Если нужно сразу заполнить данные то 

```dart
Future<void> loadDatabase(FavoriteRepository favoriteRepository) async {
  final dataSQL = await favoriteRepository.getAll();

  if (dataSQL.isEmpty) {
    for (var model in listTree) {
      await favoriteRepository.insert(FavoriteModel(title: model));
    }
    print('Данные успешно добавлены в базу.');
  } else {
    print('База данных уже заполнена.');
  }
}

Future main() async {
  ...
  final favoriteRepository = FavoriteRepository();
  await populateDatabase(favoriteRepository);

  ...
}
```

Реализация
```dart
 BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                if (state is FavoriteLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is FavoriteLoaded) {
                  if (state.favorites.isEmpty) {
                    return SizedBox();
                  }
                  return ListView.builder(
                      padding: EdgeInsets.only(top: 16, bottom: 32),
                      itemCount: state.favorites.length,
                      itemBuilder: (context, index) {
                        return state.favorites[index].isFavorite == 0
                            ? const SizedBox()
                            : CardTree(
                                model: state.favorites[index],
                              );
                      });
                } else if (state is FavoriteError) {
                  return SizedBox();
                }
                return SizedBox();
              },
            ),
```
