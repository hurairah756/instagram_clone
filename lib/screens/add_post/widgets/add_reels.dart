import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramui/screens/add_post/widgets/reels_edit.screen.dart';
import 'package:photo_manager/photo_manager.dart';

import '../add_post_controller.dart';

class AddReels extends ConsumerStatefulWidget {
  const AddReels({super.key});

  @override
  ConsumerState<AddReels> createState() => _AddReelsState();
}

class _AddReelsState extends ConsumerState<AddReels> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref
          .read(addPostControllerProvider.notifier)
          .fetchNewMedia(RequestType.video);
    });
  }

  @override
  Widget build(BuildContext context) {
    final addPostController = ref.watch(addPostControllerProvider);
    final addPostControllerNotifier =
        ref.read(addPostControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('New Reels', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: addPostController.mediaList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 250,
            crossAxisSpacing: 3,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  addPostControllerNotifier.selectMedia(index);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ReelsEditeScreen(addPostController.file!)));
                },
                child: addPostController.mediaList[index]);
          },
        ),
      ),
    );
  }
}
