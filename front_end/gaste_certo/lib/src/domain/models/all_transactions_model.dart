class AllTransactions {
  String? id;
  String? nome;
  String? categoria;
  dynamic? valor;
  String? data;
  dynamic? iV;
  String? type;

  AllTransactions({
    this.id,
    this.nome,
    this.categoria,
    this.valor,
    this.data,
    this.iV,
    this.type,
  });

  AllTransactions.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    nome = json['nome'];
    categoria = json['categoria'];
    valor = json['valor'];
    data = json['data'];
    iV = json['__v'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['nome'] = nome;
    data['categoria'] = categoria;
    data['valor'] = valor;
    data['data'] = this.data;
    data['__v'] = iV;
    data['type'] = type;
    return data;
  }
}
