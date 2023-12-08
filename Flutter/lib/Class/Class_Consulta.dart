class Consulta {
  final int consultaID;
  final String dataConsulta;
  final String observacoes;
  final String nomeMedico;
  final String especialidade;

  Consulta({
    required this.consultaID,
    required this.dataConsulta,
    required this.observacoes,
    required this.nomeMedico,
    required this.especialidade,
  });

  factory Consulta.fromJson(Map<String, dynamic> json) {
    return Consulta(
      consultaID: json['consulta_id'] as int,
      dataConsulta: json['data_consulta'] as String,
      observacoes: json['observacoes'] as String,
      nomeMedico: json['nome_medico'] as String,
      especialidade: json['especialidade'] as String,
    );
  }
}
