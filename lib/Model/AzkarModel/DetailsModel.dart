class DetailsModel {
  int? section_id;
  String? count;
  String? description;
  String? reference;
  String? content;

  DetailsModel(
      {this.section_id,
        this.count,
        this.description,
        this.reference,
        this.content});

  DetailsModel.fromJson(Map<String,dynamic>json){
    section_id=json['section_id'];
    count=json['count'];
    description=json['description'];
    reference=json['reference'];
    content=json['content'];
  }
}