import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_new/screens/signup/components/error_box.dart';
import 'package:xlo_new/screens/signup/sigup_screen.dart';
import 'package:xlo_new/store/login_store.dart';

class LoginScrenn extends StatefulWidget {
  @override
  State<LoginScrenn> createState() => _LoginScrennState();
}

class _LoginScrennState extends State<LoginScrenn> {
  final LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Acessar com E-mail.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                    ),
                  ),
                  Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.only(top:8),
                      child: ErrorBox(
                        message: loginStore.error,
                      ),
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.only(left: 3, bottom: 4, top: 8),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !loginStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: loginStore.emailError),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Senha',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          'Esqueceu sua senha',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !loginStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: loginStore.passwordError),
                        obscureText: true,
                        onChanged: loginStore.setPassword,
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Observer(builder: (_) {
                    return Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(vertical: 12),
                      child: RaisedButton(
                          color: Colors.orange,
                          disabledColor: Colors.orange.withAlpha(120),
                          child: loginStore.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text('ENTRAR'),
                          textColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: loginStore.loginPressed),
                    );
                  }),
                  Divider(
                    color: Colors.black,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        'Não tem uma conta',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 5), // Espaço entre os textos
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => SignUpScreen()));
                        },
                        child: Text(
                          'Cadastre-se',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors
                                .purple, // Altere a cor conforme necessário
                            decoration: TextDecoration
                                .underline, // Para enfatizar que é clicável
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
