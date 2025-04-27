
import 'package:flutter/material.dart';
import 'package:portfolio/home_tab_features/providers/home_providers.dart';
import 'package:provider/provider.dart';

import '../../models/skill.dart';



class SkillsDisplayPage extends StatelessWidget {
  const SkillsDisplayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample skills data


    return Consumer<HomeProviders>(
      builder: (context, homeProviders, child){
        return   ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: homeProviders.skills.length,
        itemBuilder: (context, index) {
        final skill = homeProviders.skills[index];
        return SkillCard(skill: skill);
        },
        );
      }
    );

  }
}

class SkillCard extends StatelessWidget {
  final Skill skill;

  const SkillCard({Key? key, required this.skill}) : super(key: key);

  Color _getProficiencyColor() {
    switch (skill.proficiency) {
      case "low":
        return Colors.blue;
      case "medium":
        return Colors.green;
      case "high":
        return Colors.orange;
      case "expert":
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  double _getProficiencyValue() {
    switch (skill.proficiency) {
      case "low":
        return 0.25;
      case "medium":
        return 0.5;
      case "high":
        return 0.75;
      case "expert":
        return 1.0;
      default:
        return 0.0;
    }
  }

  IconData _getProficiencyIcon() {
    switch (skill.proficiency) {
      case "low":
        return Icons.star_outline;
      case "medium":
        return Icons.star_half;
      case "high":
        return Icons.star;
      case "expert":
        return Icons.auto_awesome;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getProficiencyColor();
    final value = _getProficiencyValue();
    final icon = _getProficiencyIcon();

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Text(
                  skill.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    skill.proficiency,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: value,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(color),
                minHeight: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}