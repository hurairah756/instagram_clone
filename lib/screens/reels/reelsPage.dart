import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagramui/utils/constant_strings.dart';

import '../../utils/constant_variables.dart';
import '../../widgets/reels_item.dart';

class ReelScreen extends StatefulWidget {
  const ReelScreen({super.key});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: _firestore
              .collection(ConstantStrings.REELS_DB)
              .orderBy(ConstantStrings.TIME, descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            return Stack(
              children: [
                PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller:
                      PageController(initialPage: 0, viewportFraction: 1),
                  itemBuilder: (context, index) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ReelsItem(snapshot.data!.docs[index].data());
                  },
                  itemCount:
                      snapshot.data == null ? 0 : snapshot.data!.docs.length,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: deviceWidth * .025,
                      left: deviceWidth * .035,
                      right: deviceWidth * .03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ConstantStrings.REELS,
                        style: TextStyle(
                          fontSize: deviceHeight / 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: deviceHeight / 26,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
