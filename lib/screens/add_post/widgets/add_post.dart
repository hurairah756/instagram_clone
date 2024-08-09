import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../utils/constant_variables.dart';
import '../add_post_controller.dart';
import 'add_post_text_screen.dart';

class AddPost extends ConsumerStatefulWidget {
  const AddPost({super.key});

  @override
  ConsumerState<AddPost> createState() => _AddPostState();
}

class _AddPostState extends ConsumerState<AddPost> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref
          .read(addPostControllerProvider.notifier)
          .fetchNewMedia(RequestType.image);
    });
  }

  @override
  Widget build(BuildContext context) {
    final addPostController = ref.watch(addPostControllerProvider);
    final addPostControllerNotifier =
        ref.read(addPostControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: Icon(Icons.clear, size: deviceHeight / 20),
        title: Text(
          'New Post',
          style: TextStyle(color: Colors.black, fontSize: deviceHeight / 35),
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * .03),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        AddPostTextScreen(file: addPostController.file!))),
                child: Text(
                  'Next',
                  style: TextStyle(
                      fontSize: deviceHeight / 50,
                      color: Colors.blue.shade800,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: deviceHeight * .05),
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight / 2,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                    ),
                    itemCount: addPostController.mediaList.isEmpty
                        ? addPostController.mediaList.length
                        : 1,
                    itemBuilder: (context, index) {
                      return addPostController
                          .mediaList[addPostController.selectedIndex];
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: deviceWidth * .025),
                    Text(
                      'Recents',
                      style: TextStyle(
                          fontSize: deviceHeight / 45,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded,
                        size: deviceHeight / 30),
                    const Spacer(),
                    Container(
                      width: deviceWidth / 2.7,
                      height: deviceHeight / 25,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(deviceHeight / 40),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.copy_rounded, size: deviceHeight / 45),
                          SizedBox(width: deviceWidth * .01),
                          Text(
                            'SELECT MULTIPLE',
                            style: TextStyle(fontSize: deviceHeight / 70),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: deviceWidth * .025),
                    Container(
                      width: deviceHeight / 25,
                      height: deviceHeight / 25,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Icon(Icons.camera_alt_outlined,
                          size: deviceHeight / 45),
                    ),
                    SizedBox(width: deviceWidth * .025),
                  ],
                ),
                SizedBox(height: deviceHeight * .015),
                SizedBox(
                  height: deviceHeight / 1.5,
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: addPostController.mediaList.length,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 2,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () =>
                                addPostControllerNotifier.selectMedia(index),
                            child: addPostController.mediaList[index]);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
