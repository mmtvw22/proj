import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final password = TextEditingController();
  final confirmation = TextEditingController();

  @override
  void initState() {
    super.initState();
    password.addListener(_refresh);
    confirmation.addListener(_refresh);
  }

  void _refresh() => setState(() {});

  @override
  void dispose() {
    password.dispose();
    confirmation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final valid = password.text.length >= 6 && password.text == confirmation.text;
    return AuthPage(
      back: true,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const AuthTitle('Создайте пароль'),
        const SizedBox(height: 8),
        const AuthDescription('Придумайте надежный пароль для\nбезопасного входа в ваш аккаунт'),
        const SizedBox(height: 24),
        AuthTextField(label: 'Пароль', hint: 'Введите пароль', controller: password, obscure: true),
        const SizedBox(height: 14),
        AuthTextField(label: 'Подтвердите пароль', hint: 'Введите пароль', controller: confirmation, obscure: true),
        const Spacer(),
        AuthButton(label: 'Продолжить', enabled: valid, onPressed: () => showDialog<void>(context: context, builder: (_) => AlertDialog(title: const Text('Регистрация завершена'), content: const Text('Ваш аккаунт успешно создан.'), actions: [TextButton(onPressed: () => Navigator.popUntil(context, (route) => route.isFirst), child: const Text('Готово'))]))),
      ]),
    );
  }
}
