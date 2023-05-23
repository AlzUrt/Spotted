import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotted/assets/colors.dart';
import 'package:spotted/views/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotted/views/plans.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {

  final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
final TextEditingController nameController = TextEditingController();

Future<void> register() async {
  try {
    if (passwordController.text != confirmPasswordController.text) {
      // print('Passwords do not match!');
      return;
    }

    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    // print('══╡ User successfully registered!╞═══════════════════════════════════════════════════════════');

    // Ajouter le nom à Firestore
    CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
    DocumentReference? userDocRef = userCredential.user != null ? usersRef.doc(userCredential.user!.uid) : null;

    if (userDocRef != null) {
      await userDocRef.set({
        'name': nameController.text,
        'email': emailController.text,
      });

      // print('══╡ User successfully added to Firestore!╞═══════════════════════════════════════════════════════════');
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Plans()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      // print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      // print('The account already exists for that email.');
    }
  } catch (e) {
    // print(e);
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
                const SizedBox(
                    height:
                        100), // Espace vide pour pousser l'image vers le haut
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
                      children:  [
                        Expanded(
                          child: TextField(
                            controller: emailController,
                            decoration: const  InputDecoration(
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
                      children:  [
                        Expanded(
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              hintText: 'Nom complet',
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
                      children:  [
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
                      children:  [
                        Expanded(
                          child: TextField(
                            controller: confirmPasswordController,
                            decoration: const InputDecoration(
                              hintText: 'Répéter le mot de passe',
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

                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.red,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.04161),
                    ),
                    fixedSize: const Size(150, 50),
                  ),
                  child: const Text(
                    "S'inscrire",
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

                const SizedBox(height: 20), // Marge supérieure
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Vous avez déjà un compte ? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Text(
                        'Se connecter',
                        style: TextStyle(
                          fontSize: 14,
                          color: CustomColors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
