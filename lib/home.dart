import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.grey[200],
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 52, 49, 57)),
              accountName: Text(
                "College-Ui",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "collegeui@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const AboutListTile(
              // <-- SEE HERE
              icon: Icon(
                Icons.info,
              ),
              applicationIcon: Icon(
                Icons.android,
              ),
              applicationName: 'College Ui',
              applicationVersion: '1.0.0',
              applicationLegalese: '© 2023 AvCreations',
              aboutBoxChildren: [
                ///Content goes here...
              ],
              child: Text('About app'),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          VxArc(
            height: 18,
            child: VxBox()
                .sizePCT(context: context, widthPCT: 200, heightPCT: 16)
                .gradientFromTo(
                    from: const Color.fromARGB(214, 37, 188, 200),
                    to: Colors.purple.shade300)
                .make(),
          ).glassMorphic(),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person),
                ),
                "Welcome ! Av"
                    .text
                    .size(25)
                    .color(Colors.white)
                    .textStyle(const TextStyle(
                      fontWeight: FontWeight.w500,
                    ))
                    .make()
                    .p16(),
                const SizedBox(
                  width: 50,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 32,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _key.currentState!.openEndDrawer(); //<-- SEE HERE
                  },
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 100.0,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                childAspectRatio: 1 / 1.05,
                mainAxisSpacing: 20,
                children: [
                  buildCard(
                    Icons.person,
                    Colors.redAccent.withAlpha(180),
                    "Personal Info",
                  ),
                  buildCard(
                    Icons.calendar_view_month,
                    Colors.indigoAccent.withAlpha(180),
                    "Time Table",
                  ),
                  buildCard(
                    Icons.read_more,
                    Colors.pinkAccent.withAlpha(180),
                    "Study Result",
                  ),
                  buildCard(
                    Icons.announcement,
                    Colors.purpleAccent.withAlpha(180),
                    "Attendance Recap",
                  ),
                  buildCard(
                    Icons.book_online,
                    Colors.blueAccent.withAlpha(180),
                    "Course Booking",
                  ),
                  buildCard(
                    Icons.person,
                    Colors.orangeAccent.withAlpha(180),
                    "Course Plan",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buildCard(icon, Color color, text) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(30)),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
