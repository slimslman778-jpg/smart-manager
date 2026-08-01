import 'package:flutter/material.dart';

void main() {
  runApp(const SmartManagerApp());
}

class SmartManagerApp extends StatelessWidget {
  const SmartManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مدير الأعمال الذكي',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'YE'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAlignment.center,
          children: const [
            Icon(Icons.video_library_rounded, size: 80, color: Colors.blueAccent),
            SizedBox(height: 20),
            Text(
              'تطبيق مدير الأعمال الذكي',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'تصميم وإعداد: عزت السراء',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool youtube = true;
  bool tiktok = true;
  bool facebook = true;
  bool autoPeak = true;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('مدير الأعمال الذكي'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueAccent.withOpacity(0.5)),
                ),
                child: Column(
                  children: const [
                    Icon(Icons.cloud_upload_outlined, size: 50, color: Colors.blueAccent),
                    SizedBox(height: 10),
                    Text('اضغط هنا لاختيار الفيديو من الهاتف', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'عنوان الفيديو',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _descController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'الوصف والهاشتاغات',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text('اختر منصات النشر:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              CheckboxListTile(
                title: const Text('يوتيوب (YouTube)'),
                value: youtube,
                onChanged: (val) => setState(() => youtube = val!),
              ),
              CheckboxListTile(
                title: const Text('تيك توك (TikTok)'),
                value: tiktok,
                onChanged: (val) => setState(() => tiktok = val!),
              ),
              CheckboxListTile(
                title: const Text('فيسبوك (Facebook)'),
                value: facebook,
                onChanged: (val) => setState(() => facebook = val!),
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('النشر في أوقات الذروة تلقائياً (6:00 - 9:00 مساءً)'),
                subtitle: const Text('لضمان أعلى نسبة مشاهدات وتفاعل'),
                value: autoPeak,
                onChanged: (val) => setState(() => autoPeak = val),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تمت جدولة ونشر الفيديو بنجاح في وقت الذروة!')),
                    );
                  },
                  child: const Text('جدولة ونشر الفيديو الآن 🚀', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
