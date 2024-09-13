// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:xlo_new/models/city.dart';
import 'package:xlo_new/models/uf.dart';

class Address {
  Address({
    this.uf,
    this.city,
    this.cep,
    this.district, logradouro
  });
  UF uf;
  City city;
  String cep;
  String district;
  

@override
  String toString(){
    return '*****Address(uf: $uf,city: $city,cep:$cep, district: $district)******';

  }
}
