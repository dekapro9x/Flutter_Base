import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:location/location.dart' as location;

class GeolocationServices {
  final location.Location _locationController = location.Location();
  Future<bool> requestLocationPermission() async {
    geolocator.LocationPermission permission = await geolocator.Geolocator.checkPermission();
    if (permission == geolocator.LocationPermission.denied) {
      permission = await geolocator.Geolocator.requestPermission();
    }
    return permission == geolocator.LocationPermission.whileInUse ||
           permission == geolocator.LocationPermission.always;
  }

  //Lấy vị trí hiện tại:
  Future<geolocator.Position?> getCurrentLocation() async {
    bool hasPermission = await requestLocationPermission();
    if (hasPermission) {
      try {
        // Lấy vị trí hiện tại với GPS chính xác:
        return await geolocator.Geolocator.getCurrentPosition(
          desiredAccuracy: geolocator.LocationAccuracy.high,
        );
      } catch (e) {
        print('Lỗi khi lấy vị trí hiện tại: $e');
        return null;
      }
    } else {
      print('Không có quyền truy cập vị trí');
      return null;
    }
  }

  // Theo dõi vị trí liên tục => Nếu cần theo dõi vị trí di chuyển:
  Stream<geolocator.Position> getPositionStream() {
    // Trả về một Stream không có giá trị (empty stream) nếu không có quyền truy cập GPS.
    return Stream.periodic(Duration(seconds: 1)).asyncMap((_) async {
      bool hasPermission = await requestLocationPermission();
      if (hasPermission) {
        try {
          // Trả về vị trí hiện tại:
          return await geolocator.Geolocator.getCurrentPosition(
            desiredAccuracy: geolocator.LocationAccuracy.high,
          );
        } catch (e) {
          print('Lỗi khi lấy vị trí: $e');
          throw Exception('Không thể lấy vị trí');
        }
      } else {
        throw Exception('Không có quyền truy cập vị trí');
      }
    });
  }

  // Yêu cầu bật dịch vụ GPS (Lúc nào dùng đến map thì bật lên => Như chức năng khám phá hay là bản đồ)
  Future<void> requestService() async {
    bool serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) {
        throw Exception('Không thể bật dịch vụ GPS');
      }
    }
  }

  // Kiểm tra và yêu cầu quyền truy cập vị trí và dịch vụ GPS:
  Future<void> ensureLocationServiceEnabled() async {
    try {
      await requestService();
    } catch (e) {
      print('Lỗi khi yêu cầu dịch vụ GPS: $e');
    }
  }

   // Kiểm tra xem dịch vụ GPS đã bật chưa:
  Future<bool> isGpsEnabled() async {
    return await _locationController.serviceEnabled();
  }
}
