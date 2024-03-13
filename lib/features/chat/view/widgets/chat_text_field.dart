import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/chat/data/manager/send_button_bloc/send_button_bloc.dart';
import 'package:scholarchat_app/features/chat/data/manager/send_button_bloc/send_button_event.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField(
    this.textEditingController, {
    super.key,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: textEditingController,
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary, fontSize: 16),
        onChanged: (value) {
          if (value.isNotEmpty) {
            context.read<SendButtonBloc>().add(SendButtonEvent(true));
          } else if (value.isEmpty) {
            context.read<SendButtonBloc>().add(SendButtonEvent(false));
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          fillColor: Theme.of(context).colorScheme.onPrimary,
          filled: true,
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onPrimary),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onPrimary),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onPrimary),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          hintText: 'Write your message',
          hintStyle: const TextStyle(color: kGreyColor, fontSize: 12),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(kStickerIcon),
          ),
        ),
      ),
    );
  }
}
