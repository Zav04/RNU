import 'package:flutter/material.dart';
import '../Class/Class_MedicalPrescription.dart';
import 'package:intl/intl.dart';
import '../Menus/MainMenu.dart';

class MedicationCard extends StatefulWidget {
  final CardMedication cardMedication;
  final Appointment appointment;
  MedicationCard({
    Key? key,
    required this.cardMedication,
    required this.appointment, // Torna o callback um parâmetro obrigatório
  }) : super(key: key);

  @override
  State<MedicationCard> createState() => _MedicationCard();
}

class _MedicationCard extends State<MedicationCard> {
  bool isExpanded = false;
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: ExpansionTile(
        title: Text(
          widget.cardMedication.nomdeMedicamento,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: !isExpanded
            ? Text('Dosagem: ${widget.cardMedication.dosagem}')
            : null,
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.medication, color: Colors.black54),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDetailRow('Dosagem:', widget.appointment.dosagem),
                buildDetailRow(
                    'Medicamento:', widget.appointment.nomeDoMedicamento),
                buildDetailRow('Médico:', widget.appointment.nomeDoMedico),
                buildDetailRow(
                    'Emissão:', formatDate(widget.appointment.dataDeEmissao)),
                buildDetailRow(
                    'Validade:', formatDate(widget.appointment.dataDeValidade)),
                buildDetailRow('Fim do Tratamento:',
                    formatDate(widget.appointment.dataDeFim)),
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

  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('dd/MM/yyyy').format(date);
  }

  void onImageCaptured(String imagePath) {
    setState(() {
      this.imagePath = imagePath;
    });
  }

  bool isWithinMedicationPeriod(String startDateString, String endDateString) {
    DateTime startDate = DateTime.parse(startDateString);
    DateTime endDate = DateTime.parse(endDateString);
    DateTime today = DateTime.now();

    // Verifica se a data atual está entre as datas de início e fim
    return today.isAfter(startDate.subtract(const Duration(days: 1))) &&
        today.isBefore(endDate.add(const Duration(days: 1)));
  }
}
