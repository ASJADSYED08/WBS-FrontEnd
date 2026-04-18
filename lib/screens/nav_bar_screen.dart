import 'package:flutter/services.dart';
import 'package:ned_project/auth/global.dart';
import 'package:ned_project/export_alll.dart';
import 'package:ned_project/screens/home_screen.dart';
import 'package:ned_project/screens/profile.dart';
import 'package:ned_project/screens/recent_history_screen.dart';

class NavbarScreen extends StatefulWidget {
  NavbarScreen({Key? key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  final bottomController = Get.put(BottomAppBarController());
  // bool isBool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(bottomController.count.value == 0 ? 70 : 70),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xffFFFFFF), // Clean white
                Color(0xffF5F7FA), // Professional light gray
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xff0078D4).withOpacity(0.08),
                blurRadius: 15,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            toolbarHeight: bottomController.count.value == 0 ? 120 : 90,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            leadingWidth: bottomController.count.value == 0 ? 250 : 250,
            leading: Padding(
              padding: const EdgeInsets.only(left: 18, top: 16),
              child: Text(
                bottomController.count.value == 0
                    ? "Good Morning ${user_name},"
                    : bottomController.count.value == 1
                        ? "Recent History"
                        : "Profile",
                style: TextStyle(color: Color(0xff0078D4), fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            actions: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    // _anyFile();
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 64.w,
                        height: 64.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xffE8ECF1), width: 2),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/image/avatar.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: -8,
                        right: -1.w,
                        child: Container(
                          height: 28.h,
                          width: 28.w,
                          decoration: BoxDecoration(
                            color: Color(0xff0078D4),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Icon(Icons.check, size: 16.r, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              0.06.sw.horizontalSpace
            ],
          ),
        ),
      ),

      extendBody: true,
      // extendBody: true, extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: buildMyNavBar2(context),

      // drawer: DrawerWidget(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffF5F7FA), // Professional light gray
              Color(0xffE8ECF1), // Subtle blue-gray
              Color(0xffFFFFFF), // Clean white
            ],
          ),
        ),
        child: bottomController.bottomList[bottomController.count.value]['page'] as Widget,
      ),
    );
  }

  buildMyNavBar2(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 88.h,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                topLeft: Radius.circular(20.r),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      bottomBarItem2(0),
                    ],
                  ),
                  Row(
                    children: [
                      bottomBarItem2(1),
                    ],
                  ),
                  Row(
                    children: [
                      bottomBarItem2(2),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bottomBarItem2(index) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {});
        bottomController.itemSelect(index);
      },
      icon: Column(
        children: [
          // Icon(bottomController.bottomList[index]['icon'] as IconData,
          //     color: bottomController.count.value == index
          //         ? const Color.fromARGB(255, 11, 116, 202)
          //         : Colors.white),
          4.verticalSpace,
          // bottomController.count.value == index
          SizedBox(
            height: 40.h,
            child: Obx(() {
              bool isSelected = bottomController.count.value == index;
              return Container(
                height: 45,
                width: 45,
                decoration: isSelected
                    ? BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff0078D4).withOpacity(0.15),
                      )
                    : null,
                child: Center(
                  child: Icon(
                    bottomController.bottomList[index]["focused_icon"] as IconData?,
                    color: isSelected ? Color(0xff0078D4) : Color(0xff8A9BAE),
                    size: 30.sp,
                  ),
                ),
              );
            }),
          ),

          // Text(
          //   bottomController.bottomList[index]['title'].toString(),
          //   style: TextStyle(
          //       color: bottomController.count.value == index
          //           ? const Color.fromARGB(255, 11, 116, 202)
          //           : Colors.white,
          //       fontSize: 11.sp),
          // )
        ],
      ),
    );
  }
}

class BottomAppBarController extends GetxController {
  TextEditingController controller = TextEditingController(text: "Search");

  var count = 0.obs;
  var bottomList = [
    {
      'title': 'Home',
      'page': HomeScreen(),
      'focused_icon': Icons.home_outlined,
    },
    {
      'title': 'History',
      'page': RecentHistoryScreen(),
      'focused_icon': Icons.watch_later_outlined,
    },
    {
      'title': 'profile',
      'page': ProfileScreen(),
      'focused_icon': Icons.person_outline_sharp,
    },
  ];
  itemSelect(index) {
    count.value = index;
    update();
  }
}
