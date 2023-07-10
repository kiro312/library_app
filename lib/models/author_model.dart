class AuthorModel {
  late int auhtorId;
  late String auhtorName;
  late String? auhtorEmail;
  late String? auhtorBio;

  AuthorModel({
    required this.auhtorId,
    required this.auhtorName,
     this.auhtorEmail,
     this.auhtorBio,
  });

  AuthorModel.fromJson(Map<String, dynamic> json) {
    auhtorId = json['id'];
    auhtorName = json['authorName'];
    auhtorEmail = json['authorEmail'];
    auhtorBio = json['authorBio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author_name'] = auhtorName;
    data['author_email'] = auhtorEmail;
    data['author_bio'] = auhtorBio;
    return data;
  }
}
