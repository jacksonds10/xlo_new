import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_new/screens/login/login_screen.dart';
import 'package:xlo_new/store/page_store.dart';
import 'package:xlo_new/store/user_manager_store.dart';

class CustonDrawerHeader extends StatelessWidget {
  final UserManageStore userManageStore = GetIt.I<UserManageStore>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if(userManageStore.isLoggedin){
          GetIt.I<PageStore>().setPage(4);
        }
        else{

Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => LoginScrenn()));
        }
        
      },
      child: Container(
        color: Colors.purple,
        height: 95,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            Icon(Icons.person, color: Colors.white, size: 35),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    userManageStore.isLoggedin
                        ? userManageStore.user.name
                        : 'Acesse sua conta!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    userManageStore.isLoggedin
                        ? userManageStore.user.email
                        : 'Clique aqui',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
