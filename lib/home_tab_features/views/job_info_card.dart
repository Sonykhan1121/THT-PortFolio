import 'package:flutter/material.dart';
import 'package:portfolio/home_tab_features/providers/home_providers.dart';
import 'package:provider/provider.dart';

class JobInfoDetails extends StatelessWidget {
  const JobInfoDetails({super.key});

  Widget buildInfoRow(IconData icon, String label, String value, {Color? valueColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: Colors.blueAccent),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 28), // Indent the value a bit
          child: Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: valueColor ?? Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProviders>(
      builder: (context, homeProviders, child) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoRow(Icons.business_outlined, "Company", homeProviders.experiences[0].company),
                  buildInfoRow(Icons.work_outline, "Job Title", homeProviders.experiences[0].jobTitle),
                  buildInfoRow(Icons.calendar_month_outlined, "Start Date", homeProviders.experiences[0].startDate),
                  buildInfoRow(Icons.timer_outlined, "Working Duration", homeProviders.experiences[0].description),
                  buildInfoRow(
                    Icons.check_circle_outline,
                    "Current Status",
                    homeProviders.experiences[0].endDate,
                    valueColor: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        );
      }

    );
  }
}
