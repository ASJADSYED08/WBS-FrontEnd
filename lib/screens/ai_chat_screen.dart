import 'package:flutter/material.dart';
import 'package:ned_project/export_alll.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    // Add welcome message
    _messages.add(ChatMessage(
      text: "Hello! I'm your AI Project Manager. How can I help you today?",
      isUser: false,
      timestamp: DateTime.now(),
    ));
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(
        text: _messageController.text.trim(),
        isUser: true,
        timestamp: DateTime.now(),
      ));
    });

    _messageController.clear();
    _scrollToBottom();

    // Simulate AI response
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _messages.add(ChatMessage(
          text: _generateAIResponse(_messages[_messages.length - 1].text),
          isUser: false,
          timestamp: DateTime.now(),
        ));
      });
      _scrollToBottom();
    });
  }

  String _generateAIResponse(String userMessage) {
    // Simple response logic - replace with actual AI integration
    String lowerMessage = userMessage.toLowerCase();

    if (lowerMessage.contains('wbs') || lowerMessage.contains('work breakdown')) {
      return "A Work Breakdown Structure (WBS) helps break down your project into manageable tasks. I can help you create a detailed WBS based on your project scope. Would you like me to generate one for your project?";
    } else if (lowerMessage.contains('risk') || lowerMessage.contains('risks')) {
      return "Risk analysis is crucial for project success. I can identify potential risks in your project and suggest mitigation strategies. Share your project details and I'll analyze the risks for you.";
    } else if (lowerMessage.contains('scope') || lowerMessage.contains('project')) {
      return "I'd be happy to help with your project! Please share your project scope, objectives, and requirements. I can help you create a WBS, analyze risks, and provide insights.";
    } else if (lowerMessage.contains('hello') || lowerMessage.contains('hi')) {
      return "Hello! I'm here to assist you with project management tasks. I can help with WBS creation, risk analysis, and project insights. What would you like to know?";
    } else {
      return "I understand you're asking about: ${userMessage}. I can help you with project planning, WBS creation, risk analysis, and project insights. Could you provide more details about what you need?";
    }
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: null,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffF5F7FA),
              Color(0xffE8ECF1),
              Color(0xffFFFFFF),
            ],
          ),
        ),
        child: Column(
          children: [
            // AppBar
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xffFFFFFF),
                    Color(0xffF5F7FA),
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
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffE8ECF1),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xff1E3A5F),
                        size: 15,
                      ),
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff0078D4), Color(0xff005A9E)],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.smart_toy_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    12.w.horizontalSpace,
                    Text(
                      'AI Bot',
                      style: TextStyle(
                        color: Color(0xff1E3A5F),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Messages List
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageBubble(_messages[index]);
                },
              ),
            ),

            // Input Area
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffF5F7FA),
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(color: Color(0xffE8ECF1)),
                        ),
                        child: TextField(
                          controller: _messageController,
                          maxLines: null,
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) => _sendMessage(),
                          decoration: InputDecoration(
                            hintText: 'Type your message...',
                            hintStyle: TextStyle(
                              color: Color(0xff8A9BAE),
                              fontSize: 14.sp,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 12.h,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Color(0xff2C3E50),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    12.w.horizontalSpace,
                    GestureDetector(
                      onTap: _sendMessage,
                      child: Container(
                        width: 48.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff0078D4), Color(0xff005A9E)],
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff0078D4).withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff0078D4), Color(0xff005A9E)],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.smart_toy_outlined,
                color: Colors.white,
                size: 18,
              ),
            ),
            8.w.horizontalSpace,
          ],
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: message.isUser ? Color(0xff0078D4) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(
                    message.isUser ? 20.r : 4.r,
                  ),
                  bottomRight: Radius.circular(
                    message.isUser ? 4.r : 20.r,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: message.isUser ? Colors.white : Color(0xff2C3E50),
                  fontSize: 14.sp,
                  height: 1.4,
                ),
              ),
            ),
          ),
          if (message.isUser) ...[
            8.w.horizontalSpace,
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0xffE8ECF1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person,
                color: Color(0xff1E3A5F),
                size: 18,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}
