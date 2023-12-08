import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Class/Class_Consulta.dart';
import '../Menus/MainMenu.dart';

class ConsultaCard extends StatefulWidget {
  final Consulta consultaDetails;

  ConsultaCard(
      {Key? key,
      required this.consultaDetails // Torna o callback um parâmetro obrigatório
      })
      : super(key: key);

  @override
  State<ConsultaCard> createState() => _MedicationCard();
}

class _MedicationCard extends State<ConsultaCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: ExpansionTile(
        title: Text(
          widget.consultaDetails.especialidade,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: !isExpanded
            ? Text(formatDateTime(widget.consultaDetails.dataConsulta))
            : null,
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.today_outlined, color: Colors.black54),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDetailRow(
                    'Nome do Medico:', widget.consultaDetails.nomeMedico),
                buildDetailRow(
                    'Especialidade:', widget.consultaDetails.especialidade),
                buildDetailRow('Data da Consulta:',
                    formatDateTime(widget.consultaDetails.dataConsulta)),
                buildDetailRow(
                    'Observações:', widget.consultaDetails.observacoes),
              ],
            ),
          ),
        ],
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            '$title ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  String formatDateTime(String dateString) {
    DateTime date = DateTime.parse(dateString).toLocal();
    return DateFormat('dd/MM/yyyy HH:mm')
        .format(date); // Formato de data e hora
  }
}
