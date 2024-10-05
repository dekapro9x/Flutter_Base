import 'package:event_bus/event_bus.dart';
import 'package:app_base_flutter/common/log_utils.dart';

// Định nghĩa các sự kiện khác nhau:
class MyCustomEvent {
  final String message;
  MyCustomEvent(this.message);
}

class AnotherCustomEvent {
  final int id;
  AnotherCustomEvent(this.id);
}

class YetAnotherCustomEvent {
  final bool isActive;
  YetAnotherCustomEvent(this.isActive);
}

class EventHideBottomMenu {
  final String actions;
  EventHideBottomMenu(this.actions);
}

class EventNewMess {
  final bool isNewMess;
  EventNewMess(this.isNewMess);
}

// Sự kiện checkin quét QR code checkin:
class ScannerQRCodeCheckin {
  final String actions;
  final String qrCodeScanner;
  ScannerQRCodeCheckin({required this.actions, required this.qrCodeScanner});
}

// Class để chứa tất cả các sự kiện:
class MyEvents {
  static MyCustomEvent myCustomEvent(String message) => MyCustomEvent(message);
  static AnotherCustomEvent anotherCustomEvent(int id) =>
      AnotherCustomEvent(id);
  static YetAnotherCustomEvent yetAnotherCustomEvent(bool isActive) =>
      YetAnotherCustomEvent(isActive);
  // Hàm tạo sự kiện ScannerQRCodeCheckin:
  static ScannerQRCodeCheckin scannerQRCodeCheckin(
          String actions, String qrCodeScanner) =>
      ScannerQRCodeCheckin(actions: actions, qrCodeScanner: qrCodeScanner);
}

class EventBusServices {
  static final EventBus _eventBus = EventBus();

  // Phương thức gửi sự kiện:
  static void fireEventEmit(dynamic event) {
    _eventBus.fire(event);
  }

// Phương thức lắng nghe sự kiện theo loại sự kiện:
  static void listenOnEvent<T>(Function(T event) onData) {
    logWithColor("Listening for event of type: ${T.toString()}", blue);
    _eventBus.on<T>().listen((event) {
      logWithColor("Event received of type: ${T.toString()}", green);
      if (event is MyCustomEvent) {
        logWithColor("Event data: { message: ${event.message} }", yellow);
      } else if (event is AnotherCustomEvent) {
        logWithColor("Event data: { id: ${event.id} }", yellow);
      } else if (event is YetAnotherCustomEvent) {
        logWithColor("Event data: { isActive: ${event.isActive} }", yellow);
      } else {
        logWithColor("Event data: $event", yellow);
      }
      onData(event);
    });
  }
}
