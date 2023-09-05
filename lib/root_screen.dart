import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/blocs/app_root_bloc/app_root_bloc.dart';
import 'core/blocs/app_root_bloc/app_root_event.dart';
import 'core/blocs/app_root_bloc/app_root_state.dart';
import 'core/helper/app_screens.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppRootBloc, AppRootState>(
      builder: (context, state) {
        return Scaffold(
          body: views[state.index],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              state.index = value;
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
