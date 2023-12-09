import 'package:flutter/material.dart';
import '../Class/Class_UtenteDetails.dart';
import 'package:intl/intl.dart';

class UtenteCard extends StatelessWidget {
  final UtenteDetails cardUtente;

  const UtenteCard({
    Key? key,
    required this.cardUtente,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> details = {
      'Nome Completo': cardUtente.nomeCompleto,
      'Número SNS': cardUtente.numeroSNS,
      'Data de Nascimento': formatDate(cardUtente.dataNascimento),
      'Sexo': cardUtente.sexoUtente,
      'Nacionalidade': cardUtente.paisNacionalidade,
      'Telefone': cardUtente.phoneNumber,
      'Endereço': cardUtente.address,
      'Número da Porta': cardUtente.doorNumber.toString(),
      'Andar': cardUtente.floorNumber?.toString() ?? 'N/A',
      'Código Postal': cardUtente.zipCode,
      'Código da Entidade': cardUtente.entidadeCodigo,
      'Descrição da Entidade': cardUtente.entidadeDescricao,
    };

    List<Widget> detailWidgets = details.entries
        .map((entry) => buildDetailRow(entry.key, entry.value))
        .toList();

    detailWidgets.add(const Divider(thickness: 1, color: Colors.grey));
    detailWidgets.add(buildCenteredBoldText('Benefícios'));
    detailWidgets.addAll(buildBeneficiosList(cardUtente.beneficios));

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: detailWidgets,
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Text('$title: ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Flexible(child: Text(value, overflow: TextOverflow.ellipsis)),
          ],
        ),
      );

  Widget buildCenteredBoldText(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Center(
          child: Text(text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center),
        ),
      );

  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('dd/MM/yyyy').format(date);
  }

  List<Widget> buildBeneficiosList(List<Beneficio>? beneficios) =>
      beneficios
          ?.map((beneficio) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDetailRow('Tipo de Benefício', beneficio.tipo),
                  buildDetailRow('Descrição do Benefício', beneficio.descricao),
                  buildDetailRow(
                      'Início do Benefício', formatDate(beneficio.dataInicio)),
                  buildDetailRow(
                      'Fim do Benefício', formatDate(beneficio.dataFim)),
                  const Divider(),
                ],
              ))
          .toList() ??
      [];
}
