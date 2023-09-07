import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/helper/handle_chat_members.dart';
import '../../../../core/models/user_data_model.dart';

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
        HandleChatMembers().goChat(user);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: InkWell(
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
                          color: kMainColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            title: Text(
              user.userName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
