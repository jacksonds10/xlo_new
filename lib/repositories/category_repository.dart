import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_new/models/category.dart';
import 'package:xlo_new/repositories/parse_errors.dart';
import 'package:xlo_new/repositories/table_keys.dart';

class CategoryRepository {
  Future<List<Category>>getList()async {
    final queryBuilder = QueryBuilder(ParseObject(KeyCategoryTable))
    ..orderByAscending(KeyCategoryDescription);
    final response = await queryBuilder.query();
    if(response.success){
      return response.results.map((p) => Category.fromParse(p)).toList();

    }
    else {
      throw ParseErrors.getDescription(response.error.code);
    }
  }
}

