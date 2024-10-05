import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_base_flutter/configs/global_colors.dart';
import 'package:app_base_flutter/configs/global_size_responsive_configs.dart';
import 'package:app_base_flutter/models/intro/onboarding_data.dart';
import 'package:app_base_flutter/routers//route_generator.dart';
import 'package:app_base_flutter/widgets/app_big_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 8),
      duration: const Duration(milliseconds: 400),
      height: 8,
      width: currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: currentPage == index
            ? GlobalColors.primaryColor
            : GlobalColors.primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfigResponsiveApp sizeConfigReponsive =
        SizeConfigResponsiveApp(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Điều khiển PageView : Chuyển sang PageView giới thiệu app bằng cử chỉ vuốt
              //Chỗ này cần xử lý thêm tiếng Việt ở dưới  ( Làm sau )
              Expanded(
                flex: 3, //3 màn flex = 1
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    // Cập nhật trang hiện tại khi chuyển trang: Xử ký cả dot next tương ứng ở dưới.
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingContents
                      .length, // Số lượng trang hiện tại ( Đang để là 3 ảnh giới thiệu app )
                  itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Hiển thị nút "Skip" khi đang ở trang cuối cùng -> Chuyển sang màn hình Policy
                      currentPage == onboardingContents.length - 1
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    navigator!.pushNamedAndRemoveUntil(
                                        RouteGenerator.policy,
                                        (route) => false);
                                  },
                                  borderRadius: BorderRadius.circular(6),
                                  splashColor: Colors.transparent,
                                  child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: AppBigText(
                                        text: 'Skip',
                                        size: 16,
                                        fontWeight: FontWeight.w800,
                                        color: GlobalColors.primaryColor,
                                      )),
                                )
                              ],
                            )
                          : const SizedBox.shrink(),
                      SizedBox(
                        height: sizeConfigReponsive.getHeightResponsive(32),
                      ),
                      // Hình ảnh của trang hiện tại : Lấy 3 ảnh AppIntro (Chỗ này ảnh để container cho full màn)
                      SizedBox(
                        child: Image.asset(
                          onboardingContents[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: sizeConfigReponsive.getWidthReposive(24),
                      ),
                      // Tiêu đề của trang:
                      AppBigText(
                        text: onboardingContents[index].title,
                        size: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: sizeConfigReponsive.getWidthReposive(16),
                      ),
                      // Phụ đề của trang:
                      AppBigText(
                        text: onboardingContents[index].subtitle,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        color: GlobalColors.kGreyTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    // Hiển thị các nút điều hướng và chỉ báo trang:
                    currentPage == onboardingContents.length - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Nút quay lại trang trước:
                              currentPage == 0
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        _pageController.previousPage(
                                          duration: const Duration(
                                            milliseconds: 400,
                                          ),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      child: Container(
                                        width: sizeConfigReponsive
                                            .getWidthReposive(48),
                                        height: sizeConfigReponsive
                                            .getWidthReposive(48),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                sizeConfigReponsive
                                                    .getWidthReposive(46)),
                                            color: Colors.white,
                                            border: Border.all(
                                                color:
                                                    GlobalColors.primaryColor)),
                                        child: const Icon(
                                          Icons.arrow_back,
                                          color: GlobalColors.primaryColor,
                                        ),
                                      ),
                                    ),
                              // Chỉ báo trang:
                              Row(
                                children: List.generate(
                                  onboardingContents.length,
                                  (index) => dotIndicator(index),
                                ),
                              ),
                              SizedBox.fromSize(
                                size: const Size(48, 48),
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Nút quay lại trang trước:
                              currentPage != 0
                                  ? GestureDetector(
                                      onTap: () {
                                        _pageController.previousPage(
                                          duration: const Duration(
                                            milliseconds: 400,
                                          ),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      child: Container(
                                        width: sizeConfigReponsive
                                            .getWidthReposive(48),
                                        height: sizeConfigReponsive
                                            .getWidthReposive(48),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                sizeConfigReponsive
                                                    .getWidthReposive(46)),
                                            color: Colors.white,
                                            border: Border.all(
                                                color:
                                                    GlobalColors.primaryColor)),
                                        child: const Icon(
                                          Icons.arrow_back,
                                          color: GlobalColors.primaryColor,
                                        ),
                                      ),
                                    )
                                  : SizedBox.fromSize(
                                      size: const Size(48, 48),
                                    ),
                              // Chỉ báo trang:
                              Row(
                                children: List.generate(
                                  onboardingContents.length,
                                  (index) => dotIndicator(index),
                                ),
                              ),
                              // Nút chuyển đến trang kế tiếp.
                              GestureDetector(
                                onTap: () {
                                  _pageController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Container(
                                  width:
                                      sizeConfigReponsive.getWidthReposive(48),
                                  height:
                                      sizeConfigReponsive.getWidthReposive(48),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        sizeConfigReponsive
                                            .getWidthReposive(45)),
                                    color: GlobalColors.primaryColor,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: sizeConfigReponsive.getHeightResponsive(32),
                    ),
                    // Hiển thị nút đăng nhập hoặc đăng ký khi ở trang cuối cùng:
                    currentPage == onboardingContents.length - 1
                        ? GestureDetector(
                            onTap: () {
                              // navigator!.pushNamedAndRemoveUntil(
                              //     RouteGenerator.loginScreen, (route) => false);
                            },
                            child: Container(
                                height:
                                    sizeConfigReponsive.getHeightResponsive(47),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: GlobalColors.primaryColor,
                                    borderRadius: BorderRadius.circular(
                                        sizeConfigReponsive
                                            .getWidthReposive(39))),
                                child: Center(
                                  //Đăng kí - đăng nhập:
                                  child: AppBigText(
                                    text: 'login'.tr + '/' + 'sign_up'.tr,
                                    size: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                )),
                          )
                        : Container(
                            height: sizeConfigReponsive.getHeightResponsive(47),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
