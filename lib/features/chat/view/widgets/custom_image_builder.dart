import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbox/features/chat/data/manager/uploader_cubit/uploader_cubit.dart';
import 'package:chatbox/features/chat/data/manager/uploader_cubit/uploader_state.dart';
import 'package:chatbox/core/utils/theme/colors.dart';

class CustomImageBuilder extends StatelessWidget {
  final String image;
  final void Function()? onClick;
  const CustomImageBuilder({
    super.key,
    required this.image,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploaderCubit, UploaderState>(
      builder: (context, state) {
        if (image.isEmpty) {
          if (state is UploaderTrigger) {
            return UploadPlaceHolder();
          } else if (state is UploaderProgress) {
            return UploadPlaceHolder();
          } else {
            return UploadPlaceHolder();
          }
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onClick,
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: kGreenColor,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class UploadPlaceHolder extends StatelessWidget {
  const UploadPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: FileImage(BlocProvider.of<UploaderCubit>(context).image),
        fit: BoxFit.cover,
      )),
      child: Center(
        child: CircularProgressIndicator(
          color: kGreenColor,
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
