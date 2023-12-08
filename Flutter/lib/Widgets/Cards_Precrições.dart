import 'package:flutter/material.dart';
import '../Class/Class_UtenteDetails.dart';
import 'package:intl/intl.dart';
import 'package:gap/gap.dart';

class UtenteCard extends StatelessWidget {
  final UtenteDetails cardUtente;

  UtenteCard({
    Key? key,
    required this.cardUtente,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCenteredBoldText('Perfil'),
            buildDetailRow('Nome Completo:', cardUtente.nomeCompleto),
            buildDetailRow('Número SNS:', cardUtente.numeroSNS),
            buildDetailRow(
                'Data de Nascimento:', formatDate(cardUtente.dataNascimento)),
            buildDetailRow('Sexo:', cardUtente.sexoUtente),
            buildDetailRow('Nacionalidade:', cardUtente.paisNacionalidade),
            buildDetailRow('Telefone:', cardUtente.phoneNumber),
            buildDetailRow('Endereço:', cardUtente.address),
            buildDetailRow(
                'Número da Porta:', cardUtente.doorNumber.toString()),
            buildDetailRow(
                'Andar:', cardUtente.floorNumber?.toString() ?? 'N/A'),
            buildDetailRow('Código Postal:', cardUtente.zipCode),
            const Divider(
              thickness: 1, // Espessura da linha
              color: Colors.grey, // Cor da linha
            ),
            buildCenteredBoldText('Entidade de Saúde'),
            buildDetailRow('Código da Entidade:', cardUtente.entidadeCodigo),
            buildDetailRow(
                'Descrição da Entidade:', cardUtente.entidadeDescricao),
            const Divider(
              thickness: 1, // Espessura da linha
              color: Colors.grey, // Cor da linha
            ),
            buildCenteredBoldText('Benefícios'),
            ...buildBeneficiosList(cardUtente.beneficios),
          ],
        ),
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

  Widget buildCenteredBoldText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Center(
        // Centraliza o widget
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold, // Aplica o estilo negrito
            fontSize:
                16, // Você pode ajustar o tamanho da fonte conforme necessário
          ),
          textAlign: TextAlign.center, // Alinha o texto ao centro
        ),
      ),
    );
  }

  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('dd/MM/yyyy').format(date);
  }

  List<Widget> buildBeneficiosList(List<Beneficio>? beneficios) {
    if (beneficios == null) {
      return [];
    }
    return beneficios.map((beneficio) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetailRow('Tipo de Benefício:', beneficio.tipo),
          buildDetailRow('Descrição do Benefício:', beneficio.descricao),
          buildDetailRow(
              'Início do Benefício:', formatDate(beneficio.dataInicio)),
          buildDetailRow('Fim do Benefício:', formatDate(beneficio.dataFim)),
          const Divider(), // Opcional, para separar visualmente os benefícios
        ],
      );
    }).toList();
  }
}
