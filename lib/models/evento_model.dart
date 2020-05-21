class EventoModel {
  int id;
  String code;
  String img_link;
  String titulo;
  String data_inicio;
  String local;
  String descricao;
  // List<Parceiro> patrocinadores = [];
  List<dynamic> patrocinadores;

  EventoModel(
      {this.id,
      this.code,
      this.img_link,
      this.titulo,
      this.data_inicio,
      this.local,
      this.descricao,
      this.patrocinadores});

  EventoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    img_link = json['img_link'];
    titulo = json['titulo'];
    data_inicio = json['data_inicio'];
    local = json['local'];
    descricao = json['descricao'];
    patrocinadores = json['patrocinadores'];
  }
}
