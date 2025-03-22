import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function(String nick) onLogin; // callback do przekazania nicku po zalogowaniu

  const LoginScreen({super.key, required this.onLogin});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nickController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final List<String> _usedNicknames = ['admin', 'gość'];
  final List<String> _usedEmails = ['test@igb.pl'];

  String? _validateNick(String? value) {
    if (value == null || value.isEmpty) return 'Podaj nick';
    if (_usedNicknames.contains(value.trim())) return 'Nick już zajęty';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Podaj e-mail';
    if (!value.contains('@')) return 'Niepoprawny e-mail';
    if (_usedEmails.contains(value.trim())) return 'E-mail już zajęty';
    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onLogin(_nickController.text.trim());
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Logowanie")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nickController,
                decoration: const InputDecoration(labelText: "Nick"),
                validator: _validateNick,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Hasło"),
                obscureText: true,
                validator: (value) =>
                    value == null || value.length < 6 ? 'Minimum 6 znaków' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Zarejestruj się / Zaloguj"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
