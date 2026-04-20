import 'package:flutter/material.dart';

void main() {
  runApp(SamaqApp());
}

class SamaqApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAMAQ APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SAMAQMainScreen(),
    );
  }
}

class SAMAQMainScreen extends StatefulWidget {
  @override
  _SAMAQMainScreenState createState() => _SAMAQMainScreenState();
}

class _SAMAQMainScreenState extends State<SAMAQMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SAMAQ", style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.blue[900]),
      ),
      
      // --- القائمة الجانبية (Drawer) المدمجة ---
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("مبدع SAMAQ", style: TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: Text("لوحة التحكم الاحترافية"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.blue[900]),
              ),
              decoration: BoxDecoration(color: Colors.blue[900]),
            ),
            
            ListTile(
              leading: Icon(Icons.add_photo_alternate, color: Colors.blue),
              title: Text("انشر عمل جديد"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => PublishWorkScreen()));
              },
            ),

            ListTile(
              leading: Icon(Icons.edit_note, color: Colors.amber[700]),
              title: Text("إدارة أعمالي (تعديل/حذف)"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ManageWorksScreen()));
              },
            ),

            ListTile(
              leading: Icon(Icons.library_books, color: Colors.green),
              title: Text("المكتبة والتحميلات"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            Divider(),
            
            ListTile(
              leading: Icon(Icons.security, color: Colors.redAccent),
              title: Text("إعدادات حماية SAMAQ"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_stories, size: 80, color: Colors.blue[100]),
            SizedBox(height: 20),
            Text("أهلاً بك في SAMAQ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("بانتظار إبداعك القادم..", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

// --- صفحة إدارة الأعمال (تعديل وحذف) ---
class ManageWorksScreen extends StatelessWidget {
  final List<String> myWorks = ["مانهوا الصياد", "مانهوا المملكة", "البرج العظيم"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إدارة أعمالي"), backgroundColor: Colors.blue[900]),
      body: ListView.builder(
        itemCount: myWorks.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              leading: Icon(Icons.menu_book, color: Colors.blue),
              title: Text(myWorks[index], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("حالة العمل: مستمر"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.amber[800]),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("جاري فتح واجهة التعديل...")));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("حذف العمل؟"),
                          content: Text("هل أنت متأكد من حذف ${myWorks[index]} نهائياً؟"),
                          actions: [
                            TextButton(child: Text("إلغاء"), onPressed: () => Navigator.pop(context)),
                            TextButton(
                              child: Text("حذف", style: TextStyle(color: Colors.red)),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// --- صفحة النشر ---
class PublishWorkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("نشر عمل جديد"), backgroundColor: Colors.blue[900]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.upload_file, size: 100, color: Colors.blue[200]),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_a_photo),
              label: Text("اختر فصول المانهوا (حتى 50 صورة)"),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
