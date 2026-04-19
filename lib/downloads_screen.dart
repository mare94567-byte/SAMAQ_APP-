import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("المكتبة المحملة")),
      body: ListView.builder(
        itemCount: 0, // هنا ستظهر قائمة الفصول المحملة لاحقاً
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.file_download_done, color: Colors.green),
            title: Text("اسم المانجا - الفصل 1"),
            subtitle: Text("تم التحميل بنجاح"),
            trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () {}),
          );
        },
      ),
      // تنبيه في حال كانت المكتبة فارغة
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("تصفح المانجا لتحميل المزيد"),
        child: Icon(Icons.search),
      ),
    );
  }
}
