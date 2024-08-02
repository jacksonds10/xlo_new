import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_new/repositories/category_repository.dart';
import 'package:xlo_new/screens/base/base/base_screen.dart';
import 'package:xlo_new/screens/category/category_screen.dart';
import 'package:xlo_new/store/category_store.dart';
import 'package:xlo_new/store/page_store.dart';
import 'package:xlo_new/store/user_manager_store.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());


//  final category = ParseObject('Categories')..set('Title','Camisetas')..set('Position',2);
//  final response = await category.save();
//  print(response.success);

// final category = ParseObject('Categories')
// ..set('Title','Moleton')
// ..set('Position',3);
// final response = await category.save();
// print (response.success);

// final category = ParseObject('Categories')
// ..objectId ='1xEcJqETXM'
// ..set('Position',3);
// final response = await category.save();
// print (response.success);

// final category = ParseObject('Categories')
// ..objectId ='1xEcJqETXM';

// category.delete();

// final response = await ParseObject('Categories').getAll();
// if(response.success){
//   for (final object in response.result){
//   print(object);
//   }
// }
// final query = QueryBuilder(ParseObject('Categories'));
// query.whereContains('Title', 'Camisetas');
// final response = await query.query();
// if(response.success){
//   print(response.result);

// }
}
void setupLocators(){
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManageStore());
  GetIt.I.registerSingleton(CategoryStore());
}

Future<void> initializeParse() async {
  await Parse().initialize('4FTscYPWTqRfcSaWP9q00MVt2rGMs7Kp2My6rc2a',
      'https://parseapi.back4app.com/',
      clientKey: 'l0r2LfizupSpMTC39SevKQII8O6Y9a3LjtXbqtaI',
      autoSendSessionId: true,
      debug: true);
final categorias = await CategoryRepository().getList();
print(categorias);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purple,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.purple,
      appBarTheme: AppBarTheme(
        elevation: 0,
      ),
      cursorColor: Colors.orange
      ),
      
      // home: BaseScren(),
      home: BaseScren(),
    );
  }}
