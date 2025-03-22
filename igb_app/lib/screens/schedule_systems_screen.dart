import 'package:flutter/material.dart';
import '../models/system_model.dart';
import 'systems_time/warhammer_schedule_screen.dart';
import 'systems_time/aos_schedule_screen.dart';
import 'systems_time/asoiaf_schedule_screen.dart';
import 'systems_time/legion_schedule_screen.dart';
import 'systems_time/lotr_schedule_screen.dart';
import 'systems_time/oim_schedule_screen.dart';
import 'systems_time/kow_schedule_screen.dart';
import 'systems_time/bolt_schedule_screen.dart';

class ScheduleSystemsScreen extends StatelessWidget {
  const ScheduleSystemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final systems = [
      GameSystem(
        name: "Warhammer 40k",
        imageAsset: 'assets/systems/WH40p.png',
        screen: const WarhammerScheduleScreen(),
      ),
      GameSystem(
        name: "Age of Sigmar",
        imageAsset: 'assets/systems/WH40p.png',
        screen: const AoSScheduleScreen(),
      ),
      GameSystem(
        name: "A Song of Ice and Fire",
        imageAsset: 'assets/systems/Asoiafp.png',
        screen: const AsoiafScheduleScreen(),
      ),
      GameSystem(
        name: "Star Wars: Legion",
        imageAsset: 'assets/systems/SWLp.png',
        screen: const LegionScheduleScreen(),
      ),
      GameSystem(
        name: "Lord of the Rings",
        imageAsset: 'assets/systems/LOTRp.png',
        screen: const LotrScheduleScreen(),
      ),
      GameSystem(
        name: "Ogniem i Mieczem",
        imageAsset: 'assets/systems/OiMp.png',
        screen: const OimScheduleScreen(),
      ),
      GameSystem(
        name: "Kings of War",
        imageAsset: 'assets/systems/WH40p.png',
        screen: const KoWScheduleScreen(),
      ),
      GameSystem(
        name: "Bolt Action",
        imageAsset: 'assets/systems/WH40p.png',
        screen: const BoltScheduleScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Wybierz system")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: systems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final system = systems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => system.screen),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(1, 2),
                    )
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(system.imageAsset, fit: BoxFit.contain),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      system.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
