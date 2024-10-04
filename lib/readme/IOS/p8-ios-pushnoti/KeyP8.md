# Name:KrmediPushnotificationsP8
# TeamID: L9J35MB3D2
# KeyID: Y64S92L2MT
# Services:Apple Push Notifications service (APNs)


Tuyệt vời! Nếu bạn đã có file `.p8` rồi, bạn có thể tiếp tục sử dụng nó để cấu hình Push Notifications cho ứng dụng iOS của mình. Dưới đây là các bước tiếp theo bạn cần thực hiện:

### Bước 1: Xác định Key ID và Team ID
- **Key ID**: Bạn có thể tìm thấy Key ID đi kèm với file `.p8` khi tạo key trên Apple Developer Portal. Nếu bạn không nhớ, hãy đăng nhập vào Apple Developer Portal và đi đến phần **Certificates, Identifiers & Profiles** > **Keys** để xem Key ID.
- **Team ID**: Team ID có thể được tìm thấy trong mục **Membership** của Apple Developer Account.

### Bước 2: Cấu hình Firebase (nếu sử dụng Firebase Cloud Messaging)
Nếu bạn sử dụng Firebase để quản lý Push Notifications:

1. **Truy cập Firebase Console**:
   - Vào [Firebase Console](https://console.firebase.google.com/) và chọn dự án của bạn.

2. **Đi tới Cloud Messaging Settings**:
   - Trong phần **Project Settings**, chọn tab **Cloud Messaging**.

3. **Tải lên file `.p8`**:
   - Trong phần **APNs authentication key**, nhấp vào **Upload** và chọn file `.p8` mà bạn đã có.
   - Nhập **Key ID** và **Team ID** tương ứng.

4. **Lưu cấu hình**:
   - Sau khi tải lên file và nhập thông tin, nhấn **Save** để lưu cấu hình.

### Bước 3: Cập nhật ứng dụng iOS
Trong mã nguồn của ứng dụng iOS, bạn đã cấu hình `AppDelegate.swift` như trong hướng dẫn trước đó để đăng ký nhận Push Notifications và xử lý chúng. 

### Bước 4: Test Push Notifications
Sau khi hoàn thành các bước trên:

1. **Xây dựng ứng dụng và cài đặt lên thiết bị thật** (không phải là simulator).
2. **Gửi thử một Push Notification** từ Firebase Console hoặc từ server của bạn để kiểm tra xem thiết bị có nhận được thông báo hay không.

Nếu mọi thứ được cấu hình đúng, thiết bị của bạn sẽ nhận được Push Notifications từ hệ thống mà bạn đã cấu hình.