import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramui/utils/constant_strings.dart';

class ProfileController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
}

final profileControllerProvider = Provider((ref) => ProfileController());

final firestorePostsProvider = StreamProvider((ref) {
  final controller = ref.read(profileControllerProvider);
  return controller.firebaseFirestore
      .collection(ConstantStrings.USER_POSTS)
      .where(ConstantStrings.UID,
          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
});

final tabIndexProvider = StateNotifierProvider<TabIndexNotifier, int>((ref) {
  return TabIndexNotifier();
});

class TabIndexNotifier extends StateNotifier<int> {
  TabIndexNotifier() : super(0);

  updateIndex(int index) => state = index;
}
