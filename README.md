# flutter_libs
Library for storing components, templates, plugins and etc

## Начало

```sh
flutter create <name_project>
```
или

Создание проекта только на android, ios
```sh
flutter create --platform android,ios <name_project>
```
<br>

`main.dart` может выглядеть так

```dart
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const SizedBox();
  };
  var app = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(app.path);
  var box = await Hive.openBox(storageName);
  isShowOnboarding = box.get('isShowOnboarding') ?? true;
  isPremium = box.get('isPremium') ?? false;
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'name',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.fromSeed(seedColor: bgColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
```
