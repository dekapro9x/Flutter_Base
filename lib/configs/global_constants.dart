class GlobalConstants {
  static const String kUser = 'USER';
  static const String kProfile = 'PROFILE';
  static const String kPharmacies = 'PHARMACIES';
  static const String TokenUserLogin = 'TOKEN';
  static const String kAvt = 'AVATAR';
  static const String kSkipOnboard = 'SKIP_ON_BOARD';
  static const String kLanguage = 'LANGUAGE';
  static const String FONT_FAMILY = 'FONT_FAMILY';
  static const String isAcceptPolicy = 'IS_ACCEPT_POLICY';
  static const String kUserLogin = 'USER_NAME_LOGIN';
  static const String listRoomBookingSuccess = 'LIST_ROOM_MEETING_SUCCESS';
  static const String listRoomMeetingManage = 'LIST_ROOM_MEETING_MANAGE';
  static List<String> cashRegisterTypes = ['open', 'close'];
  static List<String> orderStatus = ['final', 'draft'];
  static List<String> discountTypes = ['fixed', 'percentage'];
  static List<String> orderShippings = [
    'ordered',
    'packed',
    'shipped',
    'delivered',
    'cancelled',
  ];

  static List<String> orderRecurs = [
    'days',
    'months',
    'years',
  ];

  static List<String> barCodeTypes = [
    'EAN-13',
    'EAN-8',
    'UPC-A',
    'UPC-E',
    'Code 128 (C128)',
    'Code 128 (C39)',
  ];

  static List<String> taxTypes = ['inclusive', 'exclusive'];
  static List<String> productTypes = ['single', 'variable'];
  static List<String> payTermTypes = ['days', 'months'];
  static List<String> fonts = ['Roboto', 'Manrope', 'Playfair Display'];
  static List<String> customerGroupTypes = [
    'Percentage',
    'Selling Price Group',
  ];
}

class HistoryPaymentStatus {
  static const String processing = 'PROCESSING';
  static const String waitingForPayment = 'WAITING FOR PAYMENT';
  static const String shipping = 'SHIPPING';
  static const String delivered = 'DELIVERED';
  static const String canceled = 'CANCELED';
}
