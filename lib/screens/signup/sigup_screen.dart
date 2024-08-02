import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_new/screens/signup/components/error_box.dart';
import 'package:xlo_new/screens/signup/components/field_title.dart';
import 'package:xlo_new/store/sigup_store.dart';


class SignUpScreen extends StatelessWidget {
  final SignupStore signupStore = SignupStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Card(
            margin: EdgeInsets.symmetric(
              horizontal: 32,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Observer(builder:(_){
                   return ErrorBox(
                    message:signupStore.error
                   );
                  },),
                  FieldTitle(
                    title: 'Apelido',
                    subtitle: ' Como apareceáe em seus anuncios',
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !signupStore.loading,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Exemplo: João .S',
                          isDense: true,
                          errorText: signupStore.nameError),
                      onChanged: signupStore.setName,
                    );
                  }),
                  SizedBox(
                    height: 16,
                  ),
                  FieldTitle(
                    title: 'E-mail',
                    subtitle: 'Enviaremos um e-mail de confirmação',
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: joao@gmail.com',
                            isDense: true,
                            errorText: signupStore.emailError),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        onChanged: signupStore.setEmail,
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  FieldTitle(
                    title: 'Celular',
                    subtitle: 'Proteja sua conta',
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '(11) 99999-9999)',
                            isDense: true,
                            errorText: signupStore.phoneError),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                        onChanged: signupStore.setPhone,
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  FieldTitle(
                    title: 'Senha',
                    subtitle: 'Use letras, númeos e caracteres especiais',
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: signupStore.pass1Error),
                        obscureText: true,
                        onChanged: signupStore.setPass1,
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  FieldTitle(
                    title: 'Confirmar Senha',
                    subtitle: 'Repita a a senha',
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: signupStore.pass2Error),
                        obscureText: true,
                        onChanged: signupStore.setPass2,
                      );
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return signupStore.loading
                          ? Center(child: CircularProgressIndicator())
                          : RaisedButton(
                              color: Colors.orange,
                              disabledColor: Colors.orange.withAlpha(120),
                              child: Text('Cadastrar'),
                              textColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: signupStore.signUpPressed,
                            );
                    },
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Já tem uma conta?',
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.purple,
                                  fontSize: 16),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
