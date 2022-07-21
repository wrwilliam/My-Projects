

import 'package:flutter/material.dart';

import 'AuthUtil.dart';
import 'Garage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF398BEF),
        automaticallyImplyLeading: true,
        title: const Text('Register'),
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
            padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
            child: TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                labelText: 'Confirm Password *',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: TextButton(
              onPressed: () async {
                final user = await createAccountWithEmailAndPassword(
                  emailAddressController.text,
                  passwordController.text,
                );
                if (user == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Register Failed! Try Again!'
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
              child: const Text('Register'),
            ),
          ),
        ],
      ),
    );
  }

}
