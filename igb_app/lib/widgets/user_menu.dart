import 'package:flutter/material.dart';

class UserMenu extends StatelessWidget {
  final bool isLoggedIn;
  final String? userNick;
  final VoidCallback onLogout;
  final Function(BuildContext context) onLogin;

  const UserMenu({
    super.key,
    required this.isLoggedIn,
    required this.userNick,
    required this.onLogout,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isLoggedIn
            ? [
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: Text(
                    userNick ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.black),
                  title: const Text("Wyloguj się"),
                  onTap: onLogout,
                ),
              ]
            : [
                ListTile(
                  leading: const Icon(Icons.login, color: Colors.black),
                  title: const Text("Zaloguj się"),
                  onTap: () => onLogin(context),
                ),
                ListTile(
                  leading: const Icon(Icons.app_registration, color: Colors.black),
                  title: const Text("Dołącz"),
                  onTap: () => onLogin(context),
                ),
              ],
      ),
    );
  }
}
