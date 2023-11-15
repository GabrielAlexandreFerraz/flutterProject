class Medicamento {
  String? nomeComercial;
  String? laboratorio;
  String? principioAtivo;
  String? posologia;
  String? dosagem;
  String? tipo;
  String? controlado;
  String? interacaoMedicamentosa;

  Medicamento(
      {this.nomeComercial,
      this.laboratorio,
      this.principioAtivo,
      this.posologia,
      this.dosagem,
      this.tipo,
      this.controlado,
      this.interacaoMedicamentosa});

  Medicamento.fromJson(Map<String, dynamic> json) {
    nomeComercial = json['nomeComercial'];
    laboratorio = json['laboratorio'];
    principioAtivo = json['principioAtivo'];
    posologia = json['posologia'];
    dosagem = json['dosagem'];
    tipo = json['tipo'];
    controlado = json['controlado'];
    interacaoMedicamentosa = json['interacaoMedicamentosa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomeComercial'] = this.nomeComercial;
    data['laboratorio'] = this.laboratorio;
    data['principioAtivo'] = this.principioAtivo;
    data['posologia'] = this.posologia;
    data['dosagem'] = this.dosagem;
    data['tipo'] = this.tipo;
    data['controlado'] = this.controlado;
    data['interacaoMedicamentosa'] = this.interacaoMedicamentosa;
    return data;
  }
}
