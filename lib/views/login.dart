import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotted/assets/colors.dart';
import 'package:spotted/views/plans.dart';

import 'package:spotted/components/error_message.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  String errorText = '';
  int heightValue = 50;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    setState(() {
      errorText = ''; // Réinitialiser l'erreur texte à chaque appel de login
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Si la connexion réussit, userCredential contiendra les informations de l'utilisateur.

      // print('Successfully logged in!');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Plans()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          errorText =
              'Aucun utilisateur trouvé avec cet e-mail.'; // Assigner le message d'erreur approprié
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          errorText =
              'Mot de passe incorrect pour cet utilisateur.'; // Assigner le message d'erreur approprié
        });
      } else if (e.code == 'invalid-email') {
        setState(() {
          errorText =
              'Adresse e-mail invalide.'; // Assigner le message d'erreur approprié
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // message d'erreur
                  ErrorComponent(
                    errorText: errorText,
                  ),
                SizedBox(height: errorText.isEmpty ? 66 : 0),

                Center(
                  child: Image.asset(
                    'lib/assets/images/icons/logo.png',
                    width: 150,
                    height: 70,
                  ),
                ),

                const SizedBox(height: 80), // Marge supérieure
                // Marge supérieure
                Center(
                  child: Container(
                    width: 314,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          blurRadius: 13.7143,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(4.04161),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              hintStyle: TextStyle(
                                color: CustomColors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25), // Marge supérieure
                // Marge supérieure
                Center(
                  child: Container(
                    width: 314,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          blurRadius: 13.7143,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(4.04161),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              hintText: 'Mot de passe',
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              hintStyle: TextStyle(
                                color: CustomColors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 15),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Espace optionnel entre le texte et l'image
                      Image.asset(
                        'lib/assets/images/icons/carre.png',
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Se souvenir de mon compte',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.red,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.04161),
                    ),
                    fixedSize: const Size(150, 50),
                  ),
                  child: const Text(
                    "Se connecter",
                    style: TextStyle(
                      color: CustomColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 30), // Marge supérieure
                Center(
                  child: Container(
                    height: 0.5,
                    width: 312,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 30), // Marge supérieure
                Container(
                  width: 214,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        blurRadius: 15.6692,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(4.61772),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'lib/assets/images/icons/facebook.png',
                          width: 18,
                          height: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'S’inscrire avec Facebook',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20), // Marge supérieure
                Container(
                  width: 214,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        blurRadius: 15.6692,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(4.61772),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'lib/assets/images/icons/apple.png',
                          width: 18,
                          height: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'S’inscrire avec Apple',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
