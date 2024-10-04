Lỗi "command not found: gcloud" cho biết rằng lệnh `gcloud` chưa được cài đặt hoặc không được nhận diện trong đường dẫn của hệ thống của bạn. Để sử dụng lệnh `gcloud`, bạn cần cài đặt **Google Cloud SDK** trên máy tính của mình.

### Các bước để cài đặt Google Cloud SDK

1. **Tải Google Cloud SDK:**
   - Truy cập [Google Cloud SDK Downloads](https://cloud.google.com/sdk/docs/install) và tải xuống bản cài đặt phù hợp với hệ điều hành của bạn (Windows, macOS, hoặc Linux).

2. **Cài đặt Google Cloud SDK:**
   - **Trên macOS hoặc Linux:**
     - Mở Terminal và chạy các lệnh sau để tải và cài đặt Google Cloud SDK:
       ```bash
       curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-<VERSION>-<OS>.tar.gz
       tar -xf google-cloud-sdk-<VERSION>-<OS>.tar.gz
       ./google-cloud-sdk/install.sh
       ```
     - Thay `<VERSION>` và `<OS>` bằng phiên bản và hệ điều hành thích hợp. Hoặc bạn có thể cài đặt SDK bằng **Homebrew**:
       ```bash
       brew install --cask google-cloud-sdk
       ```
   - **Trên Windows:**
     - Tải xuống và chạy trình cài đặt Google Cloud SDK `.exe`. Sau khi cài đặt, bạn có thể mở **Command Prompt** hoặc **PowerShell** và sử dụng lệnh `gcloud`.

3. **Khởi tạo Google Cloud SDK:**
   - Sau khi cài đặt xong, bạn cần khởi tạo Google Cloud SDK bằng lệnh:
     ```bash
     gcloud init
     ```
   - Lệnh này sẽ yêu cầu bạn đăng nhập vào tài khoản Google của bạn và chọn một dự án mặc định.

4. **Thiết lập Application Default Credentials:**
   - Đăng nhập và thiết lập thông tin xác thực mặc định:
     ```bash
     gcloud auth application-default login
     ```

5. **Lấy OAuth 2.0 Access Token:**
   - Sau khi thiết lập xong, bạn có thể chạy lệnh:
     ```bash
     gcloud auth application-default print-access-token
     ```

Sau khi cài đặt thành công, bạn có thể sử dụng lệnh `gcloud` mà không gặp lỗi "command not found" nữa. Hãy thử lại các bước trên để đảm bảo rằng bạn đã cài đặt và thiết lập đầy đủ Google Cloud SDK.