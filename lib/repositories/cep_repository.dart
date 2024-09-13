import 'package:dio/dio.dart';
import 'package:xlo_new/models/address.dart';
import 'package:xlo_new/models/city.dart';
import 'package:xlo_new/repositories/ibge_repository.dart';

class CepRepository {
  Future<Address> getAdressFromApi(String cep) async {
    if (cep == null || cep.isEmpty) return Future.error("Cep Inválido");
    final clearCep = cep.replaceAll(RegExp(r'[^0-9]'), '');

    if (clearCep.length != 8) return Future.error('CEP Inválido');

    final endpoint = 'http://viacep.com.br/ws/$clearCep/json';
    print(endpoint);
    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data.containsKey('erro') && response.data['erro'])
        return Future.error('CEP Inválido');

      final ufList = await IBGERpository().getUFList();
      return Address(
        cep: response.data['cep'],
        district: response.data['bairro'],
        logradouro: response.data['logradouro'],
        city: City(
            name: response.data['localidade']),
            uf: ufList.firstWhere((uf) => uf.initials==response.data['uf'])
      );
    } catch (e) {
      return Future.error('Falha ao buscar CEP');
    }
  }
}
