class ServiceModel {
  String? id; // Nullable id
  String title;
  String description;
  String? imageUrl;

  // Constructor
  ServiceModel({
    this.id,
    required this.title,
    required this.description,
    this.imageUrl,
  });

  // fromMap to convert a map to ServiceModel
  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'], // Nullable field
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'], // if the image is null, we return null
    );
  }

  // toMap to convert ServiceModel to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl, // Only store the path if image is not null
    };
  }
}
