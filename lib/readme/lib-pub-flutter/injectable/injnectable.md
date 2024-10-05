**`injectable`** là một thư viện dành cho **Flutter** và **Dart** dùng để tạo ra **dependency injection** một cách dễ dàng và tự động. `injectable` giúp quản lý việc khởi tạo và cung cấp các phụ thuộc (dependencies) trong ứng dụng của bạn mà không cần phải viết quá nhiều mã thủ công.

### Chức Năng Chính của `injectable`
- **Dependency Injection (DI)**: Thư viện `injectable` giúp **inject** các đối tượng (dependencies) vào ứng dụng của bạn một cách tự động, giúp tránh việc phải khởi tạo thủ công hoặc truyền đối tượng giữa các thành phần.
- **Tạo Dependencies Tự Động**: Nó tích hợp với **`get_it`** – một thư viện DI phổ biến trong Flutter, và tạo ra các dependencies thông qua các **annotations** (chú thích) thay vì tự tay viết mã để đăng ký các dịch vụ.
  
### Cách `injectable` Hoạt Động
`injectable` hoạt động bằng cách sử dụng **code generation** (tạo mã tự động). Bạn chỉ cần đánh dấu các lớp hoặc services cần đăng ký bằng các **annotation** và sau đó chạy một lệnh để tự động sinh ra mã mà sẽ đảm nhiệm việc đăng ký các dependency này vào container (`get_it` container).

### Các Thư Viện Thường Dùng Cùng `injectable`
- **`get_it`**: `injectable` sử dụng `get_it` như là **service locator**, quản lý các dependencies của ứng dụng. `get_it` cho phép bạn dễ dàng truy xuất các dịch vụ mà không cần thông qua quá nhiều tầng lớp.
  
### Ví Dụ Về Cách Sử Dụng `injectable`
1. **Cài Đặt Thư Viện**
   Thêm thư viện `injectable` và `get_it` vào `pubspec.yaml`:

   ```yaml
   dependencies:
     get_it: latest_version
     injectable: latest_version

   dev_dependencies:
     build_runner: latest_version
     injectable_generator: latest_version
   ```

2. **Tạo File cấu hình DI**
   - Tạo một file `injection.dart` để khởi tạo DI, ví dụ:

   ```dart
   import 'package:get_it/get_it.dart';
   import 'package:injectable/injectable.dart';
   import 'injection.config.dart';

   final getIt = GetIt.instance;

   @InjectableInit()
   void configureDependencies() => $initGetIt(getIt);
   ```

3. **Chú Thích Dependencies**
   - Đánh dấu các lớp cần inject với annotation `@injectable` hoặc `@singleton`:

   ```dart
   import 'package:injectable/injectable.dart';

   @injectable
   class ApiService {
     void fetchData() {
       print("Fetching data...");
     }
   }
   ```

4. **Chạy Code Generator**
   - Chạy lệnh sau để tự động tạo mã:

   ```sh
   flutter pub run build_runner build
   ```

   Lệnh này sẽ tạo ra các file cần thiết để quản lý các dependencies.

5. **Sử Dụng Dependencies**
   - Sau khi cấu hình xong, bạn có thể sử dụng `getIt` để truy cập vào dependencies:

   ```dart
   void main() {
     configureDependencies();
     final apiService = getIt<ApiService>();
     apiService.fetchData();
   }
   ```

### Lợi Ích Khi Sử Dụng `injectable`
1. **Tăng Tính Modular**: DI giúp tách biệt các module, từ đó dễ bảo trì và tái sử dụng hơn.
2. **Dễ Dàng Viết Test**: Vì `injectable` giúp quản lý dependencies tốt hơn, bạn có thể dễ dàng viết các bài test với các mock object mà không cần phụ thuộc vào triển khai thực tế.
3. **Tự Động Hóa và Giảm Code Thủ Công**: Sử dụng `injectable` và `get_it` giúp giảm rất nhiều mã thủ công khi đăng ký và quản lý các dịch vụ của ứng dụng.

### Kết Luận
`injectable` trong Flutter là một thư viện hữu ích giúp **tự động hóa việc dependency injection**, làm cho ứng dụng của bạn dễ bảo trì và kiểm thử hơn. Bằng cách kết hợp với `get_it`, `injectable` giúp bạn quản lý các dependencies của ứng dụng mà không cần phải viết mã thủ công để đăng ký chúng, từ đó tiết kiệm thời gian và giảm thiểu lỗi.