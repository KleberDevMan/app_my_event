class AtividadeModel {
  String hora;
  String titulo;
  String descricao;
  String local;

  AtividadeModel({this.hora, this.titulo, this.descricao, this.local});

  AtividadeModel.fromJson(Map<String, dynamic> json) {
    hora = json['hora'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    local = json['local'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hora'] = this.hora;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['local'] = this.local;
    return data;
  }
}