import 'package:flutter/material.dart';
import 'package:xlo_new/components/custom_drawer_header.dart';
import 'package:xlo_new/components/page_secction.dart';


class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
          child: SizedBox(
        width:MediaQuery.of(context).size.width *0.6 ,
        child: Drawer(
          child: ListView(children: <Widget>[
            CustonDrawerHeader(),
            PageSection(),
          ],),
        )),
    );
  }
}