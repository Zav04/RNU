import 'package:flutter/material.dart';
import '../Class/Class_User.dart';
import '../Class/Class_MedicalPrescription.dart';
import '../Controller/DataBaseConection.dart';
import '../Widgets/Cards.dart';
import 'package:gap/gap.dart';

class MainMenu extends StatefulWidget {
  final User user;
  const MainMenu({super.key, required this.user});
  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  // Dia que o calendário está focando
  List<Appointment> appointmentUtente = [];
  @override
  void initState() {
    super.initState();
    //fetchAppointments(widget.user.userId); // Inicializa com o dia atual
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECF9),
      appBar: AppBar(
        title: const Text('UtenteCare'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Gap(10),
          Expanded(
            child: ListView.builder(
                itemCount: appointmentUtente.length,
                itemBuilder: (context, index) {
                  final appointment = appointmentUtente[index];
                  return UtenteCard(
                    cardUtente: CardUtente(
                      nomdeMedicamento: appointment.nomeDoMedicamento,
                      dosagem: appointment.dosagem,
                      status: appointment.status,
                    ),
                    appointment: appointment,
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        fixedColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chair_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.settings_outlined),
            label: 'Setting',
          ),
        ],
      ),
    );
  }

//   void fetchAppointments(int userId) async {
//     var result = await getMedication(userId);
//     if (result.data is List) {
//       setState(() {
//         appointmentUtente = result.data
//             .map<Appointment>((item) => Appointment.fromJson(item))
//             .toList();
//       });
//     } else {
//       setState(() {
//         appointmentUtente = [];
//       });
//     }
//   }
}
