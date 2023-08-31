import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.hintText,
      this.icon,
      this.onChanged,
      this.onValid,
      this.obscureText = false});
  final String? hintText;
  final Icon? icon;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? onValid;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        validator: onValid,
        cursorColor: const Color(0xff645ce6),
        decoration: InputDecoration(
            hintText: '$hintText',
            fillColor: Colors.white,
            filled: true,
            prefixIcon: icon,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
      ),
    );
  }
}
