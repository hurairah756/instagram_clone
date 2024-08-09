import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/constant_variables.dart';
import '../add_post_controller.dart';
import 'custom_botton.dart';

class ReelsEditeScreen extends ConsumerStatefulWidget {
  final File videoFile;
  const ReelsEditeScreen(this.videoFile, {super.key});

  @override
  ConsumerState<ReelsEditeScreen> createState() => _ReelsEditeScreenState();
}

class _ReelsEditeScreenState extends ConsumerState<ReelsEditeScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {});
        controller.setLooping(true);
        controller.setVolume(1.0);
        controller.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addPostController = ref.watch(addPostControllerProvider);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: false,
        title: const Text(
          'New Reels',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: addPostController.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.black,
                ))
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: deviceWidth / 40),
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Column(
                      children: [
                        SizedBox(height: deviceHeight / 50),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: deviceWidth / 10),
                          child: SizedBox(
                              width: deviceWidth / 1,
                              height: deviceHeight / 1.8,
                              child: controller.value.isInitialized
                                  ? AspectRatio(
                                      aspectRatio: controller.value.aspectRatio,
                                      child: VideoPlayer(controller),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator())),
                        ),
                        SizedBox(height: deviceHeight * .025),
                        SizedBox(
                          height: deviceHeight / 12,
                          width: deviceWidth / 1.35,
                          child: TextField(
                            controller: addPostController.captionController,
                            maxLines: 10,
                            decoration: const InputDecoration(
                              hintText: 'Write a caption ...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Divider(),
                        SizedBox(height: deviceHeight * .025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomButton(
                              name: 'Save draft',
                              color: false,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await addPostController
                                    .shareReels(widget.videoFile);
                                Navigator.of(context).pop();
                              },
                              child: const CustomButton(
                                name: 'Share',
                                color: true,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
