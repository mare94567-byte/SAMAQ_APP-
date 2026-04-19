import 'package:flutter/material.dart';

class PublishWorkScreen extends StatefulWidget {
  @override
  _PublishWorkScreenState createState() => _PublishWorkScreenState();
}

class _PublishWorkScreenState extends State<PublishWorkScreen> {
  String status = "مستمر"; // الحالة الافتراضية للعمل

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("نشر عمل جديد في SAMAQ"),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قسم اختيار غلاف المانهوا
            Text("غلاف العمل:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () => print("فتح الاستوديو لاختيار الغلاف"),
                child: Container(
                  height: 200,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo, size: 40, color: Colors.blue),
                      SizedBox(height: 5),
                      Text("إضافة غلاف", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),

            // حقول إدخال البيانات
            TextField(
              decoration: InputDecoration(
                labelText: "اسم المانهوا",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.book),
              ),
            ),
            SizedBox(height: 15),
            
            DropdownButtonFormField(
              value: status,
              items: ["مستمر", "مكتمل", "متوقف"]
                  .map((e) => DropdownMenuItem(child: Text(e), value: e))
                  .toList(),
              onChanged: (val) => setState(() => status = val.toString()),
              decoration: InputDecoration(
                labelText: "حالة العمل",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),

            // زر اختيار فصول المانهوا
            Text("رفع الفصول:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 55),
                backgroundColor: Colors.grey[900],
                side: BorderSide(color: Colors.blue),
              ),
              icon: Icon(Icons.collections, color: Colors.blue),
              label: Text("اختيار صور الفصل (سيتم حمايتها بـ SAMAQ)"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("جاري تحضير محرك SAMAQ لمعالجة الصور..."))
                );
              },
            ),
            
            SizedBox(height: 40),

            // زر النشر النهائي
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: Colors.blue[700],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                // هنا سنربط دالة applySamaqWatermark لاحقاً
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(backgroundColor: Colors.green, content: Text("جاري معالجة الصور ورفعها للمنصة..."))
                );
              },
              child: Text("نشر العمل الآن", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
