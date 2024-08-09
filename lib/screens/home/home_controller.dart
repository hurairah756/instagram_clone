import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramui/screens/home/widgets/custom_story_suggestion.dart';
import 'package:instagramui/screens/home/widgets/custom_threads.dart';

import '../../utils/constant_images.dart';
import '../../utils/constant_strings.dart';
import '../../widgets/custom_story_column.dart';
import '../../widgets/user_post.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController();
});

class HomeState {
  final int currentPostIndex;
  final int currentThreadIndex;
  final bool iconColor;

  HomeState({
    required this.currentPostIndex,
    required this.currentThreadIndex,
    required this.iconColor,
  });

  HomeState copyWith({
    int? currentPostIndex,
    int? currentThreadIndex,
    bool? iconColor,
  }) {
    return HomeState(
      currentPostIndex: currentPostIndex ?? this.currentPostIndex,
      currentThreadIndex: currentThreadIndex ?? this.currentThreadIndex,
      iconColor: iconColor ?? this.iconColor,
    );
  }
}

class HomeController extends StateNotifier<HomeState> {
  HomeController()
      : super(HomeState(
            currentPostIndex: 0, currentThreadIndex: 0, iconColor: false));

  void updatePostIndex(int newIndex) {
    state = state.copyWith(currentPostIndex: newIndex);
  }

  void updateThreadIndex(int newIndex) {
    state = state.copyWith(currentThreadIndex: newIndex);
  }

  void toggleIconColor() {
    state = state.copyWith(iconColor: !state.iconColor);
  }

  List<String> images = [
    ConstantImages.NATURE,
    ConstantImages.NATURE_SECOND,
    ConstantImages.NATURE_THIRD,
    ConstantImages.NATURE_FOURTH,
  ];
  List<UserPostWidget> userPosts = [
    UserPostWidget(
      imagePath: ConstantImages.CELEBRITY_6,
      personName: ConstantStrings.CELEBRITY_6_NAME,
      musicName: ConstantStrings.MUSIC_DEC_1,
      useGradientContainer: true,
      isMultipleImages: true,
      sliderImages: const [],
      isVerified: true,
    ),
    UserPostWidget(
      imagePath: ConstantImages.CELEBRITY_7,
      imageCover: ConstantImages.LEO_COVER,
      personName: ConstantStrings.CELEBRITY_7_NAME,
      useGradientContainer: true,
      isVerified: true,
    ),
    UserPostWidget(
      imagePath: ConstantImages.CELEBRITY_5,
      imageCover: ConstantImages.YILDIZ_COVER,
      personName: ConstantStrings.CELEBRITY_5_NAME,
      musicName: ConstantStrings.MUSIC_DEC_2,
    ),
  ];
  List<CustomStorySuggestion> userStorySuggestions = [
    const CustomStorySuggestion(
      profileImage: ConstantImages.PROFILE_MARIA,
      storyContent: ConstantImages.STORY_MARIA,
      personName: ConstantStrings.MARIA_MEMON_OFFICIAL,
    ),
    const CustomStorySuggestion(
      profileImage: ConstantImages.PROFILE_EZSNIPPET,
      storyContent: ConstantImages.STORY_EZSNIPPET,
      personName: ConstantStrings.EZSNIPPET,
    ),
    const CustomStorySuggestion(
      profileImage: ConstantImages.PROFILE_MASJEEVI,
      storyContent: ConstantImages.STORY_MASIJEEVI,
      personName: ConstantStrings.MASIJEEVI,
    ),
    const CustomStorySuggestion(
      profileImage: ConstantImages.PROFILE_PTI_OFFICIAL,
      storyContent: ConstantImages.STORY_PTI,
      personName: ConstantStrings.PTIOFFICIAL,
    ),
    const CustomStorySuggestion(
      profileImage: ConstantImages.PROFILE_ANDERSON,
      storyContent: ConstantImages.STORY_JIMMY,
      personName: ConstantStrings.JIMMYANDERSON,
    ),
    const CustomStorySuggestion(
      profileImage: ConstantImages.PROFILE_ARTIST,
      storyContent: ConstantImages.STORY_ARTIST,
      personName: ConstantStrings.ARTISTEASHA,
    ),
    const CustomStorySuggestion(
      profileImage: ConstantImages.PROFILE_ARYAN,
      storyContent: ConstantImages.STORY_SINGH,
      personName: ConstantStrings.ARYANSINGH,
    ),
    const CustomStorySuggestion(
      profileImage: ConstantImages.PROFILE_YILDIZ,
      storyContent: ConstantImages.STORY_YILDIZ,
      personName: ConstantStrings.YILDIZCAGRI,
    ),
    const CustomStorySuggestion(
      profileImage: ConstantImages.PROFILE_UMAIR,
      storyContent: ConstantImages.STORY_ITZ,
      personName: ConstantStrings.YILDIZCAGRI,
    )
  ];
  List<CustomStoryColumn> stories = [
    CustomStoryColumn(
      personName: ConstantStrings.CELEBRITY_1_NAME,
      personImage: ConstantImages.CELEBRITY_1,
    ),
    CustomStoryColumn(
      personName: ConstantStrings.CELEBRITY_2_NAME,
      personImage: ConstantImages.CELEBRITY_2,
    ),
    CustomStoryColumn(
      personName: ConstantStrings.CELEBRITY_3_NAME,
      personImage: ConstantImages.CELEBRITY_3,
    ),
    CustomStoryColumn(
      personName: ConstantStrings.CELEBRITY_4_NAME,
      personImage: ConstantImages.CELEBRITY_4,
    ),
    CustomStoryColumn(
      personName: ConstantStrings.CELEBRITY_5_NAME,
      personImage: ConstantImages.CELEBRITY_5,
    ),
    CustomStoryColumn(
      personName: ConstantStrings.CELEBRITY_6_NAME,
      personImage: ConstantImages.CELEBRITY_6,
    ),
    CustomStoryColumn(
      personName: ConstantStrings.CELEBRITY_7_NAME,
      personImage: ConstantImages.CELEBRITY_7,
    ),
  ];
  List<CustomThreads> threads = [
    CustomThreads(
      threadDescription: ConstantStrings.THREAD_ONE_DESC,
      personImage: ConstantImages.THE_KARAN_CHAURASYIA,
      personName: ConstantStrings.THEKARANCHAURASIYA,
    ),
    CustomThreads(
      threadDescription: ConstantStrings.THREADS_TWO_DESC,
      personName: ConstantStrings.TECHSANJEET,
      personImage: ConstantImages.TECHSAN,
      threadImageCover: ConstantImages.WINDOWS_11_COVER,
    ),
    CustomThreads(
      threadDescription: ConstantStrings.THREADS_THREE_DESC,
      personImage: ConstantImages.SUBSHMV,
      personName: ConstantStrings.SAUSHMV98,
      threadImageCover: ConstantImages.GAMBIR_COVER,
    ),
    CustomThreads(
      threadDescription: ConstantStrings.THREADS_FOUR_DESC,
      personName: ConstantStrings.HAMZATARIQ1671,
      personImage: ConstantImages.USER_EIGHT,
      threadImageCover: ConstantImages.BIG_BREAKING_COVER,
    )
  ];
}
