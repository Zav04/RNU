import 'package:flutter/material.dart';
import '../Class/Class_RegistoMedico.dart';

class RegistoMedicoCard extends StatelessWidget {
  final RegistoMedico registoMedicoDetails;

  const RegistoMedicoCard({
    Key? key,
    required this.registoMedicoDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4.0,
      child: ExpansionTile(
        title: Text(
          registoMedicoDetails.nomeMedico,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(registoMedicoDetails.especialidade),
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.medical_information_outlined,
              color: Colors.black54),
        ),
        children: _buildDetails(),
      ),
    );
  }

  List<Widget> _buildDetails() {
    var details = {
      'Nome do Médico': registoMedicoDetails.nomeMedico,
      'Especialidade': registoMedicoDetails.especialidade,
      'Historico': registoMedicoDetails.historico,
    };

    return details.entries
        .map((entry) => Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 0.0), // Ajuste o padding horizontal como necessário
              child: buildDetailRow(entry.key, entry.value),
            ))
        .toList();
  }

  Widget buildDetailRow(String title, String value) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Text('$title ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Flexible(child: Text(value, overflow: TextOverflow.ellipsis)),
          ],
        ),
      );
}
