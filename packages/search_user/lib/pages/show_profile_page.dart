import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_user/pages/search_profile_page.dart';

import '../providers/async_current_profile.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentProfile = ref.watch(currentProfileProvider);
    print('currentProfile $currentProfile');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Profile'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SearchProfilePage()),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Center(
        child: currentProfile.when(
            data: (profile) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${profile.firstName} ${profile.lastName}',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const Divider(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Email: ${profile.email}'),
                    Text('Phone: ${profile.phoneNumber}'),
                    Text('ID: ${profile.id}'),
                  ],
                ),
              );
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
