Bạn cần chạy lệnh `gcloud auth application-default print-access-token` trong **Google Cloud SDK (gcloud)**, cụ thể là từ **Command Prompt (Windows), Terminal (macOS), hoặc bất kỳ môi trường dòng lệnh nào** mà bạn đã cài đặt Google Cloud SDK trên máy tính của mình.

### Các bước thực hiện:

1. **Cài đặt Google Cloud SDK:**
   - Nếu bạn chưa cài đặt Google Cloud SDK, bạn cần tải và cài đặt từ [trang chủ Google Cloud SDK](https://cloud.google.com/sdk/docs/install).

2. **Mở Terminal hoặc Command Prompt:**
   - Trên **Windows**: Mở **Command Prompt** hoặc **PowerShell**.
   - Trên **macOS** và **Linux**: Mở **Terminal**.

3. **Đăng nhập vào tài khoản Google Cloud của bạn:**
   - Chạy lệnh sau để đăng nhập vào Google Cloud:
     ```bash
     gcloud auth login
     ```
   - Một cửa sổ trình duyệt sẽ mở ra yêu cầu bạn đăng nhập vào tài khoản Google. Hãy đăng nhập bằng tài khoản có quyền truy cập vào dự án Firebase mà bạn đang sử dụng.

4. **Thiết lập Application Default Credentials:**
   - Để thiết lập xác thực mặc định, chạy lệnh sau:
     ```bash
     gcloud auth application-default login
     ```
   - Lệnh này sẽ mở trình duyệt để bạn đăng nhập và thiết lập thông tin xác thực.

5. **Lấy OAuth 2.0 Access Token:**
   - Sau khi đăng nhập thành công, chạy lệnh:
     ```bash
     gcloud auth application-default print-access-token
     ```
   - Lệnh này sẽ trả về một **OAuth 2.0 access token** mà bạn cần sử dụng để xác thực yêu cầu FCM HTTP v1 API.

### Sử dụng OAuth 2.0 Access Token:

Sau khi nhận được **access token**, bạn sẽ dùng nó trong header của yêu cầu API như sau:

```http
Authorization: Bearer YOUR_ACCESS_TOKEN
```

Trong đó, `YOUR_ACCESS_TOKEN` là token bạn vừa nhận được từ lệnh trên. Token này chỉ có hiệu lực trong một khoảng thời gian ngắn (thường là 1 giờ), vì vậy bạn sẽ cần tạo lại nó khi hết hạn.