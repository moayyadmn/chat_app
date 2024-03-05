import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/features/chat/data/manager/uploader_cubit/uploader_cubit.dart';

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
                BlocProvider.of<UploaderCubit>(context)
                    .uploadImageToFirebase(imageFile, otherUserId);
                // await ChatCubit().uploadImageToFirebase(imageFile, otherUserId);
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
