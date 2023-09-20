import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';

class SettingProfileCard extends StatelessWidget {
  const SettingProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.network(
            "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
            fit: BoxFit.cover,
            height: 50,
            width: 50,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.account_circle,
                size: 50,
                color: Colors.grey,
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: CircularProgressIndicator(
                    color: kGreenColor,
                  ),
                ),
              );
            },
          ),
        ),
        title: Text("Moayyad Nagib",
            style: Theme.of(context).textTheme.titleMedium),
        subtitle: const Text(
          "Never give up 💪",
          style: TextStyle(color: Color(0xff797C7B)),
        ),
        trailing: SvgPicture.asset("assets/svg/qr_code.svg"),
      ),
    );
  }
}