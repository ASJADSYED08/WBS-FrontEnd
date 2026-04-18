import 'package:ned_project/Model/wbsModel.dart';
import 'package:ned_project/controller/userController.dart';
import 'package:ned_project/export_alll.dart';
import 'package:ned_project/screens/view_recent_history_screen.dart';
import 'package:ned_project/services.dart';
import 'package:ned_project/widgets/custom_loader.dart';
import 'package:url_launcher/url_launcher.dart';

class RecentHistoryScreen extends StatefulWidget {
  const RecentHistoryScreen({super.key});

  @override
  State<RecentHistoryScreen> createState() => _RecentHistoryScreenState();
}

class _RecentHistoryScreenState extends State<RecentHistoryScreen> {
  bool isLoading = false;
  List projectList = [];

  // Simulated project data - replace with actual API calls
  void loadProjects() {
    setState(() {
      isLoading = true;
    });

    // Simulate API call
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isLoading = false;
          // Sample project data
          projectList = [
            {
              'id': '1',
              'projectName': 'E-Commerce Platform Development',
              'scope':
                  'Develop a full-featured e-commerce platform with user authentication, product catalog, shopping cart, and payment integration. The platform should support multiple payment gateways, inventory management, order tracking, and customer reviews.',
              'createdDate': '2024-01-15',
              'status': 'In Progress',
              'wbs': {
                'tasks': [
                  {'id': '1', 'name': 'Project Planning', 'duration': '2 weeks', 'status': 'Completed'},
                  {'id': '2', 'name': 'Requirements Analysis', 'duration': '3 weeks', 'status': 'In Progress'},
                  {'id': '3', 'name': 'Design Phase', 'duration': '4 weeks', 'status': 'Pending'},
                  {'id': '4', 'name': 'Development', 'duration': '8 weeks', 'status': 'Pending'},
                  {'id': '5', 'name': 'Testing & QA', 'duration': '3 weeks', 'status': 'Pending'},
                  {'id': '6', 'name': 'Deployment', 'duration': '1 week', 'status': 'Pending'},
                ],
              },
              'risks': [
                {
                  'type': 'High',
                  'title': 'Resource Availability',
                  'description': 'Potential delays due to team member unavailability',
                  'mitigation': 'Maintain backup resources and cross-train team members'
                },
                {
                  'type': 'Medium',
                  'title': 'Scope Creep',
                  'description': 'Project scope may expand beyond initial requirements',
                  'mitigation': 'Strict change control process and regular stakeholder reviews'
                },
                {
                  'type': 'Low',
                  'title': 'Technology Changes',
                  'description': 'Rapid technology evolution may impact project',
                  'mitigation': 'Regular technology reviews and flexible architecture'
                },
              ],
            },
            {
              'id': '2',
              'projectName': 'Mobile App Redesign',
              'scope':
                  'Redesign existing mobile application with modern UI/UX, improve performance, and add new features including push notifications, offline mode, and enhanced security.',
              'createdDate': '2024-01-10',
              'status': 'Planning',
              'wbs': {
                'tasks': [
                  {'id': '1', 'name': 'UI/UX Design', 'duration': '3 weeks', 'status': 'Completed'},
                  {'id': '2', 'name': 'Frontend Development', 'duration': '6 weeks', 'status': 'In Progress'},
                  {'id': '3', 'name': 'Backend Integration', 'duration': '4 weeks', 'status': 'Pending'},
                  {'id': '4', 'name': 'Testing', 'duration': '2 weeks', 'status': 'Pending'},
                ],
              },
              'risks': [
                {
                  'type': 'Medium',
                  'title': 'User Adoption',
                  'description': 'Users may resist new interface changes',
                  'mitigation': 'Conduct user testing and provide training materials'
                },
              ],
            },
            {
              'id': '3',
              'projectName': 'Cloud Migration Project',
              'scope':
                  'Migrate on-premise infrastructure to cloud platform with minimal downtime and data security. Include backup strategies, disaster recovery, and performance optimization.',
              'createdDate': '2024-01-05',
              'status': 'Completed',
              'wbs': {
                'tasks': [
                  {'id': '1', 'name': 'Assessment & Planning', 'duration': '2 weeks', 'status': 'Completed'},
                  {'id': '2', 'name': 'Infrastructure Setup', 'duration': '3 weeks', 'status': 'Completed'},
                  {'id': '3', 'name': 'Data Migration', 'duration': '4 weeks', 'status': 'Completed'},
                  {'id': '4', 'name': 'Testing & Validation', 'duration': '2 weeks', 'status': 'Completed'},
                  {'id': '5', 'name': 'Go-Live', 'duration': '1 week', 'status': 'Completed'},
                ],
              },
              'risks': [
                {
                  'type': 'High',
                  'title': 'Data Loss',
                  'description': 'Risk of data loss during migration',
                  'mitigation': 'Multiple backups and staged migration approach'
                },
                {
                  'type': 'Medium',
                  'title': 'Downtime',
                  'description': 'Potential service interruption during migration',
                  'mitigation': 'Phased migration during off-peak hours'
                },
              ],
            },
          ];
        });
      }
    });
  }

  final user = Get.put(UserController());

  bool loader1 = false;
  //
  GetWBS() {
    apiServices().GetWbsList(context).then((res_data) {
      if (mounted && res_data != null) {
        setState(() {
          loader1 = true;
        });
      }
      user.editWbs(wbsList.fromJson(res_data));
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    GetWBS();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h.verticalSpace,

              // Header

              // Content
              loader1 == false
                  ? CustomLoader()
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: UserController.user.data!.wbsList!.length,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      reverse: true,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
                            await launchUrl(Uri.parse(UserController.user.data!.wbsList![index].media.toString()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              width: 10,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 0.9.sw,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 0.7.sw,
                                                child: Text(
                                                  "Title",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Text(
                                                UserController.user.data!.wbsList![index].title.toString(),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            child: Image(
                                              image: AssetImage(
                                                "assets/icons/logos.png",
                                              ),
                                              fit: BoxFit.cover,
                                              color: Color(0xff0ff0078D4),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    10.verticalSpace,
                                    Text(
                                      "Description",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      UserController.user.data!.wbsList![index].description.toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

              150.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 60.h),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xff0078D4).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.folder_open_outlined,
                size: 40,
                color: Color(0xff0078D4),
              ),
            ),
            20.h.verticalSpace,
            Text(
              'No projects yet. Create your first project from the home screen.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff5A6C7D),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(Map project) {
    int tasksCount = project['wbs'] != null ? (project['wbs']['tasks'] as List).length : 0;
    int risksCount = project['risks'] != null ? (project['risks'] as List).length : 0;

    return GestureDetector(
      onTap: () {
        Get.to(() => ViewRecentHistoryScreen(projectData: Map<String, dynamic>.from(project)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xffE8ECF1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff0078D4), Color(0xff005A9E)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.folder,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                16.w.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project['projectName'],
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1E3A5F),
                        ),
                      ),
                      8.h.verticalSpace,
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 14, color: Color(0xff5A6C7D)),
                          6.w.horizontalSpace,
                          Text(
                            'Created: ${project['createdDate']}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xff5A6C7D),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            16.h.verticalSpace,
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xffF5F7FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                project['scope'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Color(0xff2C3E50),
                  height: 1.4,
                ),
              ),
            ),
            16.h.verticalSpace,
            Row(
              children: [
                if (tasksCount > 0)
                  _buildInfoChip(
                    icon: Icons.account_tree_outlined,
                    label: '$tasksCount Tasks',
                    color: Color(0xff0078D4),
                  ),
                if (tasksCount > 0 && risksCount > 0) 12.w.horizontalSpace,
                if (risksCount > 0)
                  _buildInfoChip(
                    icon: Icons.warning_amber_outlined,
                    label: '$risksCount Risks',
                    color: Color(0xffFFA726),
                  ),
              ],
            ),
            16.h.verticalSpace,
            Row(
              children: [
                Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xff0078D4)),
                8.w.horizontalSpace,
                Text(
                  'Tap to view details',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0078D4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({required IconData icon, required String label, required Color color}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          6.w.horizontalSpace,
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
