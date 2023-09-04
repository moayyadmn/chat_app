import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/utils/constants.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final User? userData = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: NameAndPhoto(userData: userData),
        ),
        const Divider(
          thickness: 0.8,
        ),
        const SizedBox(
          height: 20,
        ),
        SettingItem(
            onTap: () {},
            titel: 'About Me',
            subtitle: 'write about your hobbies',
            icon: Icons.description_outlined),
        SettingItem(
            onTap: () async {
              logoutDialog(context).show();
            },
            titel: 'Logout',
            subtitle: 'logout',
            icon: Icons.login_outlined),
        SettingItem(
            onTap: () {},
            titel: 'Help',
            subtitle: 'help center, contact us, privacy policy',
            icon: Icons.help_outline),
      ],
    );
  }

  AwesomeDialog logoutDialog(BuildContext context) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      title: 'Logout',
      desc: '--- are you sure ---',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        Get.back();
        showDialog(
            context: context,
            builder: (context) {
              return const Center(
                  child: CircularProgressIndicator(
                color: kMainColor,
              ));
            });
        try {
          await FirebaseAuth.instance.signOut();
          await GoogleSignIn().disconnect();
          await GoogleSignIn().signOut();
        } catch (e) {
          debugPrint('logout err : $e');
        }
        Get.back();
        Get.offAndToNamed(kLoginRoute);
      },
    );
  }
}

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key,
      required this.titel,
      required this.subtitle,
      required this.icon,
      required this.onTap});
  final String titel, subtitle;
  final IconData icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(
          titel,
          style: const TextStyle(
            fontFamily: 'Defult',
            fontSize: 20,
          ),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}

class NameAndPhoto extends StatelessWidget {
  const NameAndPhoto({
    super.key,
    required this.userData,
  });

  final User? userData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: Image.network(
            userData!.photoURL!,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, object, stackTrace) {
              return const Icon(
                Icons.account_circle,
                size: 80,
                color: Colors.grey,
              );
            },
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return const SizedBox(
                width: 80,
                height: 80,
                child: Center(
                  child: CircularProgressIndicator(
                    color: kMainColor,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userData!.displayName!,
              style: const TextStyle(
                  letterSpacing: 1,
                  fontFamily: 'Defult',
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              userData!.email!,
              style: const TextStyle(
                  fontFamily: 'Defult',
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
