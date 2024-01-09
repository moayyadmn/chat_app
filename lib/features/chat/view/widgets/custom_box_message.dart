import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
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
                icon: SvgPicture.asset(kClipChatIcon),
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
                      'text',
                    );
                    controller.clear();
                    scrollController.jumpTo(0);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    fillColor: kBorderSideColor,
                    filled: true,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: kBorderSideColor),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kBorderSideColor),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kBorderSideColor),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    hintText: 'Write your message',
                    hintStyle: const TextStyle(color: kGreyColor, fontSize: 12),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(kStickerIcon),
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
                          'text',
                        );
                        controller.clear();
                        scrollController.jumpTo(0);
                      },
                      icon: SvgPicture.asset(kSendIcon),
                    )
                  : Row(
                      children: [
                        IconButton(
                          // send an image
                          onPressed: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (image != null) {
                              File file = File(image.path);
                              Get.to(
                                ImagePreview(
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
                    ),
            ],
          );
        },
      ),
    );
  }
}

class ImagePreview extends StatelessWidget {
  final File imageFile;
  final String otherUserId;
  const ImagePreview(
      {super.key, required this.imageFile, required this.otherUserId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoView(
            imageProvider: FileImage(imageFile),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () async {
                Get.back();
                await ChatCubit().uploadImageToFirebase(imageFile, otherUserId);
              },
              icon: SvgPicture.asset(
                kSendIcon,
                height: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
