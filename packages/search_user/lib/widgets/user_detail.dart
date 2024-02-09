import 'package:flutter/material.dart';

import '../models/selected_user.dart';

class UserDetailWidget extends StatelessWidget {
  final SelectedUser userDetail;

  const UserDetailWidget({
    required this.userDetail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${userDetail.firstName} ${userDetail.lastName}',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Divider(
            height: 20.0,
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Email: ${userDetail.email}'),
          Text('Phone: ${userDetail.phoneNumber}'),
          Text('ID: ${userDetail.id}'),
        ],
      ),
    );
  }
}
