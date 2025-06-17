import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AdStacks Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: const [Header(), Expanded(child: DashboardContent())],
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset("assets/icon.jpg", width: 100),
            const SizedBox(height: 30),
            const Divider(color: Colors.black),
            Image.asset('assets/profile.png', width: 80),
            const SizedBox(height: 10),
            const Text(
              "Pooja Mishra",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("Admin", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            const Divider(color: Colors.black),

            sidebarItem(Icons.home, "Home"),
            sidebarItem(Icons.people, "Employees"),
            sidebarItem(Icons.access_time, "Attendance"),
            sidebarItem(Icons.summarize, "Summary"),
            sidebarItem(Icons.info, "Information"),

            ExpansionTile(
              title: const Text(
                "Workspaces",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(isExpanded ? Icons.remove : Icons.add),
              onExpansionChanged: (value) {
                setState(() {
                  isExpanded = value;
                });
              },
              children: [
                sidebarItem(Icons.workspaces, "Adstacks"),
                sidebarItem(Icons.attach_money, "Finance"),
              ],
            ),

            const SizedBox(height: 20),
            sidebarItem(Icons.settings, "Setting"),
            sidebarItem(Icons.logout, "Logout"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget sidebarItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: () {},
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Row(
        children: [
          const Text(
            "Home",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          SizedBox(
            width: 300,
            height: 40,
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.blueGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),

          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/dp.png'),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              bannerCard(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: allProjectsCard()),
                  const SizedBox(width: 16),
                  Expanded(child: topCreatorsCard()),
                ],
              ),
              const SizedBox(height: 16),
              performanceChart(),
            ],
          ),
        ),
        Expanded(flex: 2, child: rightSidebar()),
      ],
    );
  }

  Widget bannerCard() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.purple],
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Ethereum 2.0",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "Top Rating Project",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Trending project and high rating project created by team.",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Image.asset('assets/project1.jpg', height: 100),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget allProjectsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "All Projects",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          projectItem(
            "Technology behind the Blockchain",
            "assets/projects1.png",
            true,
          ),
          const Divider(),
          projectItem(
            "Technology behind the Blockchain",
            "assets/projects2.jpg",
            false,
          ),
          const Divider(),
          projectItem(
            "Technology behind the Blockchain",
            "assets/projectss3.png",
            false,
          ),
        ],
      ),
    );
  }

  Widget projectItem(String title, String imagePath, bool highlighted) {
    return ListTile(
      tileColor: highlighted ? Colors.pink[100] : Colors.transparent,
      leading: Image.asset(imagePath, width: 40),
      title: Text(title),
      subtitle: const Text("Project #1"),
      trailing: const Icon(Icons.edit, color: Colors.deepPurple),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget topCreatorsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Top Creators",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          creatorItem("@maddison_c21", "assets/tc1.png", 9821),
          creatorItem("@karwill02", "assets/tc2.png", 7032),
          creatorItem("@stephenie_mvp9", "assets/tc3.png", 9821),
        ],
      ),
    );
  }

  Widget creatorItem(String name, String imagePath, int artworks) {
    return ListTile(
      leading: Image.asset(imagePath, width: 40),
      title: Text(name),
      subtitle: Text("Artworks: $artworks"),
      trailing: const Icon(Icons.star, color: Colors.yellow),
    );
  }

  Widget performanceChart() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Over All Performance The Years",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Image.asset('assets/chart.jpg', fit: BoxFit.contain),
        ],
      ),
    );
  }

  Widget rightSidebar() {
    return Container(
      color: Colors.deepPurple,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          calendarCard(),
          const SizedBox(height: 16),
          eventCard("Today Birthday", 2),
          const SizedBox(height: 16),
          eventCard("Anniversary", 3),
        ],
      ),
    );
  }

  Widget calendarCard() {
    final today = DateTime.now();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text("GENERAL 10:00 AM TO 7:00 PM"),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: today,
            selectedDayPredicate: (day) => isSameDay(day, today),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              todayTextStyle: const TextStyle(color: Colors.white),
              selectedTextStyle: const TextStyle(color: Colors.white),
            ),
            onDaySelected: (selectedDay, focusedDay) {},
          ),
        ],
      ),
    );
  }

  Widget eventCard(String title, int total) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "✨ $title ✨",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: List.generate(total, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile${index + 1}.png'),
                ),
              );
            }),
          ),

          const SizedBox(height: 10),
          Text("Total: $total"),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            child: Text(
              title.contains('Birthday')
                  ? "Birthday Wishing"
                  : "Anniversary Wishing",
            ),
          ),
        ],
      ),
    );
  }
}
