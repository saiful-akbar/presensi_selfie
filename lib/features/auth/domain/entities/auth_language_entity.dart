class AuthLanguageEntity {
  final String langId;
  final String langName;

  AuthLanguageEntity({required this.langId, required this.langName});

  factory AuthLanguageEntity.fromJson(Map<String, dynamic> json) {
    return AuthLanguageEntity(
      langId: json['lang_id'],
      langName: json['lang_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'langId': langId, 'langName': langName};
  }
}
