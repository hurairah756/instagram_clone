import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagramui/utils/constant_strings.dart';
import 'package:instagramui/utils/constant_variables.dart';
import 'package:instagramui/utils/date_time.dart';
import 'package:instagramui/widgets/post_screen.dart';

import '../../widgets/custom_search_box.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final search = TextEditingController();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: deviceHeight * .02),
                  child: CustomMetaSearchBox(search: search),
                ),
              ),
              StreamBuilder(
                stream: _firebaseFirestore.collection('posts').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final snap = snapshot.data!.docs[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PostScreen(
                                screenName: ConstantStrings.EXPLORE,
                                imagePath: snap[ConstantStrings.PROFILE_IMAGE],
                                imageCover: snap[ConstantStrings.POST_IMAGE],
                                personName: snap[ConstantStrings.USERNAME],
                                postCaption: snap[ConstantStrings.CAPTION],
                                hoursAgo: formatTimeDifference(
                                    snap[ConstantStrings.TIME].toDate()),
                                isMe: false,
                              ),
                            ));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: snap[ConstantStrings.POST_IMAGE],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      childCount: snapshot.data!.docs.length,
                    ),
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      pattern: [
                        const QuiltedGridTile(2, 1),
                        const QuiltedGridTile(2, 2),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
