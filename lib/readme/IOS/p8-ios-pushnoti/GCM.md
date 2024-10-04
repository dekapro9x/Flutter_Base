https://console.firebase.google.com/project/chat-firebase-de134/settings/cloudmessaging/ios:com.ilglobal.krmedi
# Bước 1: Upload P8 lên
# Bước 2: Nhập key ID
# TeamID: L9J35MB3D2
# KeyID: Y64S92L2MT
# AppDelegate.swift

import UIKit
import Flutter
import GoogleMaps
import Firebase
import UserNotifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, UNUserNotificationCenterDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Cấu hình Google Maps
    //Key này của a Quý.
    GMSServices.provideAPIKey("AIzaSyDQO5YhrnYxyI215uOX9bNQ-_xxV_stGf8")
    
    // Cấu hình Firebase:
    FirebaseApp.configure()
    
    // Đăng ký nhận thông báo đẩy
    UNUserNotificationCenter.current().delegate = self
    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    UNUserNotificationCenter.current().requestAuthorization(
      options: authOptions,
      completionHandler: {_, _ in })
    
    application.registerForRemoteNotifications()
    
    // Đăng ký danh mục thông báo
    registerNotificationCategories()

    // Đăng ký plugin
    GeneratedPluginRegistrant.register(with: self)
    
    // Ví dụ gửi thông báo với âm thanh tùy chỉnh
    sendLocalNotification()
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  // Đăng ký các danh mục thông báo (Notification Categories)
  func registerNotificationCategories() {
      let replyAction = UNNotificationAction(
          identifier: "REPLY_ACTION",
          title: "Reply",
          options: [.foreground]
      )

      let markAsReadAction = UNNotificationAction(
          identifier: "MARK_AS_READ_ACTION",
          title: "Mark as Read",
          options: []
      )

      let category = UNNotificationCategory(
          identifier: "MESSAGE_CATEGORY",
          actions: [replyAction, markAsReadAction],
          intentIdentifiers: [],
          options: []
      )

      UNUserNotificationCenter.current().setNotificationCategories([category])
  }
  
  // Gửi thông báo cục bộ với âm thanh tùy chỉnh
  func sendLocalNotification() {
      let content = UNMutableNotificationContent()
      content.title = "Custom Sound Notification"
      content.body = "This notification has a custom sound!"
      content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "custom_sound.wav"))
      content.categoryIdentifier = "MESSAGE_CATEGORY"
      
      let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
      let request = UNNotificationRequest(identifier: "customSoundNotification", content: content, trigger: trigger)
      
      UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
  }

  // Xử lý khi nhận được thông báo đẩy trong khi ứng dụng đang mở
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
                              withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.alert, .badge, .sound])
  }
  
  // Xử lý khi người dùng bấm vào thông báo đẩy
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
    completionHandler()
  }
}


# Ghi chú
// Đảm bảo tệp âm thanh của bạn có định dạng .wav, .aiff, hoặc .caf.
// Giải thích các phần bổ sung:
// content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "custom_sound.wav")):
//  Dòng này chỉ định âm thanh tùy chỉnh cho thông báo. Tên tệp cần chính xác với tệp mà bạn đã thêm vào dự án.
// sendLocalNotification(): Đây là một ví dụ về cách bạn có thể gửi thông báo cục bộ (local notification) từ ứng dụng với âm thanh tùy chỉnh.
// Thay thế "custom_sound.wav": Hãy thay thế "custom_sound.wav" bằng tên tệp âm thanh của bạn.
// Sử dụng với Firebase Cloud Messaging (FCM):
// Nếu bạn đang sử dụng FCM, bạn có thể chỉ định âm thanh tùy chỉnh bằng cách thêm trường "sound" vào payload JSON khi gửi thông báo từ server:
// json
// Sao chép mã
// {
//   "to": "<DEVICE_TOKEN>",
//   "notification": {
//     "title": "Custom Sound Notification",
//     "body": "This notification has a custom sound!",
//     "sound": "custom_sound.wav"
//   }
// }