import 'package:flutter/material.dart';
import 'publish_screen.dart'; // استدعاء صفحة النشر

class SAMAQMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SAMAQ", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("قائمة SAMAQ", style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.cloud_upload, color: Colors.blue),
              title: Text("انشر أعمالك"),
              onTap: () {
                Navigator.pop(context); // إغلاق القائمة
                Navigator.push(context, MaterialPageRoute(builder: (context) => PublishWorkScreen()));
              },
            ),
          ],
        ),
      ),
      body: Center(child: Text("أهلاً بك في SAMAQ - الواجهة الرئيسية")),
    );
  }
}
