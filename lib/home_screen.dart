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
import 'package:flutter/material.dart';

// --- الكود المدمج والنهائي لمنصة SAMAQ ---

class SAMAQMainScreen extends StatefulWidget {
  @override
  _SAMAQMainScreenState createState() => _SAMAQMainScreenState();
}

class _SAMAQMainScreenState extends State<SAMAQMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SAMAQ", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      
      // --- القائمة الجانبية (Drawer) المدمجة بكل الميزات ---
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("مبدع SAMAQ"),
              accountEmail: Text("لوحة التحكم الاحترافية"),
              currentAccountPicture: CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.blue[900])),
              decoration: BoxDecoration(color: Colors.blue[900]),
            ),
            
            // 1. نشر عمل جديد
            ListTile(
              leading: Icon(Icons.add_photo_alternate, color: Colors.blue),
              title: Text("انشر عمل جديد"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => PublishWorkScreen()));
              },
            ),

            // 2. إدارة الأعمال (تعديل وحذف) - الميزة الجديدة
            ListTile(
              leading: Icon(Icons.edit_note, color: Colors.amber),
              title: Text("إدارة أعمالي (تعديل/حذف)"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ManageWorksScreen()));
              },
            ),

            // 3. المكتبة والتحميلات
            ListTile(
              leading: Icon(Icons.download_done_rounded, color: Colors.green),
              title: Text("المكتبة والتحميلات"),
              onTap: () {
                Navigator.pop(context);
                // كود صفحة المكتبة هنا
              },
            ),

            Divider(),
            
            // 4. إعدادات الحماية
            ListTile(
              leading: Icon(Icons.security, color: Colors.redAccent),
              title: Text("إعدادات حماية SAMAQ"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(child: Text("أهلاً بك في SAMAQ - ابدأ بنشر إبداعك")),
    );
  }
}

// --- صفحة إدارة الأعمال (تعديل وحذف) ---
class ManageWorksScreen extends StatelessWidget {
  // قائمة تجريبية للأعمال
  final List<String> myWorks = ["مانهوا الصياد", "مانهوا المملكة", "البرج العظيم"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إدارة أعمالي")),
      body: ListView.builder(
        itemCount: myWorks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(Icons.book, color: Colors.blue),
              title: Text(myWorks[index]),
              subtitle: Text("حالة العمل: مستمر"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: Icon(Icons.edit, color: Colors.amber), onPressed: () {}),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // حوار تأكيد الحذف
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("تأكيد الحذف"),
                          content: Text("هل أنت متأكد من حذف ${myWorks[index]}؟"),
                          actions: [
                            TextButton(child: Text("إلغاء"), onPressed: () => Navigator.pop(context)),
                            TextButton(child: Text("حذف", style: TextStyle(color: Colors.red)), onPressed: () => Navigator.pop(context)),
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

// --- صفحة النشر (التي تعملين عليها حالياً) ---
class PublishWorkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("نشر عمل جديد")),
      body: Center(child: Text("واجهة رفع الـ 50 صورة والعلامة المائية")),
    );
  }
}
