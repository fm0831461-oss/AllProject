import 'package:flutter/material.dart';
import 'package:project1/Project2/DataModels/data_model.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel model;
  ProfileScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("User Profile"), centerTitle: true),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 10,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // عشان الكارد ياخد حجم العناصر بس
                  children: [
                    // صورة المستخدم
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(model.imgeUrl),
                      backgroundColor: Colors.grey.shade200,
                    ),
                    const SizedBox(height: 16),

                    // اسم المستخدم
                    Text(
                      model.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // العمر
                    Text(
                      "${model.age} years old",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const Divider(height: 30, thickness: 1),

                    // باقي البيانات (الهاتف، الإيميل، العنوان)
                    _buildInfoRow(Icons.phone, model.phone),
                    const SizedBox(height: 12),
                    _buildInfoRow(Icons.email, model.email),
                    const SizedBox(height: 12),
                    _buildInfoRow(Icons.location_on, model.address),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // دالة مساعدة لتنظيم شكل كل سطر من البيانات بأيقونة
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueAccent, size: 22),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}
