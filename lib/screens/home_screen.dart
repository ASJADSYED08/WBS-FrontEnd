import 'package:flutter/material.dart';
import 'package:ned_project/controller/homeController.dart';
import 'package:ned_project/export_alll.dart';
import 'package:ned_project/screens/ai_chat_screen.dart';
import 'package:ned_project/widgets/app_button.dart';
import 'package:ned_project/widgets/text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());

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

              // Project Input Section
              _buildSectionCard(
                title: 'Project Scope Input',
                icon: Icons.description_outlined,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project Name',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2C3E50),
                      ),
                    ),
                    7.h.verticalSpace,
                    AppTextField(
                      hintText: 'Enter project name',
                      hintColor: Color(0xff8A9BAE),
                      errorMessage: homeController.errorMessageName,
                      controller: homeController.nameController,
                      border: true,
                      bgcolor: Colors.white,
                      color: Color(0xff2C3E50),
                      borderColor: Color(0xffE8ECF1),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0078D4), width: 2),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      suffixIcon: Icon(Icons.business_center_outlined, size: 20, color: Color(0xff0078D4)),
                    ),
                    20.h.verticalSpace,
                    Text(
                      'Project Scope',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2C3E50),
                      ),
                    ),
                    7.h.verticalSpace,
                    AppTextField(
                      hintText: 'Describe your project scope, objectives, deliverables, and requirements...',
                      hintColor: Color(0xff8A9BAE),
                      errorMessage: homeController.errorMessageScope,
                      controller: homeController.scopeController,
                      border: true,
                      bgcolor: Colors.white,
                      color: Color(0xff2C3E50),
                      borderColor: Color(0xffE8ECF1),
                      maxLines: 6,
                      height: 120,
                      padding: EdgeInsets.all(20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0078D4), width: 2),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    20.h.verticalSpace,
                    AppButton(
                        text: 'Generate WBS',
                        width: double.infinity,
                        onPressed: () {
                          var data = {
                            "projectName": homeController.nameController.text.trim(),
                            "scope": homeController.scopeController.text.trim(),
                          };
                          homeController.generateWBS(context, data);
                          // _LoginController.login(context, data);
                        }),
                  ],
                ),
              ),

              20.h.verticalSpace,

              // AI Bot Chatbot Card
              _buildChatbotCard(),

              130.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatbotCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff0078D4),
            Color(0xff005A9E),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xff0078D4).withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, 5),
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
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.smart_toy_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              12.w.horizontalSpace,
              Text(
                'AI Bot',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          20.h.verticalSpace,
          Text(
            'Chat with your AI assistant to explore project potential, get insights, and analyze risks.',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),
          20.h.verticalSpace,
          AppButton(
            text: 'Start Chat',
            width: double.infinity,
            color: Colors.white,
            textColor: Color(0xff0078D4),
            onPressed: () {
              Get.to(() => AIChatScreen());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({required String title, required IconData icon, required Widget child}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff0078D4).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Color(0xff0078D4), size: 24),
              ),
              12.w.horizontalSpace,
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1E3A5F),
                ),
              ),
            ],
          ),
          20.h.verticalSpace,
          child,
        ],
      ),
    );
  }
}
