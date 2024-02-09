import '../providers/async_current_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/async_search_provider.dart';
import '../widgets/user_detail.dart';

class SearchResultPage extends ConsumerWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentProfile = ref.watch(currentProfileProvider);
    final result = ref.watch(asyncSearchProvider.notifier).getSelectedProfile();

    print('==== currentProfile $result');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Result'),
      ),
      body: Center(
        child: currentProfile.when(
            data: (profile) {
              return UserDetailWidget(userDetail: result);
            },
            error: (error, stackTrace) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(error.toString()),
                  const SizedBox(
                    height: 20,
                  ),
                  // Text(stackTrace.toString()),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
