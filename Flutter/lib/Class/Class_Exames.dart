class Exames {
  final int examID;
  final String dataExame;
  final String tipoExame;
  final String resultados;
  final String nomeMedico;
  final String especialidade;

  Exames({
    required this.examID,
    required this.dataExame,
    required this.tipoExame,
    required this.resultados,
    required this.nomeMedico,
    required this.especialidade,
  });

  factory Exames.fromJson(Map<String, dynamic> json) {
    return Exames(
      examID: json['exame_id'] as int,
      dataExame: json['data_exame'] as String,
      tipoExame: json['tipo_exame'] as String,
      resultados: json['resultados'] as String,
      nomeMedico: json['nome_medico'] as String,
      especialidade: json['especialidade'] as String,
    );
  }
}
