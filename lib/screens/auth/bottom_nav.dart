import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constant_images.dart';
import '../../utils/constant_variables.dart';
import '../add_post/add_post_screen.dart';
import '../explore/search_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';
import '../reels/reelsPage.dart';
import 'auth_controller.dart';

class BottomTabs extends ConsumerWidget {
  const BottomTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);
    final authControllerNotifier = ref.read(authControllerProvider.notifier);

    final List<Widget> pages = [
      const HomePageWidget(),
      const SearchPage(),
      const AddPostScreen(),
      const ReelScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pages[authController.selectedIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: deviceHeight / 16,
        decoration: BoxDecoration(
          color: authController.selectedIndex == 3
              ? Colors.black.withOpacity(0.9)
              : Colors.white,
          border: Border(
            top: BorderSide(
                color: authController.selectedIndex == 3
                    ? Colors.grey.shade100
                    : Colors.grey.shade200,
                width: authController.selectedIndex == 3 ? 0.2 : 1),
            bottom: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(
              icon: ConstantSvgs.IC_HOME_OUTLINED,
              selectedIcon: ConstantSvgs.IC_HOME_FILLED,
              index: 0,
              authController: authController,
              authControllerNotifier: authControllerNotifier,
            ),
            buildNavItem(
              icon: ConstantSvgs.IC_SEARCH_OUTLINE,
              selectedIcon: ConstantSvgs.IC_SEARCH_OUTLINE_BORDER,
              index: 1,
              authController: authController,
              authControllerNotifier: authControllerNotifier,
            ),
            buildNavItem(
              icon: ConstantSvgs.IC_SQUARE_OUTLINE,
              selectedIcon: ConstantSvgs.IC_SQUARE_BOLD,
              index: 2,
              authController: authController,
              authControllerNotifier: authControllerNotifier,
            ),
            buildNavItem(
              icon: ConstantSvgs.IC_REELS_OUTLINE,
              selectedIcon: ConstantSvgs.IC_REELS_BOLD,
              index: 3,
              authController: authController,
              authControllerNotifier: authControllerNotifier,
            ),
            buildProfileItem(
              index: 4,
              authController: authController,
              authControllerNotifier: authControllerNotifier,
            ),
          ],
        ),
      ),
    );
  }

  InkWell buildNavItem({
    required String icon,
    required String selectedIcon,
    required int index,
    required AuthController authController,
    required AuthController authControllerNotifier,
  }) {
    return InkWell(
      onTap: () => authControllerNotifier.selectedIndex = index,
      child: SizedBox(
        width: deviceHeight / 31,
        height: deviceHeight / 31,
        child: SvgPicture.asset(
          authController.selectedIndex == index ? selectedIcon : icon,
          color:
              authController.selectedIndex == 3 ? Colors.white : Colors.black,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  InkWell buildProfileItem({
    required int index,
    required AuthController authController,
    required AuthController authControllerNotifier,
  }) {
    return InkWell(
      onTap: () => authControllerNotifier.selectedIndex = index,
      child: CircleAvatar(
        radius: deviceHeight / 60,
        backgroundImage: const AssetImage(ConstantImages.MY_PROFILE),
      ),
    );
  }
}
