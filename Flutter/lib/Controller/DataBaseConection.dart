import 'package:supabase_flutter/supabase_flutter.dart';
import '../Class/ClassBDResponse.dart';

const String supabaseUrl = 'https://jchfvcihvyqiqxzpkboa.supabase.co';
const String supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjaGZ2Y2lodnlxaXF4enBrYm9hIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcwMTczMjg0NywiZXhwIjoyMDE3MzA4ODQ3fQ.2hdaUt5waAkbDvGRx2XWoCCgv_fbSQgJloQBiIv6Mzo';

final SupabaseClient supabase = SupabaseClient(supabaseUrl, supabaseKey);

Future<bool> checkSupabaseConnection() async {
  try {
    // Tente fazer uma operação autenticada. Você pode substituir isso por qualquer operação válida.
    final response = await supabase.rpc('is_connected').execute();

    if (response.data == true && response.status == 200) {
      return true;
    }
    return false;
    // Verifique se a resposta é bem-sucedida.
  } catch (e) {
    // Em caso de exceção, assuma que não há conexão.
    return false;
  }
}

Future<bool> dbCheckNSSExists(String nrNSS) async {
  try {
    final response = await supabase
        .rpc('NSS_exists', params: {'input_nss': nrNSS}).execute();

    if (response.data == true && response.status == 200) {
      return true; // O e-mail existe
    } else {
      return false; // O e-mail não existe ou houve um erro
    }
  } catch (e) {
    return false;
  }
}

Future<bool> dbCheckNSSValid(String nrNSS) async {
  try {
    final response =
        await supabase.rpc('is_nss_valid', params: {'nss': nrNSS}).execute();

    if (response.data == true && response.status == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

Future<CreateDBResponse> createUser({
  required int? healthNumber,
  required String? password,
  required String? fullname,
  required String? birthDate,
  required String? gender,
  required String? nacionalidade,
  required String? phoneNumber,
  required String? address,
  required int? doorNumber,
  String? floorNumber, // Opcional, já que pode ser nulo
  required String? zipCode,
}) async {
  try {
    final response = await supabase.rpc('create_user', params: {
      '_numero_sns': healthNumber,
      '_password': password,
      '_nome_completo': fullname,
      '_data_nascimento': birthDate,
      '_sexo_utente': gender,
      '_pais_nacionalidade': nacionalidade,
      '_phone_number': phoneNumber,
      '_address': address,
      '_door_number': doorNumber,
      '_floor_number': floorNumber,
      '_zip_code': zipCode,
    }).execute();

    //Sucesso
    if (response.error == null) {
      return CreateDBResponse(
        success: true,
        data: response.data,
      );
    } else {
      // Falha, com mensagem de erro
      return CreateDBResponse(
        success: false,
        errorMessage: response.error?.message,
      );
    }
  } catch (e) {
    // Falha, com exceção capturada
    return CreateDBResponse(
      success: false,
      errorMessage: e.toString(),
    );
  }
}

Future<CreateDBResponse> login({
  required String? nss,
  required String? password,
}) async {
  try {
    final response = await supabase.rpc('verify_user_credentials',
        params: {'_numero_sns': nss, '_password': password}).execute();

    //Sucesso
    if (response.error == null && response.data != -99) {
      return CreateDBResponse(
        success: true,
        data: response.data,
      );
    } else {
      // Falha, com mensagem de erro
      return CreateDBResponse(
        success: false,
        errorMessage: response.error?.message,
      );
    }
  } catch (e) {
    // Falha, com exceção capturada
    return CreateDBResponse(
      success: false,
      errorMessage: e.toString(),
    );
  }
}

Future<CreateDBResponse> getUtenteDetails({
  required int? id,
}) async {
  try {
    final response = await supabase
        .rpc('get_utente_details', params: {'_utente_id': id}).execute();
    //Sucesso
    if (response.error == null) {
      return CreateDBResponse(
        success: true,
        data: response.data,
      );
    } else {
      // Falha, com mensagem de erro
      return CreateDBResponse(
        success: false,
        errorMessage: response.error?.message,
      );
    }
  } catch (e) {
    // Falha, com exceção capturada
    return CreateDBResponse(
      success: false,
      errorMessage: e.toString(),
    );
  }
}

Future<CreateDBResponse> getUtenteConsultas({
  required int? id,
}) async {
  try {
    final response = await supabase
        .rpc('get_consultas_with_medico', params: {'_utente_id': id}).execute();
    //Sucesso
    if (response.error == null) {
      return CreateDBResponse(
        success: true,
        data: response.data,
      );
    } else {
      // Falha, com mensagem de erro
      return CreateDBResponse(
        success: false,
        errorMessage: response.error?.message,
      );
    }
  } catch (e) {
    // Falha, com exceção capturada
    return CreateDBResponse(
      success: false,
      errorMessage: e.toString(),
    );
  }
}
