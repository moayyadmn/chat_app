import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/helper/pick_image.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/features/chat/data/manager/chat_cubit/chat_cubit.dart';
import 'package:scholarchat_app/features/chat/data/manager/send_button_bloc/send_button_bloc.dart';
import 'package:scholarchat_app/features/chat/data/manager/send_button_bloc/send_button_event.dart';
import 'package:scholarchat_app/features/chat/data/manager/send_button_bloc/send_button_state.dart';
import 'image_preview.dart';

class DynamicButtons extends StatelessWidget {
  final String otherUid;
  final TextEditingController textEditingController;
  final ScrollController scrollController;

  const DynamicButtons(
      {super.key,
      required this.otherUid,
      required this.textEditingController,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendButtonBloc, SendButtonState>(
      builder: (context, state) {
        return state.isSend
            ? IconButton(
                onPressed: () {
                  BlocProvider.of<ChatCubit>(context).sendMessage(
                    otherUid,
                    textEditingController.text,
                  );
                  textEditingController.clear();

                  scrollController.onAttach != null
                      ? scrollController.jumpTo(0)
                      : null;
                  context.read<SendButtonBloc>().add(SendButtonEvent(false));
                },
                icon: SvgPicture.asset(kSendIcon),
              )
            : Row(
                children: [
                  IconButton(
                    // send an image
                    onPressed: () async {
                      File? file = await PickImage().pickImage();
                      if (file != null) {
                        Get.to(
                          () => ImagePreview(
                            imageFile: file,
                            otherUserId: otherUid,
                          ),
                        );
                      }
                    },
                    icon: SvgPicture.asset(kCameraIcon),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(kMicrophoneIcon),
                  ),
                ],
              );
      },
    );
  }
}
