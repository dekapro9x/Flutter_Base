# POST: https://fcm.googleapis.com/v1/projects/chat-firebase-de134/messages:send

# Header:
Authorization:Bearer ya29.a0AcM612yHU11TuY1xmoJy8wUX0h0NwRdLVy0Ku0p9sK2129SP_cM2ZokCK2iTrDwXE2INx_z4nBXRsIBLyQXFSczS1BnD3xI0jlxzHfT08B-pmgJ2Z1765Y2r4ZD8SEJeXLw7KJnYlvOi4lEwNmj_xeiWCwa5XfJyfET7KIqiaCgYKARQSARASFQHGX2MiefECqZMO8WC6TeHhtfc0aw0175
Content-Type:application/json

# Body:
{
  "message": {
    "token": "cQbhhbk7TLqcN8joKJlST9:APA91bG42_E-SIocbQnbXsqCQjc-f_PdnnFnfckC_8U_NnDdbb6L1Y9WgoNhMF7kFrTFY0penwycUjHxa0nRaklMhmSq1YV8uTQUMkYgTw3ykQSTkogvppFQraZ0HYQ6TjqpyZ8m6GFW",
    "notification": {
      "title": "Bạn có 1 thông báo mặc định từ Krmed",
      "body": "Thông báo mặc định từ Krmed"
    },
    "android": {
      "notification": {
        "channel_id": "default_channel_id",
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "image": "https://example.com/image.png",
        "sound": "default_channel_id"
      }
    },
    "apns": {
      "payload": {
        "aps": {
          "alert": {
            "title": "Bạn có 1 thông báo mặc định từ Krmed",
            "body": "Thông báo mặc định từ Krmed"
          },
          "sound": "default"
        }
      },
      "headers": {
        "apns-priority": "10" // Set priority for iOS notifications
      }
    },
    "data": {
      "story_id": "story_12345",
      "channel_id": "default_channel_id",
      "routeKey": "chatDetailsScreen",
      "arguments": "{\"name\":\"BeoTranDev\"}" // JSON string for arguments
    }
  }
}



Giải thích các phần trong payload:
notification: Đây là phần chứa các thuộc tính chung cho thông báo mà cả Android và iOS đều sử dụng.
title và body là tiêu đề và nội dung của thông báo.
android: Cấu hình thông báo riêng cho Android.
channel_id là ID của kênh thông báo trên Android.
click_action là hành động khi người dùng nhấn vào thông báo.
image là URL của hình ảnh để hiển thị trong thông báo.
sound là âm thanh thông báo, sử dụng ID của kênh âm thanh.
apns: Cấu hình thông báo riêng cho iOS (Apple Push Notification Service).
payload chứa các thông tin của thông báo được gửi qua APNs.
aps là phần chứa thông tin cụ thể về thông báo trên iOS, bao gồm alert (tiêu đề và nội dung thông báo) và sound (âm thanh thông báo).
headers có thể chứa các tùy chọn khác như apns-priority để thiết lập độ ưu tiên của thông báo.
data: Thông tin bổ sung được gửi kèm theo thông báo dưới dạng dữ liệu, có thể được sử dụng để xử lý khi thông báo được nhận.
Cấu hình Header:
Authorization: Bearer YOUR_ACCESS_TOKEN (Thay YOUR_ACCESS_TOKEN bằng access token hợp lệ.)
Content-Type: application/json
Đảm bảo rằng bạn đã cung cấp đúng token và cấu hình để gửi yêu cầu đến endpoint của FCM.