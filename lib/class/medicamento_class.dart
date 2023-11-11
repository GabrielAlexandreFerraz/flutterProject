class Medicamento {
  int? id;
  String? nome;
  String? posologia;
  String? dosagem;
  String? tipo;
  String? controlado;

  Medicamento(
      {this.id,
      this.nome,
      this.posologia,
      this.dosagem,
      this.tipo,
      this.controlado});

  Medicamento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    posologia = json['posologia'];
    dosagem = json['dosagem'];
    tipo = json['tipo'];
    controlado = json['controlado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['posologia'] = this.posologia;
    data['dosagem'] = this.dosagem;
    data['tipo'] = this.tipo;
    data['controlado'] = this.controlado;
    return data;
  }
}
