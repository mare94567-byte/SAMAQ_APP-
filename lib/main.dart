import 'package:flutter/material.dart';

void main() => runApp(SamaqApp());

class SamaqApp extends StatefulWidget {
  @override
  _SamaqAppState createState() => _SamaqAppState();
}

class _SamaqAppState extends State<SamaqApp> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAMAQ',
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: SAMAQMainScreen(
        onThemeChanged: () => setState(() => isDarkMode = !isDarkMode),
        isDarkMode: isDarkMode,
      ),
    );
  }
}

class SAMAQMainScreen extends StatelessWidget {
  final VoidCallback onThemeChanged;
  final bool isDarkMode;

  SAMAQMainScreen({required this.onThemeChanged, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("SAMAQ", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(
              icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
              onPressed: onThemeChanged,
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "أحدث الفصول"),
              Tab(text: "الأكثر شعبية"),
              Tab(text: "التصنيفات"),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("مستخدم SAMAQ"),
                accountEmail: Text("user@samaq.com"),
                currentAccountPicture: CircleAvatar(backgroundColor: Colors.blue, child: Icon(Icons.person)),
                decoration: BoxDecoration(color: Colors.blueGrey),
              ),
              ListTile(leading: Icon(Icons.login), title: Text("تسجيل الدخول"), onTap: () {}),
              ListTile(leading: Icon(Icons.library_books), title: Text("المكتبة"), onTap: () {}),
              ListTile(leading: Icon(Icons.history), title: Text("سجل المشاهدة"), onTap: () {}),
              ListTile(leading: Icon(Icons.cloud_upload), title: Text("انشر أعمالك"), onTap: () {}),
              ListTile(leading: Icon(Icons.file_download), title: Text("التحميلات"), onTap: () {}),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildMangaGrid("New"), // خانة أحدث الفصول
            buildMangaGrid("Hot"), // خانة الأكثر شعبية
            Center(child: Text("قائمة التصنيفات الشهيرة")),
          ],
        ),
      ),
    );
  }

  // دالة عرض الأعمال (3 في كل سطر)
  Widget buildMangaGrid(String type) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 10, // مجرد رقم تجريبي
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Icon(Icons.image, color: Colors.white24)),
              ),
            ),
            SizedBox(height: 4),
            Text("اسم المانهوا", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), maxLines: 1),
            Row(
              children: [
                Text("فصل 1", style: TextStyle(fontSize: 9, color: Colors.blue)),
                Spacer(),
                if (type == "New") Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  color: Colors.red,
                  child: Text("جديد", style: TextStyle(fontSize: 8, color: Colors.white)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
