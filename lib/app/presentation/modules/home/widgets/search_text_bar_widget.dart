import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home_controller.dart';

class SearchTextBarWidget extends ConsumerWidget {
  const SearchTextBarWidget({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 30),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Buscar ciudad...',
                hintStyle: TextStyle(color: Colors.white),
              ),
              controller: searchController,
            ),
          ),
          if (ref.watch(homeControllerProvider).searchBarText?.isNotEmpty ??
              false)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  searchController.text = '';
                  ref
                      .read(homeControllerProvider.notifier)
                      .updateSearchBarText(null);
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                ref
                    .read(homeControllerProvider.notifier)
                    .updateSearchBarText(searchController.text);
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
