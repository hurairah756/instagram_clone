import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramui/screens/add_post/widgets/add_post.dart';
import 'package:instagramui/screens/add_post/widgets/add_reels.dart';
import 'package:instagramui/utils/constant_variables.dart';

import 'add_post_controller.dart';

class AddPostScreen extends ConsumerWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addPostController = ref.watch(addPostControllerProvider);
    final addPostControllerNotifier =
        ref.read(addPostControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: addPostController.pageController,
              onPageChanged: addPostControllerNotifier.onPageChanged,
              children: const [
                AddPost(),
                AddReels(),
              ],
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              bottom: deviceHeight * .015,
              right: addPostController.currentIndex == 0
                  ? deviceWidth * .25
                  : deviceWidth * .3,
              child: Container(
                width: deviceWidth / 2.5,
                height: deviceHeight / 20,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          addPostControllerNotifier.navigationTapped(0),
                      child: Text(
                        'Post',
                        style: TextStyle(
                          fontSize: deviceHeight / 50,
                          fontWeight: FontWeight.w500,
                          color: addPostController.currentIndex == 0
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          addPostControllerNotifier.navigationTapped(1),
                      child: Text(
                        'Reels',
                        style: TextStyle(
                          fontSize: deviceHeight / 50,
                          fontWeight: FontWeight.w500,
                          color: addPostController.currentIndex == 1
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
