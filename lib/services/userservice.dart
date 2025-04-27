import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/achievement.dart';
import '../models/personal_information.dart';
import '../models/service_model.dart';
import '../models/user_profile.dart'; // import your models
// import other models similarly...

class DataService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get all users as UserProfile objects
  Future<List<UserProfile>> getAllUsers() async {
    final querySnapshot = await _firestore.collection('users').get();

    return querySnapshot.docs
        .map((doc) => UserProfile.fromMap({'id': doc.id, ...doc.data()}))
        .toList();
  }

  // Get all achievements
  Future<List<Achievement>> getAllAchievements() async {
    final querySnapshot = await _firestore.collection('achievement').get();

    return querySnapshot.docs
        .map((doc) => Achievement.fromMap({'id': doc.id, ...doc.data()}))
        .toList();
  }

  // If you don't have models for other collections yet, you can keep them like this:
  Future<List<Map<String, dynamic>>> getAllAbout() async {
    final querySnapshot = await _firestore.collection('about').get();

    return querySnapshot.docs
        .map((doc) => {'id': doc.id, ...doc.data()})
        .toList();
  }

  Future<List<Map<String, dynamic>>> getAllExperiences() async {
    final querySnapshot = await _firestore.collection('experiences').get();

    return querySnapshot.docs
        .map((doc) => {'id': doc.id, ...doc.data()})
        .toList();
  }

  Future<List<personalInformation>> getAllPersonalInfo() async {
    final querySnapshot =
        await _firestore.collection('personalInformation').get();

    return querySnapshot.docs
        .map(
            (doc) => personalInformation.fromMap({'id': doc.id, ...doc.data()}))
        .toList();
  }

  Future<List<Map<String, dynamic>>> getAllProjects() async {
    final querySnapshot = await _firestore.collection('projects').get();

    return querySnapshot.docs
        .map((doc) => {'id': doc.id, ...doc.data()})
        .toList();
  }

  Future<List<ServiceModel>> getAllServices() async {
    final querySnapshot = await _firestore.collection('services').get();

    return querySnapshot.docs
        .map((doc) => ServiceModel.fromMap({'id': doc.id, ...doc.data()}))
        .toList();
  }

  Future<List<Map<String, dynamic>>> getAllSkills() async {
    final querySnapshot = await _firestore.collection('skills').get();

    return querySnapshot.docs
        .map((doc) => {'id': doc.id, ...doc.data()})
        .toList();
  }
}
