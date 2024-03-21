import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/res/components/favoriteViewComponents/no_favorite_item_ui.dart';
import 'package:lms/viewmodel/controller/favorite/favorite_viewmodel.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    super.initState();
    favoriteViewModel.getTheFavoriteList();
  }

  final favoriteViewModel = Get.put(FavoriteViewModel());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: favoriteViewModel.favoriteList.length,
          itemBuilder: (context, index) {
            var data = favoriteViewModel.favoriteList[index];
            if (data == [] || data == null) {
              return const NoFavoriteItemUi();
            } else {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          data,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          favoriteViewModel.removeFavoriteItem(context, data);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
