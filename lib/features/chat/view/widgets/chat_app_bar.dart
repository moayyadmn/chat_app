import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:chatbox/core/utils/theme/colors.dart';
import 'package:chatbox/features/chat/data/manager/select_in_list/select_in_list_bloc.dart';
import 'package:chatbox/features/chat/data/manager/select_in_list/select_in_list_event.dart';
import 'package:chatbox/features/chat/data/manager/select_in_list/select_in_list_state.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.photo,
      required this.userName,
      required this.otherId});
  final String photo;
  final String userName;
  final String otherId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectInListBloc, SelectInListState>(
      listener: (context, state) {
        if (state is StartDeleting) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        } else if (state is EndDeleting) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        SelectInListBloc ctx = context.read<SelectInListBloc>();
        return ctx.selectedMessageList.isNotEmpty
            ? AppBar(
                leading: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      ctx.selectedMessageList.clear();
                      ctx.add(EndSelectMode());
                    },
                    icon: Icon(Icons.cancel_outlined)),
                actions: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      ctx.deleteMessages(ctx.selectedMessageList, otherId);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              )
            : AppBar(
                leadingWidth: 60,
                leading: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Get.back();
                    },
                    icon: Row(
                      children: [
                        Icon(Icons.arrow_back),
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: CachedNetworkImageProvider(photo),
                        ),
                      ],
                    )),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      "Active now",
                      style: TextStyle(color: kGreyColor, fontSize: 12),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/svg/default_call.svg",
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.secondary,
                          BlendMode.srcIn),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/svg/video_call.svg",
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.secondary,
                          BlendMode.srcIn),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
