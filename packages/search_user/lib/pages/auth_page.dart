
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:search_user/pages/show_profile_page.dart';
import 'package:search_user/providers/async_auth_provider.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authenticateProvider);
    ref.listen(authenticateProvider, (previous, next) {
        final isExpired = JwtDecoder.isExpired(next.value?.accessToken ?? '');
      if (next.hasValue && !isExpired) {
        // print('hasValue ${isExpired} ${next.value?.accessToken}');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const ProfilePage()),
        );
      }
    });
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('auth page'),
      // ),
      body: Center(
          child: auth.when(
        data: (data) => const Center(
          child: Text('success'),
        ),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("error"),
              const SizedBox(),
              Text(err.toString()),
              Text(stack.toString())
            ],
          ),
        ),
        loading: () => const CircularProgressIndicator(),
      )),
    );
  }
}
