import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:lojavirtual/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          TextButton(
            onPressed: (() {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: ((context) => SignupScreen())));
            }),
            child: const Text(
              'CRIAR CONTA',
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
        ],
      ),
      // Throught this model we can verify model's state
      body: ScopedModelDescendant<UserModel>(builder: ((context, child, model) {
        if (model.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: ((text) {
                  if (text!.isEmpty || !text.contains('@')) {
                    return 'Email inválido';
                  }
                }),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Senha',
                ),
                obscureText: true,
                validator: ((text) {
                  if (text!.isEmpty || text.length < 6) {
                    return 'Senha inválida';
                  }
                }),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Esqueci minha senha',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 44.0,
                child: ElevatedButton(
                  onPressed: (() {
                    if (_formKey.currentState!.validate()) {}
                    model.signIn();
                  }),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        );
      })),
    );
  }
}
