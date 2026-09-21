import 'package:flutter/material.dart';

const authGreen = Color(0xFF7DBE43);
const authText = Color(0xFF18202A);
const authMuted = Color(0xFF77828D);
const authBorder = Color(0xFFDDE2E7);

class AuthPage extends StatelessWidget {
  final Widget child;
  final bool back;
  const AuthPage({super.key, required this.child, this.back = false});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(24, 16, 24, 12), child: Column(children: [
      if (back) Align(alignment: Alignment.centerLeft, child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new, size: 16))) else const SizedBox(height: 40),
      Expanded(child: child),
    ]))),
  );
}

class AuthTitle extends StatelessWidget {
  final String text;
  const AuthTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Text(text, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w700, color: authText));
}

class AuthDescription extends StatelessWidget {
  final String text;
  final TextAlign align;
  const AuthDescription(this.text, {super.key, this.align = TextAlign.left});
  @override
  Widget build(BuildContext context) => Text(text, textAlign: align, style: const TextStyle(fontSize: 10, height: 1.45, color: authMuted));
}

class AuthButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback? onPressed;
  const AuthButton({super.key, required this.label, required this.enabled, required this.onPressed});
  @override
  Widget build(BuildContext context) => SizedBox(width: double.infinity, height: 46, child: FilledButton(onPressed: enabled ? onPressed : null, style: FilledButton.styleFrom(backgroundColor: authGreen, disabledBackgroundColor: const Color(0xFFD2D7DE), disabledForegroundColor: const Color(0xFFAAB2BC), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))), child: Text(label, style: const TextStyle(fontSize: 12))));
}

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscure;
  final TextInputType? keyboardType;
  const AuthTextField({super.key, required this.label, required this.hint, required this.controller, this.obscure = false, this.keyboardType});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(fontSize: 10, color: authMuted)), const SizedBox(height: 6), TextField(controller: controller, obscureText: obscure, keyboardType: keyboardType, decoration: InputDecoration(hintText: hint, hintStyle: const TextStyle(fontSize: 11, color: Color(0xFFAAB4BE)), contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13), suffixIcon: obscure ? const Icon(Icons.visibility_outlined, size: 16) : null, border: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: authBorder)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: authBorder))))]);
}

class SelectField extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;
  const SelectField({super.key, required this.icon, required this.title, required this.value, required this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(10), child: Container(height: 42, padding: const EdgeInsets.symmetric(horizontal: 12), decoration: BoxDecoration(border: Border.all(color: value == 'Выбрать' ? authBorder : authGreen), borderRadius: BorderRadius.circular(10)), child: Row(children: [Icon(icon, size: 16, color: authText), const SizedBox(width: 8), Text(title, style: const TextStyle(fontSize: 11)), const Spacer(), Text(value, style: const TextStyle(fontSize: 10, color: authGreen)), const Icon(Icons.chevron_right, size: 16, color: authGreen)])));
}

class LoginHint extends StatelessWidget {
  const LoginHint({super.key});
  @override
  Widget build(BuildContext context) => const Text.rich(TextSpan(text: 'Уже есть аккаунт? ', style: TextStyle(fontSize: 10, color: authText), children: [TextSpan(text: 'Войти', style: TextStyle(color: authGreen))]));
}

Future<String?> showOptions(BuildContext context, String title, List<String> options, String? selected) => showModalBottomSheet<String>(context: context, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(18))), builder: (_) => SafeArea(child: Column(mainAxisSize: MainAxisSize.min, children: [Padding(padding: const EdgeInsets.all(18), child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700))), ...options.map((item) => ListTile(title: Text(item), trailing: Radio<String>(value: item, groupValue: selected, activeColor: authGreen, onChanged: (value) => Navigator.pop(context, value))))])));

class MapIllustration extends StatelessWidget {
  const MapIllustration({super.key});
  @override
  Widget build(BuildContext context) => SizedBox(width: 220, height: 135, child: CustomPaint(painter: _MapPainter()));
}

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pale = Paint()..color = const Color(0xFFE1F0DF);
    final green = Paint()..color = authGreen;
    final line = Paint()..color = const Color(0xFF73A97A)..style = PaintingStyle.stroke..strokeWidth = 1.5;
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width / 2, size.height / 2 + 6), width: 175, height: 76), pale);
    final map = Path()..moveTo(25, 82)..lineTo(57, 36)..lineTo(104, 53)..lineTo(145, 30)..lineTo(194, 80)..lineTo(146, 101)..lineTo(90, 82)..lineTo(45, 98)..close();
    canvas.drawPath(map, Paint()..color = const Color(0xFFBBD6B9));
    canvas.drawPath(map, line);
    canvas.drawCircle(const Offset(113, 42), 19, green);
    canvas.drawCircle(const Offset(113, 42), 7, Paint()..color = Colors.white);
    for (final point in const [Offset(67, 58), Offset(153, 67), Offset(91, 75)]) { canvas.drawCircle(point, 6, green); canvas.drawCircle(point, 2, Paint()..color = Colors.white); }
    canvas.drawLine(const Offset(45, 88), const Offset(82, 69), line);
    canvas.drawLine(const Offset(121, 82), const Offset(166, 51), line);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
