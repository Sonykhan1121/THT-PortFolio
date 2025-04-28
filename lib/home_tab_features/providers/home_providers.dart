import 'package:flutter/material.dart';
import 'package:portfolio/models/personal_information.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/models/service_model.dart';
import 'package:portfolio/models/user_profile.dart';
import 'package:portfolio/models/workexperience.dart';
import 'package:portfolio/services/userservice.dart';

import '../../models/skill.dart';
import '../../testimonial.dart';

class HomeProviders extends ChangeNotifier {
  List<UserProfile> profiles = [];
  List<personalInformation> personalInfos = [];
  List<WorkExperience> experiences = [];
  List<ServiceModel> services = [];
  List<Skill> skills = [];
  List<ProjectModel> projects = [];
  final List<Testimonial> testimonials = [
    Testimonial(
        quote: "Your app brings so much peace and tolerance to our home.",
        author: "Rachel, UK",
        location: "on meditation's positive effect on family life",
        context: "Context of the testimonial if needed"),
    Testimonial(
        quote:
            "I came to learn that the storyline in my head was holding me back.",
        author: "Peter, Belgium",
        location: "on what he learned when sitting with himself",
        context: "Context of the testimonial if needed"),
    Testimonial(
        quote:
            "Headspace provides me with a connection to myself, and a disconnection from negative thoughts, feelings, and sensations.",
        author: "Keri, UK",
        location: "on finding her happy place",
        context: "Context of the testimonial if needed"),
    Testimonial(
      quote: "The project exceeded all expectations. A true professional!",
      author: "Sophia, USA",
      location: "on delivering beyond the scope",
      context: "Project Delivery Feedback",
    ),
    Testimonial(
      quote: "Their attention to detail and creativity is unmatched.",
      author: "Liam, Canada",
      location: "on a creative design project",
      context: "Design Feedback",
    ),
    Testimonial(
      quote: "Effortless communication and fantastic results.",
      author: "Olivia, Australia",
      location: "on smooth project collaboration",
      context: "Collaboration Experience",
    ),
    Testimonial(
      quote: "They turned our ideas into reality perfectly.",
      author: "Noah, Germany",
      location: "on custom app development",
      context: "Custom Development",
    ),
    Testimonial(
      quote: "Very impressed with the professionalism and dedication.",
      author: "Emma, France",
      location: "on web app launch success",
      context: "Launch Success",
    ),
    Testimonial(
      quote: "Helped us scale our startup faster than we imagined.",
      author: "Oliver, Sweden",
      location: "on growth and scalability support",
      context: "Startup Scaling",
    ),
    Testimonial(
      quote: "Their designs helped boost our brand image massively.",
      author: "Ava, Spain",
      location: "on rebranding our company",
      context: "Branding Feedback",
    ),
    Testimonial(
      quote: "Exceeded deadlines and delivered flawless work.",
      author: "William, Italy",
      location: "on timely project delivery",
      context: "Deadline Management",
    ),
    Testimonial(
      quote: "Absolutely brilliant work, highly recommend!",
      author: "Mia, Netherlands",
      location: "on an e-commerce platform",
      context: "Platform Build",
    ),
    Testimonial(
      quote: "Brought fresh ideas and great energy to the project.",
      author: "James, Denmark",
      location: "on innovative project ideas",
      context: "Innovation and Creativity",
    ),
    Testimonial(
      quote: "Understood our needs perfectly from the start.",
      author: "Isabella, Switzerland",
      location: "on requirement gathering phase",
      context: "Understanding Client Needs",
    ),
    Testimonial(
      quote: "Amazing post-launch support and maintenance.",
      author: "Lucas, Norway",
      location: "on long-term project support",
      context: "Support and Maintenance",
    ),
    Testimonial(
      quote: "Professional, approachable, and highly skilled.",
      author: "Amelia, Ireland",
      location: "on website redesign",
      context: "Website Redesign",
    ),
    Testimonial(
      quote: "The UI/UX design has drastically improved our app usage.",
      author: "Benjamin, Belgium",
      location: "on user experience enhancements",
      context: "UX/UI Feedback",
    ),
    Testimonial(
      quote: "Great problem-solving skills and a positive attitude.",
      author: "Charlotte, Austria",
      location: "on overcoming technical challenges",
      context: "Technical Problem Solving",
    ),
  ];

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
      await getExperiences();
      await getSkills();
      await getProjects();

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

  Future<void> getExperiences() async {
    experiences = await dataService.getAllExperiences();
  }

  Future<void> getSkills() async {
    skills = await dataService.getAllSkills();
  }

  Future<void> getProjects() async {
    projects = await dataService.getAllProjects();
  }
}
