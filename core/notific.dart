// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> initialize() async {
//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings();

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       iOS: initializationSettingsIOS,
//     );

//     await _notificationsPlugin.initialize(initializationSettings);
//     tz.initializeTimeZones();
//   }

//   static Future<void> scheduleNotification({
//     required String title,
//     required String body,
//     required DateTime scheduledTime,
//   }) async {
//     const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();

//     const NotificationDetails notificationDetails = NotificationDetails(
//       iOS: iosDetails,
//     );

//     await _notificationsPlugin.zonedSchedule(
//       0,
//       title,
//       body,
//       tz.TZDateTime.from(scheduledTime, tz.local),
//       notificationDetails,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//     );
//   }
// }
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    // Инициализация для iOS
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    // Общая инициализация
    const InitializationSettings initializationSettings = InitializationSettings(
      iOS: initializationSettingsIOS,
    );

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
    );

    // Инициализация часовых зон для планирования
    tz.initializeTimeZones();
  }

  // Метод для обработки уведомлений при их открытии
  static void onSelectNotification(NotificationResponse response) {
    // Обработка действия при нажатии на уведомление
    print("Уведомление открыто: ${response.payload}");
  }

  // Метод для обработки уведомлений, полученных на переднем плане (только iOS)
  static void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    print("Получено уведомление на переднем плане: $title, $body");
  }

  // Планирование уведомлений
  static Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
      presentBadge: true,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      iOS: iosDetails,
    );

    await _notificationsPlugin.zonedSchedule(
      0, // Уникальный ID уведомления
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local), // Время с учётом часового пояса
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, // Только время
    );
  }
}
