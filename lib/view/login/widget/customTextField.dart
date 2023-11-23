import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validator,
      required this.suffixIcon,
      this.heading,
      this.keyboardType});
  final String? heading;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final IconData suffixIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading != null
              ? Text(
                  heading!,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: heading != null ? 10 : 0,
          ),
          TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              suffixIcon: Icon(suffixIcon),
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
