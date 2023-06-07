import 'package:flutter/material.dart';

import '../model/model.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.data,
  });

  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 26,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.name!.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Enquiry No : ${data.enquiryNo}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              "Mobile : ${data.secondaryMobile!}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Assigned to : ${data.assignedTo!.employeeName!}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Enquiry Date : ${data.enquiryDate!}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Vehicle Model : ${data.vehicleModel!.model}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
