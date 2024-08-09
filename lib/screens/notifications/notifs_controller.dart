import 'package:instagramui/screens/notifications/widgets/custom_notifications.dart';
import 'package:instagramui/screens/notifications/widgets/custom_suggestions.dart';

import '../../utils/constant_images.dart';
import '../../utils/constant_strings.dart';

class NotifsController {
  final List<CustomSuggestion> suggestions = [
    CustomSuggestion(
      personName: ConstantStrings.SAIF_ULLAH,
      personImage: ConstantImages.SAIF,
      personUserName: ConstantStrings.SAIF6588ULLAH,
      followingPersonsName: ConstantStrings.FOLLOWED_BY_ISAYF,
      followedByPersonImage: ConstantImages.CELEBRITY_7,
    ),
    CustomSuggestion(
      personName: ConstantStrings.UMAIR_MUGHAL,
      personImage: ConstantImages.UMAIR_MUGHAL,
      personUserName: ConstantStrings.UMAIRMUGHAL2222,
      followingPersonsName: ConstantStrings.FOLLOWED_BY_ITX_JOKER,
      isMoreThanTwo: true,
    ),
    CustomSuggestion(
      personName: ConstantStrings.OSAMA_HAMEED,
      personImage: ConstantImages.USAMA,
      personUserName: ConstantStrings.I_M_OSAMA1021,
      followingPersonsName: ConstantStrings.FOLLOWED_BY_OMERFAROOQ1211,
      isMoreThanTwo: true,
    ),
    CustomSuggestion(
      personName: ConstantStrings.NAUMAN,
      personImage: ConstantImages.NAUMAN,
      personUserName: ConstantStrings.NAUMANSADIQQ,
      followingPersonsName: ConstantStrings.FOLLOWED_BY_USAMA_SULTAN,
      isMoreThanTwo: true,
    ),
    CustomSuggestion(
      personName: ConstantStrings.ZOHAZOYA,
      personImage: ConstantImages.ZOYA,
      personUserName: ConstantStrings.ZOHAZOYA07,
    ),
  ];

  final List<CustomNotification> notificationsOlder = [
    CustomNotification(
      profileImage: ConstantImages.USER_TWO,
      postId: ConstantStrings.DESICUZZIE,
      postDesc: ConstantStrings.WHO_YOU_MIGHT_KNOW,
      postTime: ConstantStrings.WEEKS4,
      isButton: true,
    ),
    CustomNotification(
      profileImage: ConstantImages.SPORTS,
      postId: ConstantStrings.SPORTSKEEDACRICKET,
      postDesc: ConstantStrings.POSTED_A_THREAD_YOU_MIGHT_LIKE,
      postTime: ConstantStrings.MORE4W,
      isVerified: true,
    ),
    // SizedBox(height: deviceHeight * .02),
    CustomNotification(
      profileImage: ConstantImages.MADDI,
      postId: ConstantStrings.INOXENTMAADI,
      postDesc: ConstantStrings.STARTED_FOLLOWING_YOU,
      postTime: ConstantStrings.WEEKS11,
      isFollowing: true,
    ),
  ];

