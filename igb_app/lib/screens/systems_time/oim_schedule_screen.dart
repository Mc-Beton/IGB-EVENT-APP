import '../../models/event_item.dart';
import '../base_schedule_screen.dart';

class OimScheduleScreen extends BaseScheduleScreen {
  const OimScheduleScreen({super.key}) : super(systemName: "Ogniem i Mieczem");

  @override
  Map<String, List<EventItem>> buildSchedule() {
    return {
      "Sobota, 15 lutego 2025": [
        EventItem("Rejestracja", DateTime(2025, 2, 15, 9, 30), DateTime(2025, 2, 15, 10, 0)),
        EventItem("Runda 1", DateTime(2025, 2, 15, 10, 0), DateTime(2025, 2, 15, 11, 30)),
        EventItem("Runda 2", DateTime(2025, 2, 15, 11, 45), DateTime(2025, 2, 15, 13, 15)),
        EventItem("Obiad", DateTime(2025, 2, 15, 13, 15), DateTime(2025, 2, 15, 14, 0)),
        EventItem("Runda 3", DateTime(2025, 2, 15, 14, 0), DateTime(2025, 2, 15, 16, 0)),
      ],
      "Niedziela, 16 lutego 2025": [
        EventItem("Runda 4", DateTime(2025, 2, 16, 9, 30), DateTime(2025, 2, 16, 11, 30)),
        EventItem("Runda 5", DateTime(2025, 2, 16, 11, 45), DateTime(2025, 2, 16, 13, 45)),
        EventItem("Zakończenie", DateTime(2025, 2, 16, 14, 0), DateTime(2025, 2, 16, 14, 30)),
      ],
    };
  }
}
