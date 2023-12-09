import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Class/Class_Precricao.dart'; // Certifique-se de que o nome do arquivo está correto

class PrescricaoCard extends StatelessWidget {
  final Prescricao
      prescricaoDetails; // Verifique se o nome da classe está correto

  const PrescricaoCard({Key? key, required this.prescricaoDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4.0,
      child: ExpansionTile(
        title: Text(
          prescricaoDetails.nomeMedicamento,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(formatDateTime(prescricaoDetails.dataConsulta)),
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.receipt_long_outlined, color: Colors.black54),
        ),
        children: _buildDetails(),
      ),
    );
  }

  List<Widget> _buildDetails() {
    var details = {
      'Nome do Medicamento': prescricaoDetails.nomeMedicamento,
      'Dosagem': prescricaoDetails.dosagem,
      'Instruções': prescricaoDetails.instrucoes,
      'Data da Consulta': formatDateTime(prescricaoDetails.dataConsulta),
      'Médico': prescricaoDetails
          .nomeMedico, // Certifique-se de que é nomeMedico, não nomeMedicamento
      'Especialidade': prescricaoDetails.especialidade,
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

  String formatDateTime(String dateString) {
    DateTime date = DateTime.parse(dateString).toLocal();
    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }
}
