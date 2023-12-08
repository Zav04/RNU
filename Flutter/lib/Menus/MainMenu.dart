import 'package:flutter/material.dart';
import '../Class/Class_User.dart';
import '../Class/Class_UtenteDetails.dart';
import '../Controller/DataBaseConection.dart';
import '../Widgets/Cards_Utente.dart';
import 'package:gap/gap.dart';
import '../Widgets/Cards_Consultas.dart';
import '../Class/Class_Consulta.dart';

class MainMenu extends StatefulWidget {
  final User user;
  const MainMenu({super.key, required this.user});
  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  // Dia que o calendário está focando
  List<UtenteDetails> appointmentUtente = [];
  List<Consulta> appointmentConsultas = [];
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    fetchUtente(widget.user.userId); // Inicializa com o dia atual
  }

  void _updateContentForIndex(int index) {
    // Aqui você pode decidir o que fazer com base no índice.
    // Por exemplo, se cada índice corresponder a uma categoria diferente,
    // você pode chamar um método para buscar os dados dessa categoria.
    switch (index) {
      case 0:
        setState(() {
          appointmentUtente = [];
          fetchUtente(widget.user.userId);
        });
        break;
      case 1:
        setState(() {
          appointmentConsultas = [];
          fetchConsultas(widget.user.userId);
        });
        break;
      case 2:
        // Lógica para o índice 1, por exemplo, consultas
        //fetchAppointments(widget.user.userId);
        break;
      case 3:
        // Lógica para o índice 1, por exemplo, consultas
        //fetchAppointments(widget.user.userId);
        break;
      // Adicione mais casos conforme necessário
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget cards;
    if (_selectedIndex == 0) {
      cards = ListView.builder(
          itemCount: appointmentUtente
              .length, // Aqui você deverá ajustar para a quantidade correta de consultas
          itemBuilder: (context, index) {
            if (appointmentUtente.isNotEmpty) {
              var utenteDetail = appointmentUtente[index];
              return UtenteCard(
                cardUtente:
                    utenteDetail, // E aqui provavelmente será um objeto diferente, não um UtenteDetails
              );
            } else {
              return Container();
            }
          });
    } else if (_selectedIndex == 1) {
      cards = ListView.builder(
          itemCount: appointmentConsultas
              .length, // Aqui você deverá ajustar para a quantidade correta de consultas
          itemBuilder: (context, index) {
            if (appointmentConsultas.isNotEmpty) {
              var consultaDetail = appointmentConsultas[index];
              return ConsultaCard(
                consultaDetails:
                    consultaDetail, // E aqui provavelmente será um objeto diferente, não um UtenteDetails
              );
            } else {
              return Container();
            }
          });
    } else if (_selectedIndex == 2) {
      cards = ListView.builder(
        itemCount: appointmentUtente
            .length, // Aqui você deverá ajustar para a quantidade correta de consultas
        itemBuilder: (context, index) {
          return ConsultaCard(
            consultaDetails: appointmentConsultas[
                index], // E aqui provavelmente será um objeto diferente, não um UtenteDetails
          );
        },
      );
    } else {
      // Você pode adicionar mais condições para outros índices ou um conteúdo padrão
      cards =
          Container(); // Um widget placeholder, você pode decidir o que exibir aqui
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('UtenteCare'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Gap(10),
          Expanded(
            child: cards, // Utilize a variável content aqui
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white12,
          currentIndex: _selectedIndex, // Adicione esta linha
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            _updateContentForIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule), label: 'Consultas'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), label: 'Prescricoes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.medical_information),
                label: 'Registros\n Medicos')
          ]),
    );
  }

  void fetchUtente(int userId) async {
    var result = await getUtenteDetails(id: userId);
    if (result.data is List) {
      setState(() {
        appointmentUtente = result.data.map<UtenteDetails>((item) {
          Map<String, dynamic> jsonItem = Map<String, dynamic>.from(item);
          return UtenteDetails.fromJson(jsonItem);
        }).toList();
      });
    }
  }

  void fetchConsultas(int userId) async {
    var result = await getUtenteConsultas(id: userId);
    if (result.data is List) {
      setState(() {
        appointmentConsultas = result.data
            .map<Consulta>((item) => Consulta.fromJson(item))
            .toList();
      });
    } else {
      setState(() {
        appointmentConsultas = [];
      });
    }
  }
}
