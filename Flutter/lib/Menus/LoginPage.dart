import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Controller/PasswordField.dart';
import 'ForgotPassWord.dart';
import 'CreateUser.dart';
import '../Class/Class_User.dart';
import '../Controller/DataBaseConection.dart';
import '../Overlay/Overlay.dart';
import '../Controller/ChangePageOverlay.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ErrorMessageOverlayMixin {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nssController = TextEditingController();
  User validUser = User(userId: 0);
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
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(90),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _nssController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Numero de Saúde',
                        hintText:
                            'Insira um Numero de Saúde válido como 123456789'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: PasswordField(controller: _passwordController),
                ),
                const Gap(10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ForgotPassword()));
                  },
                  child: const Text(
                    'Esqueceu-se da sua Palavra passe',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(119, 212, 252,
                            1.0)), // Você pode personalizar a cor
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(119, 212, 252, 1.0),
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () async {
                      var validation = await login(
                          nss: _nssController.text,
                          password: _passwordController.text);
                      if (validation.success == true) {
                        validUser.userId = validation.data;
                        showErrorMessageOverlay("Login efetuado com Sucesso", 2,
                            action: ChangeToMainMenu(user: validUser));
                      } else {
                        if (validation.errorMessage == null) {
                          showErrorMessageOverlay("Credenciais Invalidas", 1);
                        } else {
                          showErrorMessageOverlay(
                              validation.errorMessage.toString(), 1);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(
                          119, 212, 252, 1.0), // Esta é a cor de fundo do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const CreateUser()));
                  },
                  child: const Text(
                    'Novo Utilizador? Criar conta',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(119, 212, 252,
                            1.0)), // Você pode personalizar a cor
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
