
import 'package:flutter/material.dart';
import 'package:ola_app_1/bookanolacab.dart';
import 'package:ola_app_1/searchola.dart';
import 'package:ola_app_1/scooty.dart';
import 'package:video_player/video_player.dart';
import 'package:ola_app_1/global.dart';
import 'package:ola_app_1/theresola.dart';
import 'package:ola_app_1/innovation.dart';
import 'package:ola_app_1/experience.dart';
import 'package:ola_app_1/makingdifference.dart';
import 'package:ola_app_1/ola.dart';
import 'package:ola_app_1/recent.dart';
import 'package:ola_app_1/downloadapp.dart';
import 'package:ola_app_1/footer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();
     
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.setSettings(
  appVerificationDisabledForTesting: true,
  phoneNumber: '+916357892110',
  smsCode: '123456',
);
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    ),
  );
}
Future<void> saveRide() async {
  await FirebaseFirestore.instance.collection('rides').add({
    'pickup': 'Kampala',
    'destination': 'Entebbe',
    'rideType': 'Daily',
    'createdAt': FieldValue.serverTimestamp(),
  });
}


class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late VideoPlayerController controller;
final ScrollController pageScrollController = ScrollController();


  // This controls whether the three-dot menu is visible
 
  bool isMenu = false;

 
@override
void initState() {
  super.initState();

  controller = VideoPlayerController.asset(
    'assets/videos/olavideo.mp4',
  );

  controller.initialize().then((_) async {
    print("3. VIDEO INITIALIZED");
    print("VIDEO SIZE: ${controller.value.size}");
    print("VIDEO DURATION: ${controller.value.duration}");

    await controller.setLooping(true);
    await controller.setVolume(0);

    if (!mounted) return;

    setState(() {});

    print("4. CALLING PLAY");

    //await controller.play();

    print("5. VIDEO PLAYING");
  }).catchError((error) {
    print("VIDEO ERROR: $error");
  });
}
String formatTime(Duration duration) {
  String twoDigits(int number) {
    return number.toString().padLeft(2, '0');
  }

  String minutes = twoDigits(duration.inMinutes);
  String seconds = twoDigits(duration.inSeconds % 60);

  return "$minutes:$seconds";
}

@override
void dispose() {
  controller.dispose();
  pageScrollController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
final sidebarWidth = screenWidth < 500 ? screenWidth * 0.85 : 350.0;

    return Scaffold(
  body: Stack(
    children: [

      // ==========================================
      // MAIN PAGE
      // ==========================================

      SingleChildScrollView(
        controller: pageScrollController,
        child: Column(
          children: [
 
            // VIDEO
           // VIDEO
SizedBox(
  width: double.infinity,
  height: 400,
  child: Stack(
    children: [

      // =========================
      // VIDEO
      // =========================
     if (controller.value.isInitialized)
  Positioned.fill(
    child: VideoPlayer(controller),
  )
else
  const Positioned.fill(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  ),

      // =========================
      // NAVBAR
      // =========================
      Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {

              // =========================
              // MOBILE / TABLET
              // =========================
              if (constraints.maxWidth < 900) {
                return Row(
                  children: [

                    Image.asset(
                      'assets/img/olalogo.png',
                      width: 65,
                      height: 65,
                      color: Colors.white,
                    ),

                    const Spacer(),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          isMenu = true;
                        });
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                );
              }

              // =========================
              // DESKTOP
              // =========================
              return Row(
                children: [

                  Image.asset(
                    'assets/img/olalogo.png',
                    width: 65,
                    height: 65,
                    color: Colors.white,
                  ),

                  const SizedBox(width: 50),

                  const Text(
                    "Ola Electric",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Text(
                    "Krutrim",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Text(
                    "Outstation",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Text(
                    "Business",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bookanolacab(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 13,
                      ),
                      color: const Color.fromARGB(
                        255,
                        80,
                        78,
                        78,
                      ),
                      child: const Text(
                        "Book an Ola Cab",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 13,
                    ),
                    color: const Color.fromARGB(
                      255,
                      80,
                      78,
                      78,
                    ),
                    child: const Text(
                      "Book a Test Ride",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  // MENU
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isMenu = true;
                      });
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 25,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),
                ],
              );
            },
          ),
        ),
      ),
    ],
  ),
),       // ==========================================
            // OTHER SECTIONS
            // ==========================================

            SearchOla(),
            Scooty(),
            Global(),
            TheresOla(),
            Innovation(),
            Experience(),
            MakingDifference(),
            Ola(),
            Recent(),
            Downloadapp(),
            Footer(),
          ],
        ),
      ),

      // ==========================================
      // SIDEBAR MUST BE HERE
      // OUTSIDE SingleChildScrollView
      // ==========================================
  // DARK OVERLAY
    if (isMenu)
      Positioned.fill(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isMenu = false;
            });
          },
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
     AnimatedPositioned(
  duration: const Duration(milliseconds: 500),

  right: isMenu ? 0 : -sidebarWidth,
  top: 0,
  bottom: 0,

  child: Material(
    color: Colors.white,

    child: SizedBox(
      width: sidebarWidth,

      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  print("========== CLOSE CLICKED ==========");

                  setState(() {
                    isMenu = false;
                  });
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  const Text(
                    "Book an Ola Cab",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text("Ola S1"),

                  const SizedBox(height: 30),

                  const Text("Ola Electric"),

                  const SizedBox(height: 30),

                  const Text("Krutrim"),

                  const SizedBox(height: 30),

                  const Text("Outstation"),

                  const SizedBox(height: 30),

                  const Text("Ola for Business"),

                  const SizedBox(height: 30),

                  const Text("Ola FutureFactory"),

                  const SizedBox(height: 30),

                  const Text("Ola Foundation"),

                  const SizedBox(height: 30),

                  const Text("Support"),
                  Container(
                    margin:EdgeInsets.all(10),
                    child: Image.asset('assets/img/slidebar.png',
                    width:450,
                    height:250,),
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                      Text('Careers',
                      style:TextStyle(
                        color:Colors.grey,
                      )),
                      Text('Notices',
                      style:TextStyle(
                        color:Colors.grey,
                      )),
                      Text('Privacy',
                      style:TextStyle(
                        color:Colors.grey,
                      )),
                      Text('T&C',
                      style:TextStyle(
                        color:Colors.grey,
                      )),
                    ],
                  ),
                  Container(
                    margin:EdgeInsets.all(10),
                    child: Row(
                      children: [
                    Image.asset('assets/img/olalogo.png',
                      width:40,
                      height:40,),
                      Spacer(),
                       Image.asset('assets/img/insta.png',
                      width:25,
                      height:25,),
                      SizedBox(width: 5,),
                       Image.asset('assets/img/utube.png',
                      width:25,
                      height:25,),
                       SizedBox(width: 5,),
                       Image.asset('assets/img/twitter.png',
                      width:25,
                      height:25,),
                       SizedBox(width: 5,),

                    ],),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
)],
  ),
); }
}

