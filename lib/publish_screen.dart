import 'package:flutter/material.dart';

class PublishWorkScreen extends StatefulWidget {
  @override
  _PublishWorkScreenState createState() => _PublishWorkScreenState();
}

class _PublishWorkScreenState extends State<PublishWorkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("نشر عمل جديد")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: "اسم المانهوا")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // هنا سنربط دالة الـ SAMAQ Watermark لاحقاً
                print("تم بدء محرك الحماية...");
              },
              child: Text("اختر صور الفصل لرفعها"),
            ),
          ],
        ),
      ),
    );
  }
}
