Để lấy mã hash của Zalo SDK trên Android với chế độ phát hành (release mode), bạn cần làm theo các bước sau:

### 1. **Tạo Keystore**

Đảm bảo bạn đã tạo keystore để ký ứng dụng của mình. Nếu chưa, bạn có thể tạo một keystore mới bằng cách sử dụng lệnh `keytool` từ JDK:

```bash
keytool -genkey -v -keystore my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias
```

Lưu ý:
- `my-release-key.jks`: Tên của keystore.
- `my-key-alias`: Tên của alias trong keystore.

### 2. **Lấy Mã Hash từ Keystore**

Để lấy mã hash từ keystore với chế độ phát hành, bạn cần sử dụng lệnh `keytool` từ JDK với các thông số tương ứng.

Chạy lệnh sau trong terminal:

```bash
keytool -list -v -keystore my-release-key.jks -alias my-key-alias -storepass [STORE_PASSWORD] -keypass [KEY_PASSWORD] | grep -i 'SHA1:'
```

- `my-release-key.jks`: Đường dẫn đến keystore của bạn.
- `my-key-alias`: Alias của khóa bạn đã sử dụng khi tạo keystore.
- `[STORE_PASSWORD]`: Mật khẩu của keystore.
- `[KEY_PASSWORD]`: Mật khẩu của khóa.

### 3. **Chạy Lệnh `keytool` trên Máy Android**

Bạn có thể sử dụng lệnh `keytool` trực tiếp trên máy Android nếu bạn có Android SDK và ADB (Android Debug Bridge) đã được cài đặt. Thực hiện như sau:

1. **Kết nối thiết bị Android với máy tính** và đảm bảo chế độ USB debugging được bật.

2. **Chạy lệnh `keytool` để lấy mã hash SHA-1**:

   ```bash
   keytool -exportcert -alias [ALIAS_NAME] -keystore [PATH_TO_YOUR_KEYSTORE] -storepass [STORE_PASSWORD] -keypass [KEY_PASSWORD] | openssl sha1 -binary | openssl base64
   ```

   - `[ALIAS_NAME]`: Alias của khóa bạn đã sử dụng khi tạo keystore.
   - `[PATH_TO_YOUR_KEYSTORE]`: Đường dẫn đến keystore.
   - `[STORE_PASSWORD]`: Mật khẩu của keystore.
   - `[KEY_PASSWORD]`: Mật khẩu của khóa.

3. **Thay đổi `openssl` thành các lệnh tương ứng** nếu bạn không có `openssl` trên máy.

### 4. **Sử dụng Mã Hash**

Sử dụng mã hash SHA-1 đã lấy được từ bước trên và thêm vào bảng điều khiển Zalo Developer để cấu hình SDK của bạn.

### Ví Dụ

Ví dụ lệnh lấy mã hash SHA-1 từ keystore:

```bash
keytool -list -v -keystore my-release-key.jks -alias my-key-alias -storepass my-store-password -keypass my-key-password | grep -i 'SHA1:' | awk '{print $2}'
```

Sau khi bạn có mã hash SHA-1, bạn có thể thêm vào bảng điều khiển Zalo Developer để cấu hình ứng dụng của bạn.


# Lệnh lấy mã SHA1 với keyRelease:
keytool -list -v -keystore C:\path\to\my-release-key.jks -alias my-key-alias -storepass [STORE_PASSWORD] -keypass [KEY_PASSWORD] | grep -i 'SHA1:' | awk '{print $2}'

# keytool -list -v -keystore /Users/xuannam/Documents/GitHub/kmed-app/android/app/keys/upload-keystore.jks -alias upload -storepass '1234!@#$' -keypass '1234!@#$' | grep -i 'SHA1:' | awk '{print $2}'
SHa1: 9C:39:82:EB:12:99:0A:DD:3D:1A:C3:29:A1:C0:9E:57:B5:81:16:B2
