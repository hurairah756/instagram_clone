import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramui/utils/constant_variables.dart';

import '../add_post_controller.dart';

class AddPostTextScreen extends ConsumerWidget {
  final File file;

  const AddPostTextScreen({super.key, required this.file});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addPostController = ref.watch(addPostControllerProvider);
    final isLoading =
        ref.watch(addPostControllerProvider.select((state) => state.isLoading));

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'New Post',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * .025),
              child: GestureDetector(
                onTap: () async {
                  await addPostController.sharePost(file);
                  if (!isLoading) {
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  'Share',
                  style: TextStyle(
                      color: Colors.blue, fontSize: deviceHeight / 50),
                ),
              ),
            ),
          )
        ],
        centerTitle: false,
      ),
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth * .03,
                          vertical: deviceWidth * .015),
                      child: Row(
                        children: [
                          Container(
                            width: deviceHeight / 10,
                            height: deviceHeight / 10,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              image: DecorationImage(
                                image: FileImage(file),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: deviceWidth * .03),
                          SizedBox(
                            width: deviceWidth / 1.5,
                            height: deviceHeight / 15,
                            child: TextField(
                              controller: addPostController.captionController,
                              decoration: const InputDecoration(
                                hintText: 'Write a caption...',
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.shade200),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: deviceWidth * .025),
                      child: SizedBox(
                        width: deviceWidth / 1.5,
                        height: deviceHeight / 20,
                        child: TextField(
                          controller: addPostController.locationController,
                          decoration: const InputDecoration(
                            hintText: 'Add location',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
