import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/login_cubit/login_cubit.dart';
import '../../../cubits/login_cubit/login_state.dart';
import 'widgets/login_body.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
    return SafeArea(
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: kMainColor,
                  ));
                });
          } else if (state is LoginSuccess) {
            Get.back();
            Get.offAndToNamed(kUserChatRoute);
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMessage)));
            Get.back();
          }
        },
        child: const Scaffold(
          backgroundColor: Colors.black,
          body: LoginBody(),
        ),
      ),
    );
  }
}
