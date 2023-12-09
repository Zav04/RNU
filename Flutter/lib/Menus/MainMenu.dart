import 'package:flutter/material.dart';
import '../Class/Class_User.dart';
import '../Class/Class_UtenteDetails.dart';
import '../Controller/DataBaseConection.dart';
import '../Widgets/Cards_Utente.dart';
import 'package:gap/gap.dart';
import '../Widgets/Cards_Consultas.dart';
import '../Class/Class_Consulta.dart';
import '../Class/Class_Precricao.dart';
import '../Widgets/Cards_Precrições.dart';
import '../Class/Class_Exames.dart';
import '../Widgets/Cards_Exames.dart';
import '../Class/Class_RegistoMedico.dart';
import '../Widgets/Cards_RegistroMedico.dart';

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
  List<Prescricao> appointmentPrecricoes = [];
  List<Exames> appointmentExames = [];
  List<RegistoMedico> appointmentRegistoMedico = [];
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
        setState(() {
          appointmentPrecricoes = [];
          fetchPrecrisoes(widget.user.userId);
        });
        break;
      case 3:
        setState(() {
          appointmentExames = [];
          fetchExames(widget.user.userId);
        });
        break;
      case 4:
        setState(() {
          appointmentRegistoMedico = [];
          fetchRegistoMedico(widget.user.userId);
        });
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
          itemCount: appointmentPrecricoes
              .length, // Aqui você deverá ajustar para a quantidade correta de consultas
          itemBuilder: (context, index) {
            if (appointmentPrecricoes.isNotEmpty) {
              var precrisaoDetail = appointmentPrecricoes[index];
              return PrescricaoCard(
                prescricaoDetails:
                    precrisaoDetail, // E aqui provavelmente será um objeto diferente, não um UtenteDetails
              );
            } else {
              return Container();
            }
          });
    } else if (_selectedIndex == 3) {
      cards = ListView.builder(
          itemCount: appointmentExames
              .length, // Aqui você deverá ajustar para a quantidade correta de consultas
          itemBuilder: (context, index) {
            if (appointmentExames.isNotEmpty) {
              var exameDetail = appointmentExames[index];
              return ExamesCard(
                examesDetails:
                    exameDetail, // E aqui provavelmente será um objeto diferente, não um UtenteDetails
              );
            } else {
              return Container();
            }
          });
    } else if (_selectedIndex == 4) {
      cards = ListView.builder(
          itemCount: appointmentRegistoMedico
              .length, // Aqui você deverá ajustar para a quantidade correta de consultas
          itemBuilder: (context, index) {
            if (appointmentRegistoMedico.isNotEmpty) {
              var registoMedicoDetail = appointmentRegistoMedico[index];
              return RegistoMedicoCard(
                registoMedicoDetails:
                    registoMedicoDetail, // E aqui provavelmente será um objeto diferente, não um UtenteDetails
              );
            } else {
              return Container();
            }
          });
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
              icon: Icon(Icons.account_circle_outlined),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule_outlined), label: 'Consultas'),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined), label: 'Prescricoes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment_outlined), label: 'Exames'),
            BottomNavigationBarItem(
                icon: Icon(Icons.medical_information_outlined),
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

  void fetchPrecrisoes(int userId) async {
    var result = await getUtentePrecisao(id: userId);
    if (result.data is List) {
      setState(() {
        appointmentPrecricoes = result.data
            .map<Prescricao>((item) => Prescricao.fromJson(item))
            .toList();
      });
    } else {
      setState(() {
        appointmentPrecricoes = [];
      });
    }
  }

  //Do teh fetch for exames
  void fetchExames(int userId) async {
    var result = await getUtenteExames(id: userId);
    if (result.data is List) {
      setState(() {
        appointmentExames =
            result.data.map<Exames>((item) => Exames.fromJson(item)).toList();
      });
    } else {
      setState(() {
        appointmentExames = [];
      });
    }
  }

  //Do teh fetch for RegistroMedico
  void fetchRegistoMedico(int userId) async {
    var result = await getUtenteRegistroMedico(id: userId);
    if (result.data is List) {
      setState(() {
        appointmentRegistoMedico = result.data
            .map<RegistoMedico>((item) => RegistoMedico.fromJson(item))
            .toList();
      });
    } else {
      setState(() {
        appointmentRegistoMedico = [];
      });
    }
  }
}
