class ParceiroModel {
  String nome;
  String descricao;
  String imgLink;

  ParceiroModel({this.nome, this.descricao, this.imgLink});

  ParceiroModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    imgLink = json['img_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['img_link'] = this.imgLink;
    return data;
  }
}