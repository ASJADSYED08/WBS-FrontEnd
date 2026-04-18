String access_token = "";

String otp = "";
String user_name = "";
String business_name = "";
String user_email = "";
String profile_picture = "";
String companySize = "";
String description = "";
// String apiUrl = "https://81d40j0x-8080.inc1.devtunnels.ms/api/v1/";
String apiUrl = "http://34.228.168.225:9000/api/v1/";

String formatFullDuration(double seconds) {
  final totalSeconds = seconds.floor();
  final minutes = totalSeconds ~/ 60;
  final remainingSeconds = totalSeconds % 60;

  return '${minutes} min ${remainingSeconds.toString().padLeft(2, '0')} sec';
}
