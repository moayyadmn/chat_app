import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/helper/go_chat.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/community/data/models/user_data_model.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    required this.user,
    Key? key,
  }) : super(key: key);
  final UserDataModel user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(kChatRoute, parameters: {
          'otherUserId': user.id,
          'toName': user.userName,
          'toAvatar': user.photoUrl,
        });
        GoChat().goChat(user);
      },
      child: ListTile(
        minVerticalPadding: 24,
        leading: InkWell(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: kGreyColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                user.photoUrl,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.account_circle,
                    size: 50,
                    color: Colors.grey,
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: kGreenColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        title: Text(
          user.userName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
