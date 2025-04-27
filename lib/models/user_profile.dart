// lib/models/user_profile.dart

class UserProfile {
  final String? id; // Firestore doc ID (optional for now)
  final String name;
  final String designation;
  final String imageUrl;
  final String pdfUrl;

  UserProfile({
    this.id,
    required this.name,
    required this.designation,
    required this.imageUrl,
    required this.pdfUrl,
  });

  // Convert from Firestore doc
  factory UserProfile.fromMap(Map<String, dynamic> data) {
    return UserProfile(
      name: data['name'] ?? '',
      designation: data['designation'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      pdfUrl: data['pdfUrl'] ?? '',
    );
  }

  // Convert to map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'designation': designation,
      'imageUrl': imageUrl,
      'pdfUrl': pdfUrl,
    };
  }
}
