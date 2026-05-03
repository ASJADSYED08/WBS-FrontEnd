import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:get/get.dart';
import 'package:ned_project/auth/create_profile.dart';
import 'dart:convert';
import 'package:ned_project/auth/global.dart';
import 'package:ned_project/auth/otp_screen.dart';
import 'package:ned_project/screens/nav_bar_screen.dart';
import 'package:ned_project/widgets/custom_loader.dart';

final Widget spinkit = CustomLoader();

class apiServices {
  RegisterUser(context, data) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: spinkit);
      },
    );
    final uri = Uri.parse('${apiUrl}auth/signup');
    var headers = {
      'Content-Type': 'application/json',
    };
    print(data.toString());
    String jsonBody = json.encode(data);
    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
      );
      var res_data = json.decode(response.body.toString());

      if (res_data['status'] == 200) {
        Get.back();
        // access_token = res_data['data']['token'];
        otp = res_data['data']['otp'];
        Get.to(() => OtpScreen());
        Get.snackbar('Success', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.green);
      } else {
        Get.back();
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
      }
    } catch (e) {
      Get.back();

      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
    }
  }

  Future GetWbsList(context) async {
    try {
      final response = await http.get(
        Uri.parse('${apiUrl}user/wbs'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': access_token,
        },
      );

      var res_data = json.decode(response.body.toString());
      if (res_data['status'] == 200) {
        Get.snackbar('Success', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.green);

        return res_data;
      } else {
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.black);
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          colorText: Colors.white);
    }
  }

  login(context, data) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: spinkit);
      },
    );
    final uri = Uri.parse('${apiUrl}auth/login');
    var headers = {
      'Content-Type': 'application/json',
    };
    print(data.toString());
    String jsonBody = json.encode(data);
    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
      );
      var res_data = json.decode(response.body.toString());

      if (res_data['status'] == 200) {
        access_token = res_data['data']['token'];
        Future f1 = GetMe(context);
        Future.wait([f1]).then((value) async {
          Get.back();
          Get.snackbar('Success', res_data['message'],
              snackPosition: SnackPosition.TOP,
              colorText: Colors.white,
              backgroundColor: Colors.green);
        });
        Get.offAll(() => NavbarScreen());
      } else {
        Get.back();
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
      }
    } catch (e) {
      Get.back();

      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
    }
  }

  generateWBS(context, data) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: spinkit);
      },
    );
    final uri = Uri.parse('${apiUrl}user/wbs');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': access_token,
    };
    print(data.toString());
    String jsonBody = json.encode(data);
    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
      );
      var res_data = json.decode(response.body.toString());

      if (res_data['status'] == 200) {
        print("object");
        Get.back();
        Get.snackbar('Success', res_data['message'],
            snackPosition: SnackPosition.TOP, colorText: Colors.black);
      } else {
        Get.back();
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
      }
    } catch (e) {
      Get.back();

      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
    }
  }

  verifyOtp(context, data) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: spinkit);
      },
    );
    final uri = Uri.parse('${apiUrl}auth/verify-otp');
    var headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer ${access_token}',
    };
    print(data.toString());
    String jsonBody = json.encode(data);
    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
      );
      var res_data = json.decode(response.body.toString());

      if (res_data['status'] == 200) {
        Get.back();
        access_token = res_data['data']['token'];
        Get.to(() => CreateProfileScreen());
        Get.snackbar('Success', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.green);
      } else {
        Get.back();
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
      }
    } catch (e) {
      Get.back();

      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
    }
  }

  Future ResendOtpUser(context, data) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: spinkit);
      },
    );
    final uri = Uri.parse('${apiUrl}auth/resendOtp');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${access_token}',
    };
    print(data.toString());
    String jsonBody = json.encode(data);
    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
      );
      var res_data = json.decode(response.body.toString());

      if (res_data['status'] == true) {
        Get.back();

        otp = res_data['data'];

        Get.snackbar('Success', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.green);
        return res_data;
      } else {
        Get.back();
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
      }
    } catch (e) {
      Get.back();

      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
    }
  }

  createProfile(context, data, file) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: spinkit);
      },
    );
    final uri = Uri.parse('${apiUrl}auth/create-profile');
    var header = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${access_token}',
    };
    try {
      var request = http.MultipartRequest('POST', uri);

      request.fields["businessName"] = data["bussinessName"].toString();
      request.fields["companySize"] = data["companySize"].toString();
      request.fields["about"] = data["description"].toString();

      if (file != null) {
        var multipartFile = await http.MultipartFile.fromPath(
          'profilePicture',
          file.path,
          filename: file.path.split('/').last,
          contentType: MediaType("image", "${file.path.split('.').last}"),
        );
        request.files.add(multipartFile);
      }
      request.headers.addAll(header);
      var response = await request.send();

      final res = await http.Response.fromStream(response);
      var res_data = json.decode(res.body.toString());

      if (res_data['status'] == 200) {
        Future f1 = GetMe(context);
        Future.wait([f1]).then((value) async {
          Get.back();
          Get.snackbar('Success', res_data['message'],
              snackPosition: SnackPosition.TOP,
              colorText: Colors.white,
              backgroundColor: Colors.green);

          Get.offAll(() => NavbarScreen());
        });
      } else {
        Get.back();
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
    }
  }

  Future<void> GetMe(context) async {
    try {
      final response = await http.get(
        Uri.parse('${apiUrl}auth/profile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${access_token}',
        },
      );

      var res_data = json.decode(response.body.toString());
      if (res_data['status'] == 200) {
        business_name = res_data['data']['user']['businessName'];
        user_name = res_data['data']['user']['name'];
        user_email = res_data['data']['user']['email'];
        profile_picture = res_data['data']['user']['profilePicture'].toString();
        companySize = res_data['data']['user']['companySize'].toString();
        description = res_data['data']['user']['about'].toString();
      } else {
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.black);
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          colorText: Colors.white);
    }
  }

  uploadVideo(context, data, file) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: spinkit);
      },
    );
    final uri = Uri.parse('${apiUrl}home/uploadMedia');
    var header = {
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer ${access_token}',
    };
    try {
      var request = http.MultipartRequest('POST', uri);

      request.fields["title"] = data["title"].toString();

      if (file != null) {
        var multipartFile = await http.MultipartFile.fromPath(
          'media',
          file,
          filename: file.split('/').last,
          contentType: MediaType("video", "${file.split('.').last}"),
        );
        request.files.add(multipartFile);
      }
      request.headers.addAll(header);
      var response = await request.send();

      final res = await http.Response.fromStream(response);
      var res_data = json.decode(res.body.toString());

      if (res_data['status'] == true) {
        Get.back();
        Get.snackbar('Success', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.green);

        Get.offAll(() => NavbarScreen());
      } else {
        Get.back();
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
    }
  }

  Future GetUploadedVideos(context) async {
    try {
      final response = await http.get(
        Uri.parse('${apiUrl}home/videos'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${access_token}',
        },
      );

      var res_data = json.decode(response.body.toString());
      if (res_data['status'] == true) {
        Get.snackbar('Success', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.green);

        return res_data;
      } else {
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.black);
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          colorText: Colors.white);
    }
  }

  Future GetHistory(context) async {
    try {
      final response = await http.get(
        Uri.parse('${apiUrl}home/getHistory'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${access_token}',
        },
      );

      var res_data = json.decode(response.body.toString());
      if (res_data['status'] == true) {
        Get.snackbar('Success', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.green);

        return res_data;
      } else {
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.black);
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          colorText: Colors.white);
    }
  }
}
