import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Class/Class_Consulta.dart';

class ConsultaCard extends StatelessWidget {
  final Consulta consultaDetails;

  const ConsultaCard({
    Key? key,
    required this.consultaDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4.0,
      child: ExpansionTile(
        title: Text(
          consultaDetails.especialidade,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(formatDateTime(consultaDetails.dataConsulta)),
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(Icons.schedule_outlined, color: Colors.black54),
        ),
        children: _buildDetails(),
      ),
    );
  }

  List<Widget> _buildDetails() {
    var details = {
      'Nome do Médico': consultaDetails.nomeMedico,
      'Especialidade': consultaDetails.especialidade,
      'Data da Consulta': formatDateTime(consultaDetails.dataConsulta),
      'Observações': consultaDetails.observacoes,
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
