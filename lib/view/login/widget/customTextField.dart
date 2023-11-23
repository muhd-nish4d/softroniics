import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softroniics/services/provider/auth_provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validator,
      required this.suffixIcon,
      this.heading,
      this.keyboardType,
      this.isClickeble = false,
      this.isObsecure = false});
  final String? heading;
  final String hintText;
  final bool isClickeble;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final IconData suffixIcon;
  final TextInputType? keyboardType;
  final bool isObsecure;

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
            obscureText: isObsecure,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              suffixIcon: isClickeble
                  ? IconButton(
                      onPressed: () {
                        Provider.of<ProviderAuth>(context, listen: false)
                            .changePasswordVisibility();
                      },
                      icon: Icon(suffixIcon))
                  : Icon(suffixIcon),
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
