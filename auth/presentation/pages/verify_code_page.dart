import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/verification_code_field.dart';
import 'reset_password_page.dart';

class VerifyCodePage extends StatefulWidget {
  final String email;
  const VerifyCodePage({super.key, required this.email});

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final code = TextEditingController();

  @override
  void initState() {
    super.initState();
    code.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthPage(
      back: true,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const AuthTitle('Введите код'),
        const SizedBox(height: 10),
        const AuthDescription('Введите 4-значный код, отправленный на\nвашу электронную почту:'),
        const SizedBox(height: 24),
        VerificationCodeField(controller: code),
        const SizedBox(height: 16),
        const Center(child: AuthDescription('Отправить повторно можно будет через\n115 секунд', align: TextAlign.center)),
        const Spacer(),
        AuthButton(label: 'Продолжить', enabled: code.text.length == 4, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ResetPasswordPage()))),
      ]),
    );
  }
}
