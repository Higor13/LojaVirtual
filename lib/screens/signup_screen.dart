import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nome Completo',
              ),
              validator: ((text) {
                if (text!.isEmpty) {
                  return 'Nome inválido';
                }
              }),
            ),
            const SizedBox(height: 16.0),
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
            const SizedBox(height: 16.0),
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
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Endereço',
              ),
              validator: ((text) {
                if (text!.isEmpty) {
                  return 'Endereço inválido';
                }
              }),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 44.0,
              child: ElevatedButton(
                onPressed: (() {
                  if (_formKey.currentState!.validate()) {}
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'Criar Conta',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
