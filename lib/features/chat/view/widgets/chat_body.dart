import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/utils/firebase_ref.dart';
import 'package:scholarchat_app/features/chat/data/manager/chat_cubit/chat_cubit.dart';
import 'package:scholarchat_app/features/chat/data/manager/chat_cubit/chat_state.dart';
import 'package:scholarchat_app/features/chat/data/manager/select_in_list/select_in_list_bloc.dart';
import 'package:scholarchat_app/features/chat/data/manager/select_in_list/select_in_list_state.dart';
import 'package:scholarchat_app/features/chat/view/widgets/chat_bubble.dart';
import 'package:scholarchat_app/features/chat/view/widgets/selectable_message.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is ChatSuccess) {
          if (state.messageList.isNotEmpty) {
            return BlocBuilder<SelectInListBloc, SelectInListState>(
              builder: (context, selectState) {
                return Flexible(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      reverse: true,
                      controller: scrollController,
                      itemCount: state.messageList.length,
                      itemBuilder: (context, index) {
                        var message = state.messageList[index];
                        var isSelected = context
                            .read<SelectInListBloc>()
                            .selectedMessageList
                            .contains(message);
                        return message.email == currentUser!.email!
                            ? SelectableMessage(
                                message: message,
                                bubble: ChatBubbleWidget(
                                  message: message,
                                  isSelected: isSelected,
                                ),
                              )
                            : SelectableMessage(
                                message: message,
                                bubble: ChatBubbleWidgetForFriend(
                                  message: message,
                                  isSelected: isSelected,
                                ));
                      }),
                );
              },
            );
          } else {
            return Expanded(
              child: const Center(
                child: Text("you don`t have messages"),
              ),
            );
          }
        } else {
          return Expanded(
            child: const Center(
              child: Text("sorry, please try again at a different time"),
            ),
          );
        }
      },
    );
  }
}
