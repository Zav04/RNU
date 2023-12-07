import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Controller/DataBaseConection.dart';
import '../Overlay/Overlay.dart';
import '../Controller/ChangePageOverlay.dart';
import 'package:flutter/services.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>
    with ErrorMessageOverlayMixin {
  final TextEditingController heathnumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Fecha o teclado ao tocar fora do campo de texto
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(50),
                      Container(
                        width: 365,
                        height: 270,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Logo.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(40),
                const Text(
                  'Insira um Número de Saúde',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  textAlign: TextAlign.left,
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: heathnumber,
                    keyboardType: TextInputType
                        .number, // Define o teclado para tipo numérico
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // Permite apenas dígitos
                      LengthLimitingTextInputFormatter(
                          9), // Limita a entrada a 9 dígitos
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Número de Utente',
                      border: OutlineInputBorder(),
                      hintText: 'Insira o seu Número de Utente',
                    ),
                  ),
                ),
                const Gap(10),
                ElevatedButton(
                  onPressed: () async {
                    //TODO MUDAR ESTA FUNÇÃO PARA RECEBER UM NUMERO E DEVOLVBER SE É VALIDO OU NÃO
                    bool isValid = await _dbIsEmailValid(heathnumber.text);
                    if (isValid) {
                      //TODO MUDAR ESTA FUNÇÃO PARA RECEBER UM NUMERO E DEVOLVBER SE EXISTE OU NÃO
                      isValid = await _dbEmailCheck(heathnumber.text);
                      if (isValid) {
                        removeErrorMessageOverlay();
                        showErrorMessageOverlay("Pedido enviado", 2,
                            action: ChangeToHome());
                      } else {
                        showErrorMessageOverlay(
                            'Número de Utente inserido não esta registado', 1);
                      }
                    } else {
                      showErrorMessageOverlay(
                          'Número de Utente não é um email valido', 1);
                    }
                  },
                  child: const Text(
                    'Recuperar Palavra-Passe',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<bool> _dbIsEmailValid(String email) async {
    bool status = await dbCheckEmailValid(email);
    return status;
  }

  Future<bool> _dbEmailCheck(String email) async {
    bool emailExists = await dbCheckEmailExists(email);
    return emailExists;
  }
}
