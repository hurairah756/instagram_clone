import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../api/firestore.dart';
import '../../api/storage.dart';
import '../../utils/constant_variables.dart';

final addPostControllerProvider =
    ChangeNotifierProvider<AddPostController>((ref) {
  return AddPostController();
});

class AddPostController extends ChangeNotifier {
  AddPostController() {
    pageController = PageController();
  }

  late PageController pageController;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  // Add post and Add reels screen
  List<Widget> _mediaList = [];
  List<File> path = [];
  File? _file;
  int currentPage = 0;
  int? lastPage;
  int indexx = 0;

  List<Widget> get mediaList => _mediaList;
  File? get file => _file;
  int get currentPageIndex => currentPage;
  int? get lastPageIndex => lastPage;
  int get selectedIndex => indexx;

  // Add post text screen
  final TextEditingController captionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> sharePost(File file) async {
    setLoading(true);
    String postUrl = await StorageMethod().uploadImageToStorage('post', file);
    await Firebase_Firestore().CreatePost(
      postImage: postUrl,
      caption: captionController.text,
      location: locationController.text,
    );
    setLoading(false);
  }

  Future<void> shareReels(File videoFile) async {
    setLoading(true);
    String reelsUrl =
        await StorageMethod().uploadImageToStorage('Reels', videoFile);
    await Firebase_Firestore().CreatReels(
      video: reelsUrl,
      caption: captionController.text,
    );
    setLoading(false);
  }

  Future<void> fetchNewMedia(RequestType type) async {
    lastPage = currentPage;
    await _resetState();
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      List<AssetPathEntity> album =
          await PhotoManager.getAssetPathList(type: type);
      List<AssetEntity> media =
          await album[0].getAssetListPaged(page: currentPage, size: 60);

      for (var asset in media) {
        if ((asset.type == AssetType.image && type == RequestType.image) ||
            (asset.type == AssetType.video && type == RequestType.video)) {
          final file = await asset.file;
          if (file != null) {
            path.add(File(file.path));
            _file = path[0];
          }
        }
      }

      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
          FutureBuilder(
            future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.memory(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (asset.type == AssetType.video &&
                        type == RequestType.video)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: deviceHeight * .005,
                              right: deviceWidth * .005),
                          child: SizedBox(
                            width: deviceWidth * .08,
                            height: deviceWidth * .05,
                            child: Text(
                              '${asset.videoDuration.inMinutes.toString()}:${asset.videoDuration.inSeconds.toString()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        );
      }

      _mediaList.addAll(temp);
      currentPage++;
      notifyListeners();
    }
  }

  void selectMedia(int index) {
    indexx = index;
    _file = path[index];
    notifyListeners();
  }

  _resetState() {
    _mediaList = [];
    path = [];
    _file = null;
    currentPage = 0;
    lastPage = null;
    indexx = 0;
    notifyListeners();
  }

  void onPageChanged(int page) {
    _currentIndex = page;
    notifyListeners();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
    onPageChanged(page);
  }

  @override
  void dispose() {
    pageController.dispose();
    captionController.dispose();
    locationController.dispose();
    super.dispose();
  }
}
