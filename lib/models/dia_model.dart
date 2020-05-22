import 'atividade_model.dart';

class DiaModel {
  String data;
  List<AtividadeModel> atividades;

  DiaModel({this.data, this.atividades});

  DiaModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    if (json['atividades'] != null) {
      atividades = new List<AtividadeModel>();
      json['atividades'].forEach((v) {
        atividades.add(new AtividadeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    if (this.atividades != null) {
      data['atividades'] = this.atividades.map((v) => v.toJson()).toList();
    }
    return data;
  }
}