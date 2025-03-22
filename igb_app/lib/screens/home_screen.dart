import 'package:flutter/material.dart';
import '../widgets/menu_tile.dart';
import '../widgets/user_menu.dart';
import '../screens/login_screen.dart';
import 'schedule_systems_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoggedIn = false;
  String? userNick;

  void _showUserMenu() {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
    ),
    builder: (context) {
      return UserMenu(
        isLoggedIn: isLoggedIn,
        userNick: userNick,
        onLogout: () {
          setState(() {
            isLoggedIn = false;
            userNick = null;
          });
          Navigator.pop(context);
        },
        onLogin: (context) async {
          Navigator.pop(context); // zamykamy menu
          final nick = await Navigator.push<String>(
            context,
            MaterialPageRoute(
              builder: (_) => LoginScreen(
                onLogin: (nick) {
                  Navigator.pop(context, nick);
                },
              ),
            ),
          );

          if (nick != null && nick.isNotEmpty) {
            setState(() {
              isLoggedIn = true;
              userNick = nick;
            });
          }
        },
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double tileSize = (screenWidth - 3 * 20) / 2;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Image.asset('assets/logo_igb.png', height: 32),
            const SizedBox(width: 12),
            const Text("IGB - Witaj!"),
          ],
        ),
        actions: [
          if (isLoggedIn)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: Text(
                  userNick ?? '',
                  style: const TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: _showUserMenu,
            tooltip: "Użytkownik",
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1,
              children: [
                MenuTile(
                  title: "Harmonogramy",
                  icon: Icons.schedule,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ScheduleSystemsScreen()),
                    );
                  },
                ),
                MenuTile(title: "Warsztaty", icon: Icons.brush, onTap: () {}),
                MenuTile(title: "Pokazy", icon: Icons.theaters, onTap: () {}),
                MenuTile(title: "Wystawcy", icon: Icons.store, onTap: () {}),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: tileSize * 2 + 10,
              child: MenuTile(
                title: "Mapa wydarzenia",
                icon: Icons.map,
                onTap: () {},
                big: true,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: tileSize,
              child: MenuTile(
                title: "Dołącz do zabawy",
                icon: Icons.celebration,
                onTap: () {},
                color: const Color(0xFFF5F5F5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
