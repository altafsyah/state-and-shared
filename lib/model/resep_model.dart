class Resep {
  List<Data>? data;

  Resep({this.data});

  Resep.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? resep;
  String? author;

  Data({this.id, this.resep, this.author});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resep = json['resep'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['resep'] = this.resep;
    data['author'] = this.author;
    return data;
  }
}
