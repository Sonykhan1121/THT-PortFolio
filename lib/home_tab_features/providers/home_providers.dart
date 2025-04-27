import 'package:flutter/material.dart';
import 'package:portfolio/models/personal_information.dart';
import 'package:portfolio/models/service_model.dart';
import 'package:portfolio/models/user_profile.dart';
import 'package:portfolio/services/userservice.dart';

class HomeProviders extends ChangeNotifier {
  List<UserProfile> profiles = [];
  List<personalInformation> personalInfos = [];
  List<ServiceModel> services = [];
  final DataService dataService = DataService();

  bool isLoading = true;

  HomeProviders() {
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading = true;
      notifyListeners();

      await getProfile();
      await getPersonalInfo();
      await getServices();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('Error loading data: $e');
    }
  }

  Future<void> getServices() async {
    services = await dataService.getAllServices();
  }

  Future<void> getProfile() async {
    profiles = await dataService.getAllUsers();
  }

  Future<void> getPersonalInfo() async {
    personalInfos = await dataService.getAllPersonalInfo();
  }
}
