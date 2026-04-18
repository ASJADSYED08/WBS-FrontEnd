import 'package:ned_project/export_alll.dart';

class ViewRecentHistoryScreen extends StatefulWidget {
  final Map<String, dynamic> projectData;
  const ViewRecentHistoryScreen({super.key, required this.projectData});

  @override
  State<ViewRecentHistoryScreen> createState() => _ViewRecentHistoryScreenState();
}

class _ViewRecentHistoryScreenState extends State<ViewRecentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xffE8ECF1)),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xff1E3A5F),
                      size: 15,
                    ),
                  ),
                ),
              ),
              title: Text(
                'Project Details',
                style: TextStyle(color: Color(0xff1E3A5F), fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.h.verticalSpace,

                      // Project Header Card
                      Container(
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
                                        widget.projectData['projectName'],
                                        style: TextStyle(
                                          fontSize: 22.sp,
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
                                            'Created: ${widget.projectData['createdDate']}',
                                            style: TextStyle(
                                              fontSize: 13.sp,
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
                            20.h.verticalSpace,
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Color(0xffF5F7FA),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.description_outlined, size: 18, color: Color(0xff0078D4)),
                                      8.w.horizontalSpace,
                                      Text(
                                        'Project Scope',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff1E3A5F),
                                        ),
                                      ),
                                    ],
                                  ),
                                  12.h.verticalSpace,
                                  Text(
                                    widget.projectData['scope'],
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff2C3E50),
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      24.h.verticalSpace,

                      // WBS Section
                      _buildWBSSection(),

                      24.h.verticalSpace,

                      // Risk Analysis Section
                      _buildRiskAnalysisSection(),

                      30.h.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWBSSection() {
    if (widget.projectData['wbs'] == null || (widget.projectData['wbs']['tasks'] as List).isEmpty) {
      return _buildEmptyState(
        icon: Icons.account_tree_outlined,
        message: 'No WBS generated for this project yet.',
      );
    }

    List tasks = widget.projectData['wbs']['tasks'] as List;

    return Container(
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
            children: [
              Icon(Icons.account_tree_outlined, size: 20, color: Color(0xff0078D4)),
              8.w.horizontalSpace,
              Text(
                'Work Breakdown Structure',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1E3A5F),
                ),
              ),
            ],
          ),
          20.h.verticalSpace,
          ...tasks.map<Widget>((task) {
            return Container(
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffF5F7FA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xffE8ECF1)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff0078D4).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        task['id'],
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0078D4),
                        ),
                      ),
                    ),
                  ),
                  16.w.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task['name'],
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1E3A5F),
                          ),
                        ),
                        8.h.verticalSpace,
                        Row(
                          children: [
                            Icon(Icons.schedule, size: 14, color: Color(0xff5A6C7D)),
                            4.w.horizontalSpace,
                            Text(
                              task['duration'],
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
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildRiskAnalysisSection() {
    if (widget.projectData['risks'] == null || (widget.projectData['risks'] as List).isEmpty) {
      return _buildEmptyState(
        icon: Icons.warning_amber_outlined,
        message: 'No risk analysis generated for this project yet.',
      );
    }

    List risks = widget.projectData['risks'] as List;

    return Container(
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
            children: [
              Icon(Icons.warning_amber_outlined, size: 20, color: Color(0xffFFA726)),
              8.w.horizontalSpace,
              Text(
                'Risk Analysis',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1E3A5F),
                ),
              ),
            ],
          ),
          20.h.verticalSpace,
          ...risks.map<Widget>((risk) {
            Color riskColor;
            if (risk['type'] == 'High') {
              riskColor = Color(0xffEF5350);
            } else if (risk['type'] == 'Medium') {
              riskColor = Color(0xffFFA726);
            } else {
              riskColor = Color(0xff66BB6A);
            }

            return Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: riskColor.withOpacity(0.3), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: riskColor.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: riskColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          risk['type'],
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: riskColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  12.h.verticalSpace,
                  Text(
                    risk['title'],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1E3A5F),
                    ),
                  ),
                  8.h.verticalSpace,
                  Text(
                    risk['description'],
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff2C3E50),
                      height: 1.4,
                    ),
                  ),
                  12.h.verticalSpace,
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xffF5F7FA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.lightbulb_outline, size: 16, color: Color(0xff0078D4)),
                        8.w.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mitigation Strategy',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff0078D4),
                                ),
                              ),
                              4.h.verticalSpace,
                              Text(
                                risk['mitigation'],
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Color(0xff2C3E50),
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildEmptyState({required IconData icon, required String message}) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffE8ECF1)),
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xff0078D4).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 30,
                color: Color(0xff0078D4),
              ),
            ),
            16.h.verticalSpace,
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Color(0xff5A6C7D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
