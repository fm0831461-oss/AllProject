import 'package:flutter/material.dart';
import 'package:project1/RandomUser/DataModels/data_model.dart';

class Details extends StatelessWidget {
  final UserModel model;
  const Details({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(model.imgeUrl),
                    backgroundColor: Colors.grey.shade200,
                  ),
                  const SizedBox(height: 16),

                  Text(
                    model.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Chip(
                    label: Text('Age: ${model.age}'),
                    backgroundColor: Colors.blue.shade50,
                    labelStyle: TextStyle(color: Colors.blue.shade800),
                  ),
                  const Divider(height: 32, thickness: 1),
                  _buildInfoRow(Icons.email, model.email),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.phone, model.phone),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.location_on, model.address),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // دالة مساعدة لعمل صف للأيقونة والنص بشكل منظم
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
