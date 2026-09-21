import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';
import 'verify_code_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? city;
  String? language;

  @override
  Widget build(BuildContext context) {
    final canContinue = city != null && language != null;
    return AuthPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthTitle('Откуда вы?'),
          const SizedBox(height: 18),
          const Center(child: MapIllustration()),
          const SizedBox(height: 22),
          SelectField(
            icon: Icons.location_on_outlined,
            title: 'Город',
            value: city ?? 'Выбрать',
            onTap: () async {
              final result = await showOptions(context, 'Выберите город', const ['Ош', 'Бишкек', 'Манас', 'Нарын', 'Баткен'], city);
              if (result != null) setState(() => city = result);
            },
          ),
          const SizedBox(height: 10),
          SelectField(
            icon: Icons.language_outlined,
            title: 'Язык',
            value: language ?? 'Выбрать',
            onTap: () async {
              final result = await showOptions(context, 'Выберите язык', const ['Русский', 'Кыргызча', 'English'], language);
              if (result != null) setState(() => language = result);
            },
          ),
          const Spacer(),
          AuthButton(
            label: 'Продолжить',
            enabled: canContinue,
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EmailRegistrationPage())),
          ),
          const SizedBox(height: 12),
          const Center(child: LoginHint()),
        ],
      ),
    );
  }
}

class EmailRegistrationPage extends StatefulWidget {
  const EmailRegistrationPage({super.key});

  @override
  State<EmailRegistrationPage> createState() => _EmailRegistrationPageState();
}

class _EmailRegistrationPageState extends State<EmailRegistrationPage> {
  final email = TextEditingController();
  bool accepted = false;

  @override
  void initState() {
    super.initState();
    email.addListener(_refresh);
  }

  void _refresh() => setState(() {});

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = email.text.contains('@') && accepted;
    return AuthPage(
      back: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthTitle('Введите электронную\nпочту'),
          const SizedBox(height: 8),
          const AuthDescription('Введите электронную почту. Мы отправим\nкод подтверждения для безопасного входа.'),
          const SizedBox(height: 22),
          AuthTextField(label: 'Электронная почта', hint: 'Введите электронную почту', controller: email, keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 10),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Checkbox(value: accepted, activeColor: authGreen, visualDensity: VisualDensity.compact, onChanged: (value) => setState(() => accepted = value ?? false)),
            const Expanded(child: Padding(padding: EdgeInsets.only(top: 7), child: Text('Я принимаю условия пользовательского соглашения и политики конфиденциальности', style: TextStyle(fontSize: 10, color: authGreen)))),
          ]),
          const Spacer(),
          AuthButton(label: 'Продолжить', enabled: enabled, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => VerifyCodePage(email: email.text)))),
          const SizedBox(height: 65),
          const Center(child: LoginHint()),
        ],
      ),
    );
  }
}
