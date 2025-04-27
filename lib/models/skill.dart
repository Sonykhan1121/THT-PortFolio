class Skill {
  final String? id;
  final String name;
  final String proficiency;

  Skill({ this.id,required this.name, required this.proficiency});

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name': name,
      'proficiency': proficiency,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id'],
      name: map['name'] ?? '',
      proficiency: map['proficiency'] ?? '',
    );
  }
}
