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
}