  final List<CustomNotification> notificationsLastThirtyDays = [
    CustomNotification(
      profileImage: ConstantImages.USER_SEVEN,
      postId: ConstantStrings.RIMSHAMALIK1936,
      postDesc: ConstantStrings.WHO_YOU_MIGHT_KNOW,
      postTime: ConstantStrings.DAYS6,
      isButton: true,
    ),
    CustomNotification(
      postDesc: ConstantStrings.REVIEW_AND_MANAGE_WHICH_ACCOUNTS,
      postTime: ConstantStrings.WEEKS1,
      isOfficial: true,
    ),
    CustomNotification(
      profileImage: ConstantImages.ALLAH,
      postId: ConstantStrings.RAHENIJAAT,
      postDesc: ConstantStrings.AND_22_OTHERS,
      postTime: ConstantStrings.WEEKS1,
    ),
    CustomNotification(
      profileImage: ConstantImages.THREADS_CIRCLE,
      postDesc: ConstantStrings.ITS_BEEN_YEAR,
      postTime: ConstantStrings.MORE_1W,
    ),
    CustomNotification(
      profileImage: ConstantImages.USER_NINE,
      postId: ConstantStrings.USAMA02SHAKEEL,
      postDesc: ConstantStrings.STARTED_FOLLOWING_YOU,
      postTime: ConstantStrings.WEEKS1,
      isFollowing: true,
    ),
    CustomNotification(
      profileImage: ConstantImages.USER_EIGHT,
      postId: ConstantStrings.HAMZATARIQ1671,
      postDesc: ConstantStrings.BREAKING_NEWS_POSTED_THREAD,
      postTime: ConstantStrings.MORE4W,
    ),
    CustomNotification(
      profileImage: ConstantImages.USER_TEN,
      postId: ConstantStrings.JIYAMALIK,
      postDesc: ConstantStrings.POSTED_A_THREAD_SEPARATE,
      postTime: ConstantStrings.WEEKS2,
    ),
    CustomNotification(
      profileImage: ConstantImages.USER_SIX,
      postId: ConstantStrings.SAAD75855,
      postDesc: ConstantStrings.STARTED_FOLLOWING_YOU,
      postTime: ConstantStrings.WEEKS2,
      isFollowing: true,
    ),
    CustomNotification(
      profileImage: ConstantImages.USER_FIVE,
      contentImage: ConstantImages.MASTER_COVER,
      postDesc: ConstantStrings.HAVE_ANOTHER_LOOK,
      postBottomId: ConstantStrings.JOSEPHPARTRICDANIELS,
      postTime: ConstantStrings.WEEKS3,
      isContent: true,
    ),
    CustomNotification(
      profileImage: ConstantImages.USER_FOUR,
      postId: ConstantStrings.SARAHDOSES,
      postDesc: ConstantStrings.POSTED_A_THREAD_YOUNG_PEOPLE,
      postTime: ConstantStrings.MORE3W,
    ),
    CustomNotification(
      profileImage: ConstantImages.USER_THREE,
      postId: ConstantStrings.OAD3398,
      postDesc: ConstantStrings.STARTED_FOLLOWING_YOU,
      postTime: ConstantStrings.WEEKS3,
      isRequested: true,
      isButton: true,
    ),
    CustomNotification(
      postId: ConstantStrings.RUMIVERSES,
      postDesc: ConstantStrings.AND_1_OTHER_INVITED,
      postTime: ConstantStrings.WEEKS3,
      isInvited: true,
    ),
    CustomNotification(
      profileImage: ConstantImages.MOHSAN,
      postId: ConstantStrings.MOHSAN6747,
      postDesc: ConstantStrings.WHO_YOU_MIGHT_KNOW,
      postTime: ConstantStrings.WEEKS3,
      isButton: true,
    ),
    CustomNotification(
      profileImage: ConstantImages.PETER_JAY,
      postId: ConstantStrings.PETERJAY2,
      postDesc: ConstantStrings.WHO_YOU_MIGHT_KNOW,
      postTime: ConstantStrings.WEEKS3,
      isButton: true,
    ),
    CustomNotification(
      profileImage: ConstantImages.ZAHRA_HAMEED,
      postId: ConstantStrings.ZAHRA_HAMEED,
      postDesc: ConstantStrings.POSTED_THREAD_BOTANIST,
      postTime: ConstantStrings.MORE3W,
    ),
    CustomNotification(
      profileImage: ConstantImages.KIM_JIMI,
      postId: ConstantStrings.KIMJIMI8,
      postDesc: ConstantStrings.WHO_YOU_MIGHT_KNOW,
      postTime: ConstantStrings.WEEKS3,
      isButton: true,
    ),
    CustomNotification(
      profileImage: ConstantImages.ATIF_ALI,
      postId: ConstantStrings.ATIFALI83072024,
      postDesc: ConstantStrings.STARTED_FOLLOWING_YOU,
      postTime: ConstantStrings.WEEKS3,
      isFollowing: true,
    ),
    CustomNotification(
      profileImage: ConstantImages.USER_ONE,
      postId: ConstantStrings.FEMALECRICKET,
      postDesc: ConstantStrings.POSTED_A_THREAD_CAPTION,
      postTime: ConstantStrings.MORE4W,
      isVerified: true,
    ),
  ];
  final List<CustomNotification> notificationsRecent = [
    CustomNotification(
      profileImage: ConstantImages.ACCELERAA,
      postId: ConstantStrings.ACCELERAMEDIA,
      postDesc: ConstantStrings.POSTED_A_THREAD_LOOKING_TO_CONNECT,
      postTime: ConstantStrings.MORE1D,
    ),
    CustomNotification(
      profileImage: ConstantImages.CURIOSITY_STREAM,
      contentImage: ConstantImages.CURIOSITY_COVER,
      postDesc: ConstantStrings.HAVE_ANOTHER_LOOK_AT_YOU_EXPLORED,
      postBottomId: ConstantStrings.CURIOSITYSTREAM,
      postTime: ConstantStrings.DAYS3,
      isStory: true,
      isContent: true,
    ),
    CustomNotification(
      profileImage: ConstantImages.CELEBRITY_7,
      postId: ConstantStrings.CODEWITHMADDY,
      postDesc: ConstantStrings.POSTED_A_THREAD_YOU_WAKE_UP,
      postTime: ConstantStrings.DAYS3,
    ),
  ];
}
