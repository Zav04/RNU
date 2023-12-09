class Prescricao {
  final int prescricaoId;
  final String dataConsulta;
  final String dosagem;
  final String instrucoes;
  final String nomeMedico;
  final String especialidade;
  final String nomeMedicamento;

  Prescricao({
    required this.prescricaoId,
    required this.dataConsulta,
    required this.dosagem,
    required this.instrucoes,
    required this.nomeMedico,
    required this.especialidade,
    required this.nomeMedicamento,
  });

  factory Prescricao.fromJson(Map<String, dynamic> json) {
    return Prescricao(
      prescricaoId: json['prescricao_id'] as int,
      dataConsulta: json['data_consulta'] as String,
      dosagem: json['dosagem'] as String,
      instrucoes: json['instrucoes'] as String,
      nomeMedico: json['nome_medico'] as String,
      especialidade: json['especialidade'] as String,
      nomeMedicamento: json['nome_medicamento'] as String,
    );
  }
}
