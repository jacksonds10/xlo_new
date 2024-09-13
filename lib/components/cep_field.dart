import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_new/store/cep_store.dart';

class CepField extends StatelessWidget {
  final CepStore cepStore = CepStore();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          onChanged: cepStore.SetCep,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          decoration: InputDecoration(
              labelText: 'CEP *',
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18),
              contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10)),
        ),
        Observer(builder: (_) {
          if (cepStore.address == null &&
              cepStore.error == null &&
              !cepStore.loading) {
            return Container();
          } else if (cepStore.address == null && cepStore.error == null) {
            return LinearProgressIndicator(
              valueColor:AlwaysStoppedAnimation(Colors.purple),
              backgroundColor: Colors.transparent ,
            );
          } else if (cepStore.error != null) {
            return Container(
                            alignment: Alignment.center,

              color: Colors.red.withAlpha(100),
              height: 50,
              padding: EdgeInsets.all(8),
              child: Text(
                cepStore.error,
                style: TextStyle(fontWeight: FontWeight.w100, color: Colors.red),
              ),
            );
          } else {
            final a = cepStore.address; // Encapsulando corretamente dentro das chaves
            return Container(
              alignment: Alignment.center,
              color: Colors.purple.withAlpha(150),
              height: 50,
              padding: EdgeInsets.all(8),
              child: Text(
                  'Localização: ${a.district}, ${a.city?.name ?? "Bairro não disponível"}, ${a.uf?.initials ?? ""}',style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Colors.white
                  ),
                ),
            );
          }
        }),
      ],
    );
  }
}
