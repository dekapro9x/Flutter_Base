import 'package:app_base_flutter/configs/get_it/get_it.dart';
import 'package:app_base_flutter/configs/storages/app_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class PolicyScreen extends StatefulWidget {
  @override
  _PolicyScreenState createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  final _appPrefs = getIt<AppPrefStorage>();
  bool hasLogged = false;
  bool isLoadEndPolicyActiveButtonAccept = false;
  String htmlData = '';

  Future<String> getLang() async {
    String? lang = await _appPrefs.getLanguage();
    return lang ?? 'vi'; //Mặc định để ngôn ngữ hiện tại máy hoặc Tiếng Việt.
  }

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    _scrollController.addListener(_scrollListener);
    getLang().then((lang) {
      if (lang == 'vi') {
        setState(() {
          htmlData = """
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Điều khoản sử dụng ứng dụng Krmedi</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
      color: #333;
      line-height: 1.6;
    }
    .container {
      max-width: 800px;
      margin: 50px auto;
      padding: 20px;
      background: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }
    h1 {
      text-align: center;
      color: #4CAF50;
    }
    h2 {
      color: #333;
      border-bottom: 2px solid #4CAF50;
      padding-bottom: 5px;
    }
    p {
      margin: 20px 0;
    }
    ul {
      list-style-type: square;
      padding-left: 20px;
    }
    .footer {
      text-align: center;
      margin-top: 20px;
      padding-top: 10px;
      border-top: 1px solid #ddd;
      color: #aaa;
    }
    .language-toggle {
      text-align: right;
      margin-bottom: 10px;
    }
    .language-toggle a {
      text-decoration: none;
      color: #4CAF50;
      margin-left: 10px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="language-toggle">
      <a href="toggle-en">English</a> |
      <a href="toggle-vi">Tiếng Việt</a>
    </div>
    <h1>Điều khoản sử dụng ứng dụng Krmedi</h1>
    
    <h2>1. Giới Thiệu</h2>
    <p>Chào mừng bạn đến với ứng dụng Krmedi. Chúng tôi cam kết cung cấp cho bạn dịch vụ tốt nhất để đặt lịch khám một cách dễ dàng và thuận tiện.</p>

    <h2>2. Thu Thập Thông Tin</h2>
    <p>Khi sử dụng ứng dụng, chúng tôi có thể thu thập các thông tin sau:</p>
    <ul>
      <li>Thông tin cá nhân: Tên, tuổi, địa chỉ, số điện thoại, email.</li>
      <li>Thông tin y tế: Lịch sử khám bệnh, các bệnh lý liên quan.</li>
      <li>Thông tin thiết bị: Loại thiết bị, hệ điều hành, địa chỉ IP.</li>
    </ul>

    <h2>3. Sử Dụng Thông Tin</h2>
    <p>Các thông tin thu thập được sẽ được sử dụng cho các mục đích sau:</p>
    <ul>
      <li>Đặt lịch khám và xác nhận lịch hẹn.</li>
      <li>Cung cấp các thông tin y tế và nhắc nhở lịch khám.</li>
      <li>Nâng cao chất lượng dịch vụ và trải nghiệm người dùng.</li>
    </ul>

    <h2>4. Bảo Mật Thông Tin</h2>
    <p>Chúng tôi cam kết bảo mật các thông tin cá nhân của bạn và chỉ sử dụng cho các mục đích được nêu trong chính sách này. Chúng tôi áp dụng các biện pháp bảo mật phù hợp để bảo vệ thông tin của bạn khỏi truy cập trái phép.</p>

    <h2>5. Quyền Lợi Người Dùng</h2>
    <p>Bạn có quyền truy cập, cập nhật hoặc yêu cầu xóa thông tin cá nhân của mình bất kỳ lúc nào bằng cách liên hệ với chúng tôi qua email hoặc số điện thoại hỗ trợ.</p>

    <h2>6. Bảo Hộ Quyền Lợi Người Dùng</h2>
    <p>Chúng tôi cam kết bảo hộ quyền lợi và lợi ích của người dùng. Mọi vi phạm quyền lợi người dùng sẽ được xử lý theo pháp luật và chính sách nội bộ của chúng tôi.</p>

    <h2>7. Điều Khoản Sử Dụng Dịch Vụ</h2>
    <p>Khi sử dụng ứng dụng Krmedi, bạn đồng ý tuân thủ các điều khoản và điều kiện sau:</p>
    <ul>
      <li>Bạn cam kết cung cấp thông tin chính xác và đầy đủ khi đăng ký và sử dụng dịch vụ.</li>
      <li>Bạn không sử dụng ứng dụng cho bất kỳ hoạt động bất hợp pháp hoặc vi phạm pháp luật nào.</li>
      <li>Chúng tôi có quyền tạm ngừng hoặc chấm dứt tài khoản của bạn nếu phát hiện bất kỳ hành vi vi phạm nào.</li>
      <li>Các điều khoản và điều kiện này có thể được cập nhật mà không cần thông báo trước. Bạn nên kiểm tra thường xuyên để cập nhật các thay đổi.</li>
    </ul>

    <h2>8. Tuyên Bố Miễn Trừ Trách Nhiệm</h2>
    <p>Tất cả nội dung trên ứng dụng Krmedi, bao gồm văn bản, hình ảnh, video, và đồ họa, chỉ mang tính chất thông tin và không thay thế cho lời khuyên, chẩn đoán, hoặc điều trị y tế chuyên nghiệp. Bạn không nên sử dụng thông tin trên ứng dụng này để tự chẩn đoán hoặc điều trị các vấn đề sức khỏe. Hãy tham khảo ý kiến bác sĩ của bạn cho bất kỳ triệu chứng hoặc tình trạng y tế nào.</p>
    <p>Thông tin trên ứng dụng này không nên được xem như là đề xuất hoặc hướng dẫn cho bất kỳ sản phẩm, quy trình, xét nghiệm, hoặc công ty nào. Bạn hoàn toàn chịu trách nhiệm khi dựa vào thông tin cung cấp bởi nội dung của chúng tôi.</p>
    <p>Nếu bạn có sức khỏe kém hoặc có các bệnh từ trước, hãy tham khảo ý kiến bác sĩ trước khi làm theo bất kỳ khuyến nghị nào trên ứng dụng này hoặc sử dụng các sản phẩm được đề cập. Chúng tôi không chịu trách nhiệm cho bất kỳ hành động nào của bạn dựa trên nội dung của chúng tôi.</p>
    <p>Nếu bạn đang mang thai hoặc cho con bú, hãy nói chuyện với bác sĩ trước khi sử dụng bất kỳ sản phẩm hoặc dịch vụ nào. Luôn sử dụng sản phẩm theo hướng dẫn và ngừng sử dụng nếu có phản ứng bất lợi.</p>
    <p>Thay đổi chế độ ăn uống nên được thảo luận với bác sĩ, đặc biệt nếu bạn đang mang thai, cho con bú, mắc bệnh tiểu đường, hoặc có các tình trạng y tế khác. Ngừng sử dụng sản phẩm nếu có phản ứng dị ứng.</p>
    <p>Kết quả có thể khác nhau tùy thuộc vào cơ địa mỗi người. Các lời chứng thực trên ứng dụng là ví dụ và không áp dụng cho tất cả mọi người.</p>
    <p>Luôn tìm kiếm sự hướng dẫn của bác sĩ hoặc chuyên gia y tế có trình độ cho bất kỳ câu hỏi nào liên quan đến sức khỏe. Nếu bạn nghĩ rằng bạn có tình trạng khẩn cấp y tế, hãy gọi bác sĩ hoặc dịch vụ khẩn cấp ngay lập tức.</p>
    <p>Các liên kết bên ngoài đến các trang web hoặc tài liệu giáo dục khác đều theo sự rủi ro của bạn. Chúng tôi không chịu trách nhiệm về nội dung của các trang web bên thứ ba.</p>

    <div class="footer">
      <p>© 2024 Ứng dụng Krmedi. Bảo lưu mọi quyền.</p>
    </div>
  </div>
</body>
</html>
""";
        });
      } else {
        setState(() {
          htmlData = """
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Terms of Use for Krmedi App</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
      color: #333;
      line-height: 1.6;
    }
    .container {
      max-width: 800px;
      margin: 50px auto;
      padding: 20px;
      background: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }
    h1 {
      text-align: center;
      color: #4CAF50;
    }
    h2 {
      color: #333;
      border-bottom: 2px solid #4CAF50;
      padding-bottom: 5px;
    }
    p {
      margin: 20px 0;
    }
    ul {
      list-style-type: square;
      padding-left: 20px;
    }
    .footer {
      text-align: center;
      margin-top: 20px;
      padding-top: 10px;
      border-top: 1px solid #ddd;
      color: #aaa;
    }
    .language-toggle {
      text-align: right;
      margin-bottom: 10px;
    }
    .language-toggle a {
      text-decoration: none;
      color: #4CAF50;
      margin-left: 10px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="language-toggle">
      <a href="toggle-en">English</a> |
      <a href="toggle-vi">Tiếng Việt</a>
    </div>
    <h1>Terms of Use for the Krmedi App</h1>
    
    <h2>1. Introduction</h2>
    <p>Welcome to the Krmedi app. We are committed to providing you with the best service to easily and conveniently schedule medical appointments.</p>

    <h2>2. Information Collection</h2>
    <p>When using the app, we may collect the following information:</p>
    <ul>
      <li>Personal Information: Name, age, address, phone number, email.</li>
      <li>Medical Information: Medical history, related diseases.</li>
      <li>Device Information: Device type, operating system, IP address.</li>
    </ul>

    <h2>3. Use of Information</h2>
    <p>The information collected will be used for the following purposes:</p>
    <ul>
      <li>Scheduling appointments and confirming dates.</li>
      <li>Providing medical information and appointment reminders.</li>
      <li>Improving service quality and user experience.</li>
    </ul>

    <h2>4. Information Security</h2>
    <p>We commit to securing your personal information and will only use it for the purposes stated in this policy. We apply appropriate security measures to protect your information from unauthorized access.</p>

    <h2>5. User Rights</h2>
    <p>You have the right to access, update, or request the deletion of your personal information at any time by contacting us via email or support phone number.</p>

    <h2>6. User Rights Protection</h2>
    <p>We commit to protecting the rights and interests of users. Any violation of user rights will be handled according to the law and our internal policies.</p>

    <h2>7. Service Use Terms</h2>
    <p>By using the Krmedi app, you agree to comply with the following terms and conditions:</p>
    <ul>
      <li>You commit to providing accurate and complete information when registering and using the service.</li>
      <li>You will not use the app for any illegal activities or breach of laws.</li>
      <li>We reserve the right to suspend or terminate your account if any breaches are detected.</li>
      <li>Terms and conditions may be updated without prior notice. You should check regularly for updates.</li>
    </ul>

    <h2>8. Disclaimer</h2>
    <p>All content on the Krmedi app, including text, images, video, and graphics, is for informational purposes only and is not a substitute for professional medical advice, diagnosis, or treatment. You should not use the information on this app to self-diagnose or treat any health problems. Always consult your doctor for any symptoms or medical conditions.</p>
    <p>The information on this app should not be considered as a recommendation or guidance for any products, procedures, tests, or companies. You are solely responsible for relying on the information provided by our content.</p>
    <p>If you have poor health or pre-existing conditions, please consult your doctor before following any recommendations on this app or using any mentioned products. We are not responsible for any actions you take based on our content.</p>
    <p>If you are pregnant or breastfeeding, consult your doctor before using any products or services. Always use products as directed and discontinue use if adverse reactions occur.</p>
    <p>Changes in diet should be discussed with your doctor, especially if you are pregnant, breastfeeding, have diabetes, or have other medical conditions. Discontinue use if allergic reactions occur.</p>
    <p>Results may vary depending on individual differences. Testimonials on the app are examples and do not apply to everyone.</p>
    <p>Always seek the guidance of your doctor or a qualified health professional with any questions you may have regarding your health. If you think you may have a medical emergency, call your doctor or emergency services immediately.</p>
    <p>External links to other websites or educational materials (e.g., PDFs) are followed at your own risk. We are not responsible for the claims of third-party websites or educational providers.</p>

    <div class="footer">
      <p>© 2024 Krmedi App. All rights reserved.</p>
    </div>
  </div>
</body>
</html>
""";
        });
      }
    });
  }

  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        isLoadEndPolicyActiveButtonAccept = true;
      });
    }
  }

  Future<void> _checkLoginStatus() async {
    bool userHasLogin = await _appPrefs.hasLoggedIn();
    setState(() {
      hasLogged = userHasLogin;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('policy_title_screen'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Html(
                  data: htmlData,
                ),
              ),
            ),
            SizedBox(height: 20),
            if (!hasLogged)
              AnimatedOpacity(
                opacity: 1,
                duration: Duration(seconds: 1),
                child: ElevatedButton(
                  onPressed: isLoadEndPolicyActiveButtonAccept
                      ? () async {
                          await _appPrefs.saveActionsAcceptPolicyUseApp(
                              isAccept: true);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('thanks_use_krmedi'.tr),
                              backgroundColor: Colors.green,
                            ),
                          );
                          //Không sử dụng pushNamedAndRemoveUntil hoặc pushNamed gây tạo lại cây wirget => Gọi GPS nhiều lần.
                          // Navigator.of(context).pushNamedAndRemoveUntil(
                          //   RouteGenerator.bottomNavigationBar,
                          //   (route) => false,
                          // );
                        }
                      : null,
                  child: Text('I_agree_policy'.tr),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
