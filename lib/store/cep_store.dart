import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_new/models/address.dart';
import 'package:xlo_new/repositories/cep_repository.dart';
part 'cep_store.g.dart';

class CepStore = _CepStore with _$CepStore;

abstract class _CepStore with Store {
  _CepStore() {
    autorun((_) {
      if (clearCep.length != 8) {
        _reset();
      } else {
        _searchCep();
      }
    });
  }

  @observable
  String cep = '';

  @action
  void SetCep(String value) => cep = value;

  @computed
  String get clearCep => cep.replaceAll(RegExp('[^0-9]'), '');

  @observable
  String error;

  @observable
  bool loading = false;

  @observable
  Address address;

  @action
  Future<void> _searchCep() async {
    loading = true;
    try {
      address = await CepRepository().getAdressFromApi(clearCep);
      error = null;
    } catch (e) {
      error = 'Erro ao buscar CEP';
      address = null;
    }
    loading = false;
  }

  @action
  void _reset() {
    error = null;
    address = null;
  }
}
