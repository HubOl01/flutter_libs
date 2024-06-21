# Plagins

Добавление плагина выполняется так
```sh
flutter pub add <plugin>
```

И после него добавляем плагины

## Плагины
Полная библиотека плагинов по этой ссылке https://pub.dev/

### [cupertino_icons](https://pub.dev/packages/cupertino_icons)

```sh
flutter pub add cupertino_icons
```

### [get](https://pub.dev/packages/get)
```sh
flutter pub add get
```

### [flutter_bloc](https://pub.dev/packages/flutter_bloc)

```sh
flutter pub add flutter_bloc
```

### [intl](https://pub.dev/packages/intl)
```sh
flutter pub add intl
```
Плагин для форматирования даты и времени
```dart
DateFormat("dd.MM.yyyy").format(date)
```

### [flutter_svg](https://pub.dev/packages/flutter_svg)
```sh
flutter pub add flutter_svg
```

### [sqflite](https://pub.dev/packages/sqflite)
```sh
flutter pub add sqflite
```

### [image_picker](https://pub.dev/packages/image_picker)
```sh
flutter pub add image_picker
```
в IOS нужно добавить `Info.plist`
```Info.plist
    <key>NSPhotoLibraryAddUsageDescription</key>
		<string>Please allow access to the gallery to save the images.</string>

		<key>NSPhotoLibraryUsageDescription</key>
		<string>Please allow access to the gallery to select images.</string>
```

### [table_calendar](https://pub.dev/packages/table_calendar)
```sh
flutter pub add table_calendar
```

### [hive](https://pub.dev/packages/hive)
```sh
flutter pub add hive
```

в `main.dart` инициализация и чтение данных
```dart
var app = await path_provider.getApplicationDocumentsDirectory();
  Hive..init(app.path);
  var box = await Hive.openBox(storage_name);
  isShowOnboarding = box.get('isShowOnboarding') ?? true;
```
Хранение и изменение я обычно пишу в отдельном файле `storage.dart`

Пример кода:
```dart
import 'package:hive/hive.dart';
const String storage_name = "storage_name";

Future showOnboarding(bool isShowOnboarding) async{
  var box = await Hive.openBox(storage_name);
  box.put("isShowOnboarding", isShowOnboarding);
  await box.compact();
  await box.close();
}
```



### [path_provider](https://pub.dev/packages/path_provider)
```sh
flutter pub add path_provider
```
Импортируется так 
```dart
import 'package:path_provider/path_provider.dart' as path_provider;
```

### [image_gallery_saver](https://pub.dev/packages/image_gallery_saver)
```sh
flutter pub add image_gallery_saver
```
Плагин для хранения изображений в галерею

### [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
```sh
flutter pub add flutter_launcher_icons
```

Далее в `pubspec.yaml` добавим
```yaml
flutter_launcher_icons:
  android: true
  ios: true
  image_path: assets/others/app_icon.png
```

Чтобы подтвердить изменения пишем в терминале
```sh
flutter pub run flutter_launcher_icons:main
```

### [google_fonts](https://pub.dev/packages/google_fonts)
```sh
flutter pub add google_fonts
```
Плагин для установки шрифта, можно проверить нужный шрифт по этой ссылке https://fonts.google.com/, а если нет придется вручную искать и устанавливать нужный шрифт так:

В `pubspec.yaml`
```yaml
  fonts:
    - family: "ClashDisplay"
      fonts:
        - asset: assets/fonts/ClashDisplay-Medium.otf
```
или так
```yaml
  fonts:
    - family: Schyler
      fonts:
        - asset: fonts/Schyler-Regular.ttf
        - asset: fonts/Schyler-Italic.ttf
          style: italic
    - family: Trajan Pro
      fonts:
        - asset: fonts/TrajanPro.ttf
        - asset: fonts/TrajanPro_Bold.ttf
          weight: 700
```

и в dart
```dart
TextStyle text32w500 = TextStyle(
    color: TextColors.textPrimary,
    fontFamily: "ClashDisplay",
    fontWeight: FontWeight.w500,
    fontSize: 32,
  );
```

### [flutter_keyboard_visibility](https://pub.dev/packages/flutter_keyboard_visibility)
```sh
flutter pub add flutter_keyboard_visibility
```
Плагин позволяет убирать клавиатуру в любом нажатом месте

Устанавливается виджет `KeyboardDismissOnTap` так в `main.dart`:

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: GetMaterialApp(
        title: 'Betting Friends',
        debugShowCheckedModeBanner: false,
        ...
      )
    )
  }
}
```


### [stop_watch_timer](https://pub.dev/packages/stop_watch_timer)
```sh
flutter pub add stop_watch_timer
```
Таймер и секундомер

### [flutter_markdown](https://pub.dev/packages/flutter_markdown)
```sh
flutter pub add flutter_markdown
```
Пример
```dart
 Markdown(
            physics: const NeverScrollableScrollPhysics(),
            padding:
                const EdgeInsets.only(top: 5, bottom: 10, left: 15, right: 15),
            shrinkWrap: true,
            data: '''# Name
            - One
            - Two
            ''',
            styleSheet: MarkdownStyleSheet(
                blockquotePadding:
                    const EdgeInsets.only(left: 16, top: 4, bottom: 4),
                listIndent: 20,
                a: TextStyles.text16w400Second,
                p: TextStyles.text16w400Second,
                strong: TextStyles.text16w400,
                em: TextStyles.text16w400,
                del: TextStyles.text16w400,
                listBullet: TextStyles.text16w400Orange),
          ),
```

### [audioplayers](https://pub.dev/packages/audioplayers)
```sh
flutter pub add audioplayers
```
Пример плеера [audioplayer](templates/audioplayer.dart)


### [cached_network_image](https://pub.dev/packages/cached_network_image)
```sh
flutter pub add cached_network_image
```
Временное хранение картинок с интернета в кэш
