import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/constants.dart';
import '../core/blocs/app_root_bloc/app_root_bloc.dart';
import '../core/blocs/app_root_bloc/app_root_event.dart';
import '../core/blocs/app_root_bloc/app_root_state.dart';
import '../core/helper/app_screens.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return BlocBuilder<AppRootBloc, AppRootState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Chaty'),
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (value) {
              state.index = value;
              context.read<AppRootBloc>().add(AppRootEvent());
            },
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: kMainColor,
            onTap: (value) {
              state.index = value;
              pageController.animateToPage(state.index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
              context.read<AppRootBloc>().add(AppRootEvent());
            },
            currentIndex: state.index,
            items: itemsList,
          ),
        );
      },
    );
  }
}
