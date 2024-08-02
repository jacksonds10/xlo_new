import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_new/components/category_field.dart';
import 'package:xlo_new/components/custom_drawer.dart';
import 'package:xlo_new/components/images_field.dart';
import 'package:xlo_new/store/create_store.dart';

class CreateScreen extends StatelessWidget {
  final CreateStore createStore = CreateStore();

  @override
  Widget build(BuildContext context) {

    final labelStyle = TextStyle(
        fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 18);
    final contentPadding = EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Criar Anuncio'),
        centerTitle: true,
      ),
      body: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ImagesField(createStore),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Titulo*',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                    fontSize: 18),
                contentPadding: contentPadding,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Descrição*',
                labelStyle: labelStyle,
                contentPadding: contentPadding,
                
              ),
              maxLines: 3,
            ),
            CategoryField(createStore),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Preço*',
                  labelStyle: labelStyle,
                  contentPadding: contentPadding,
                  prefixText: 'R\$'),

              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                RealInputFormatter(centavos: true),
              ],
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
