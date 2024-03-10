import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/chat/data/manager/select_in_list/select_in_list_bloc.dart';
import 'package:scholarchat_app/features/chat/data/manager/select_in_list/select_in_list_event.dart';
import 'package:scholarchat_app/features/chat/data/manager/select_in_list/select_in_list_state.dart';
import 'package:scholarchat_app/features/chat/data/models/message_model.dart';



class SelectableMessage extends StatelessWidget {
  const SelectableMessage(
      {super.key, required this.message, required this.bubble});
  final MessageModel message;
  final Widget bubble;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectInListBloc, SelectInListState>(
      builder: (context, state) {
        SelectInListBloc ctx = context.read<SelectInListBloc>();
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            if (state is StartSelectState &&
                ctx.selectedMessageList.isNotEmpty) {
              ctx.add(StartSelectMode(messageModel: message));
            } else if (state is StartSelectState &&
                ctx.selectedMessageList.isEmpty) {
              ctx.selectedMessageList.clear();
              ctx.add(EndSelectMode());
            }
          },
          onLongPress: () {
            ctx.add(StartSelectMode(messageModel: message));
          },
          child: Stack(
            children: [
              bubble,
              Positioned.fill(
                  bottom: 13,
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ctx.selectedMessageList.contains(message)
                          ? kGreenColor.withOpacity(.2)
                          : Colors.transparent,
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
