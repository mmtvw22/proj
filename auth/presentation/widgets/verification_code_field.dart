import 'package:flutter/material.dart';
import 'auth_widgets.dart';

class VerificationCodeField extends StatelessWidget {
  final TextEditingController controller;
  const VerificationCodeField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    maxLength: 4,
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    style: const TextStyle(letterSpacing: 22, fontSize: 18),
    decoration: InputDecoration(
      counterText: '',
      hintText: '•  •  •  •',
      hintStyle: const TextStyle(color: authMuted),
      contentPadding: const EdgeInsets.symmetric(vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: authBorder)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: authBorder)),
    ),
  );
}
