class Beneficio {
  final String tipo;
  final String descricao;
  final String dataInicio;
  final String dataFim;

  Beneficio({
    required this.tipo,
    required this.descricao,
    required this.dataInicio,
    required this.dataFim,
  });

  factory Beneficio.fromJson(Map<String, dynamic> json) {
    return Beneficio(
      tipo: json['tipo'] as String,
      descricao: json['descricao'] as String,
      dataInicio: json['data_inicio'] as String,
      dataFim: json['data_fim'] as String,
    );
  }
}

class UtenteDetails {
  final int utenteId;
  final String numeroSNS;
  final String nomeCompleto;
  final String dataNascimento;
  final String sexoUtente;
  final String paisNacionalidade;
  final String phoneNumber;
  final String address;
  final int doorNumber;
  final int? floorNumber;
  final String zipCode;
  final String entidadeCodigo;
  final String entidadeDescricao;
  final List<Beneficio>? beneficios;

  UtenteDetails({
    required this.utenteId,
    required this.numeroSNS,
    required this.nomeCompleto,
    required this.dataNascimento,
    required this.sexoUtente,
    required this.paisNacionalidade,
    required this.phoneNumber,
    required this.address,
    required this.doorNumber,
    required this.floorNumber,
    required this.zipCode,
    required this.entidadeCodigo,
    required this.entidadeDescricao,
    this.beneficios,
  });

  factory UtenteDetails.fromJson(Map<String, dynamic> json) {
    var listaBeneficios = json['beneficios'] as List<dynamic>;
    List<Beneficio> beneficios = listaBeneficios
        .map((beneficioJson) =>
            Beneficio.fromJson(beneficioJson as Map<String, dynamic>))
        .toList();
    return UtenteDetails(
      utenteId: json['utente_id'] as int,
      numeroSNS: json['identificacao_numero_sns'] as String,
      nomeCompleto: json['identificacao_nome_completo'] as String,
      dataNascimento: json['identificacao_data_nascimento'] as String,
      sexoUtente: json['identificacao_sexo_utente'] as String,
      paisNacionalidade: json['identificacao_pais_nacionalidade'] as String,
      phoneNumber: json['identificacao_phone_number'] as String,
      address: json['identificacao_address'] as String,
      doorNumber: json['identificacao_door_number'] as int,
      floorNumber: json['identificacao_floor_number'] as int?,
      zipCode: json['identificacao_zip_code'] as String,
      entidadeCodigo: json['entidade_codigo'] as String,
      entidadeDescricao: json['entidade_descricao'] as String,
      beneficios: beneficios,
    );
  }
}
