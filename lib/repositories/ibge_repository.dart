import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo_new/models/city.dart';
import 'package:xlo_new/models/uf.dart';

class IBGERpository {
  Future<List<UF>>getUFList() async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('UF_LIST')) {
      final j = json.decode(preferences.get('UF_LIST'));
      print('FOUND CACHE');
      return j.map<UF>((j) => UF.fromJson(j)).toList()
        ..sort((UF a, UF b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }
    print('NOT FOUND CACHE');

    const endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    try {
      final response = await Dio().get<List>(endpoint);
      preferences.setString('UF_LIST', json.encode(response.data));
      return response.data.map<UF>((j) => UF.fromJson(j)).toList()
        ..sort((  a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } on DioError {
      return Future.error('Falha ao obter lista de Estados');
    }
  }

  Future<List<City>> getCityListFromApi(UF uf) async {
    final String endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';
    try {
      final response = await Dio().get<List>(endpoint);
      final cityList = response.data.map<City>((j) => City.fromJson(j)).toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      return cityList;
    } on DioError {
      return Future.error('Falha ao obter lista de Cidades');
    }
  }
}
