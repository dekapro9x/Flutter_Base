import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:app_base_flutter/configs/global_size_responsive_configs.dart';
import 'package:app_base_flutter/common/log_utils.dart';
import 'package:app_base_flutter/configs/get_it/get_it.dart';
import 'package:app_base_flutter/configs/storages/app_prefs.dart';
import 'package:app_base_flutter/routers/route_generator.dart';
class BottomNavigation extends StatefulWidget {
  final int? tabIndex;
  const BottomNavigation({
    super.key,
    this.tabIndex,
  });

  static MultiBlocProvider providers({int? tabIndex}) {
    return MultiBlocProvider(
      providers: [
     
      ],
      child: BottomNavigation(
        tabIndex: tabIndex,
      ),
    );
  }

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late PersistentTabController controller;
  final _appPrefs = getIt<AppPrefStorage>();
  bool hasLogged = false;
  int unreadCount = 0;
  int indexTabBottomActive = 0;
  bool isHideNavigationBar = false;

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: widget.tabIndex ?? 0);
    controller.addListener(onChangeMenuTabBottomIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  //Thay đổi menu active:
  Future<void> onChangeMenuTabBottomIndex() async {
    logWithColor('Chỉ số tab hiện tại: ${controller.index}', red);
    switch (controller.index) {
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      default:
    }
    setState(() {
      indexTabBottomActive = controller.index;
    });
  }

  Widget dialogRequireNeedUpdateInformations(BuildContext context) {
    return AlertDialog(
      title: Text("notification".tr),
      content: const Text(
          "Vui lòng thêm thông tin tiền sử bệnh trong mục: Thông tin cá nhân"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                "late".tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(RouteGenerator.editProfile);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                "update_profile".tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  //Danh sách màn hình active theo Bottom tab:
  List<Widget> buildScreen() {
    return [
      HomeScreen.providers(),
    ];
  }

  List<PersistentBottomNavBarItem> buildCustomListItemBottomTab() {
    return [
      //Trang chủ:
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          GlobalImages.homeSelected,
        ),
        title: 'Home'.tr,
        activeColorPrimary: GlobalColors.primaryColor,
        inactiveIcon: SvgPicture.asset(
          GlobalImages.home,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    bool shouldHideBottomNav = true;
    SizeConfigResponsiveApp sizeConfigReponsive =
        SizeConfigResponsiveApp(context);
    return Visibility(
      visible: shouldHideBottomNav,
      child: PersistentTabView(
        controller: controller,
        context,
        navBarHeight: sizeConfigReponsive.getWidthReposive(60),
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
        screens: buildScreen(),
        items: buildCustomListItemBottomTab(),
        onItemSelected: (int indexBottomTabSelect) => {
          logWithColor("Item bottom tab select: $indexBottomTabSelect", red)
        },
        backgroundColor: Colors.white,
        decoration: const NavBarDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 5,
              offset: Offset(0, -2),
              spreadRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        navBarStyle: NavBarStyle.style3,
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        isVisible: isHideNavigationBar,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(),
        ),
      ),
    );
  }
}
