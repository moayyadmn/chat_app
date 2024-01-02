import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/chat/data/manager/chat_cubit/chat_cubit.dart';
import 'package:scholarchat_app/features/chat/data/manager/send_button_bloc/send_button_bloc.dart';
import 'package:scholarchat_app/features/chat/data/manager/send_button_bloc/send_button_event.dart';
import 'package:scholarchat_app/features/chat/data/manager/send_button_bloc/send_button_state.dart';

class CustomBoxMessage extends StatelessWidget {
  const CustomBoxMessage({
    super.key,
    required this.otherUid,
    required this.scrollController,
  });
  final String otherUid;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return SizedBox(
      height: 90,
      child: BlocBuilder<SendButtonBloc, SendButtonState>(
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/svg/clip_chat.svg'),
              ),
              Expanded(
                child: TextField(
                  style: const TextStyle(color: kBlackColor, fontSize: 16),
                  onChanged: (value) {
                    if (value.length > 1) {
                      state.isSend = true;
                      context.read<SendButtonBloc>().add(SendButtonEvent());
                    } else if (value.isEmpty) {
                      state.isSend = false;
                      context.read<SendButtonBloc>().add(SendButtonEvent());
                    }
                  },
                  controller: controller,
                  onSubmitted: (data) {
                    BlocProvider.of<ChatCubit>(context).sendMessage(
                      otherUid,
                      data,
                    );
                    controller.clear();
                    scrollController.jumpTo(0);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    fillColor: const Color(0xFFF3F6F6),
                    filled: true,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFF3F6F6)),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFF3F6F6)),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFF3F6F6)),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    hintText: 'Write your message',
                    hintStyle: const TextStyle(color: kGreyColor, fontSize: 12),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/svg/sticker.svg'),
                    ),
                  ),
                ),
              ),
              state.isSend
                  ? IconButton(
                      onPressed: () {
                        BlocProvider.of<ChatCubit>(context).sendMessage(
                          otherUid,
                          controller.text,
                        );
                        controller.clear();
                        scrollController.jumpTo(0);
                      },
                      icon: SvgPicture.asset('assets/svg/send_icon.svg'),
                    )
                  : Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/svg/camera.svg',
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/svg/microphone.svg'),
                        ),
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }
}
