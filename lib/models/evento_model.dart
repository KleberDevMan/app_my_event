import 'dia_model.dart';
import 'parceiro_model.dart';

class EventoModel {
  int id;
  String code;
  String imgLink;
  String titulo;
  String dataInicioS;
  String local;
  String descricao;
  List<ParceiroModel> patrocinadores;
  List<ParceiroModel> apoiadores;
  List<ParceiroModel> organizadores;
  List<DiaModel> dias;

  EventoModel(
      {this.id,
      this.code,
      this.imgLink,
      this.titulo,
      this.dataInicioS,
      this.local,
      this.descricao,
      this.patrocinadores,
      this.apoiadores,
      this.organizadores});

  EventoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    imgLink = json['img_link'];
    titulo = json['titulo'];
    dataInicioS = json['data_inicio_s'];
    local = json['local'];
    descricao = json['descricao'];
    if (json['patrocinadores'] != null) {
      patrocinadores = new List<ParceiroModel>();
      json['patrocinadores'].forEach((v) {
        patrocinadores.add(new ParceiroModel.fromJson(v));
      });
    }
    if (json['apoiadores'] != null) {
      apoiadores = new List<ParceiroModel>();
      json['apoiadores'].forEach((v) {
        apoiadores.add(new ParceiroModel.fromJson(v));
      });
    }
    if (json['organizadores'] != null) {
      organizadores = new List<ParceiroModel>();
      json['organizadores'].forEach((v) {
        organizadores.add(new ParceiroModel.fromJson(v));
      });
    }
  }

  void addDias(Map<String, dynamic> json) {
    if (json['dias'] != null) {
      dias = new List<DiaModel>();
      json['dias'].forEach((v) {
        dias.add(new DiaModel.fromJson(v));
      });
    }
  }
  Map<String, dynamic> diastoJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dias != null) {
      data['dias'] = this.dias.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['img_link'] = this.imgLink;
    data['titulo'] = this.titulo;
    data['data_inicio_s'] = this.dataInicioS;
    data['local'] = this.local;
    data['descricao'] = this.descricao;
    if (this.patrocinadores != null) {
      data['patrocinadores'] =
          this.patrocinadores.map((v) => v.toJson()).toList();
    }
    if (this.apoiadores != null) {
      data['apoiadores'] = this.apoiadores.map((v) => v.toJson()).toList();
    }
    if (this.organizadores != null) {
      data['organizadores'] =
          this.organizadores.map((v) => v.toJson()).toList();
    }
    return data;
  }
}