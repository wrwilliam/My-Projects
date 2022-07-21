

import 'package:flutter/material.dart';

import 'AuthUtil.dart';
import 'Garage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF398BEF),
        automaticallyImplyLeading: false,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 80, 20, 0),
            child: TextFormField(
              controller: emailAddressController,
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'Input Email Address Here...',
                labelText: 'Email *',
              ),
              validator: (String? string) {
                return (string != null && string.contains(RegExp(r'.+@.+'))) ? 'Use valid email address!' : null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
            child: TextFormField(
              controller: passwordController,
              obscureText: !passwordVisibility,
              decoration: InputDecoration(
                icon: const Icon(Icons.password),
                suffixIcon: InkWell(
                  child: Icon(
                    passwordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 22,
                  ),
                  onTap: () => setState(
                      () => passwordVisibility = !passwordVisibility,
                  )
                ),
                labelText: 'Password *',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: TextButton(
              onPressed: () async {
                final user = await signInWithEmail(
                  context,
                  emailAddressController.text,
                  passwordController.text,
                );
                if (user == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Login Failed! Try Again!'
                        )
                    )
                  );
                  return;
                }
                await GarageCollection.updateData();
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/garagelistpage',
                    (r) => false
                );
              },
              child: const Text('Login'),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                TextButton(
                    onPressed: () => {
                      Navigator.pushNamed(context, '/registerpage')
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}