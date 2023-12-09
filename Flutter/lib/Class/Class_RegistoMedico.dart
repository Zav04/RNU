class RegistoMedico {
  final int registroId;
  final String historico;
  final String nomeMedico;
  final String especialidade;

  RegistoMedico({
    required this.registroId,
    required this.historico,
    required this.nomeMedico,
    required this.especialidade,
  });

  factory RegistoMedico.fromJson(Map<String, dynamic> json) {
    return RegistoMedico(
      registroId: json['registro_id'] as int,
      historico: json['historico'] as String,
      nomeMedico: json['nome_medico'] as String,
      especialidade: json['especialidade'] as String,
    );
  }
}
