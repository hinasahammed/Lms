import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/res/components/favoriteViewComponents/no_favorite_item_ui.dart';
import 'package:lms/res/components/commonWidget/shimmer_list_ui.dart';
import 'package:lms/viewmodel/controller/favorite/favorite_viewmodel.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Get.put(FavoriteViewModel());
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("user")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("favorites")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const ShimmerList());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const NoFavoriteItemUi();
          } else {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              shrinkWrap: true,
              children: snapshot.data!.docs.map((courseData) {
                Map<String, dynamic> data = courseData.data();
                return InkWell(
                  onTap: () {
                    favoriteViewModel.toCourseDetails(data);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              width: Get.width * .2,
                              height: Get.height * .1,
                              imageUrl: courseData['imageurl'],
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.black.withOpacity(0.2),
                                highlightColor: Colors.white54,
                                enabled: true,
                                child: Container(
                                  width: Get.width * .2,
                                  height: Get.height * .1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width * .49,
                                child: Text(
                                  courseData['courseTitle'],
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: theme.colorScheme.onBackground,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  favoriteViewModel.deleteFavorite(
                                    courseData['courseTitle'],
                                    context,
                                  );
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: theme.colorScheme.error,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
