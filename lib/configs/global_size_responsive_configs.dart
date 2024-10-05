import 'package:flutter/material.dart';

class SizeConfigResponsiveApp {
  final BuildContext context;

  // Kích thước design ban đầu của Phi design:
  static const double designWidth = 375.0;
  static const double designHeight = 812.0;

  SizeConfigResponsiveApp(this.context);

   double getWidthDesign() {
    return designWidth;
  }

    double getHeightDesign() {
    return designHeight;
  }

  // Tính toán tỷ lệ dựa trên chiều rộng của thiết bị:
  double getWidthReposive(double inputWidth) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / designWidth) * screenWidth;
  }

  // Tính toán tỷ lệ dựa trên chiều cao của thiết bị hiện tại:
  double getHeightResponsive(double inputHeight) {
    double screenHeight = MediaQuery.of(context).size.height;
    return (inputHeight / designHeight) * screenHeight;
  }

  // Tính toán tỷ lệ cỡ chữ dựa trên chiều rộng màn hình:
  double getFontSizeResponsive(double inputFontSize) {
  // Lấy kích thước màn hình
  double screenWidth = MediaQuery.of(context).size.width;
  // Đặt giá trị thiết kế mà bạn muốn so sánh
  double designWidth = 375.0; 
  // Tính toán kích thước chữ phản hồi với tỷ lệ màn hình
  double responsiveFontSize = (inputFontSize / designWidth) * screenWidth;
  // Hệ số điều chỉnh để giảm kích thước chữ nếu cần thiết
  double scaleFactor = 0.9; 
  // Áp dụng hệ số điều chỉnh và đảm bảo kích thước chữ không quá nhỏ
  return responsiveFontSize * scaleFactor;
}
}
