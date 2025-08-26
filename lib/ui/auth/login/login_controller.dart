import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/models/login.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import '../../../repos/auth_repo.dart';
import '../../../core/error/failure.dart';
import '../../../repos/user_repo.dart';

class LoginController extends GetxController {
  LoginController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;
  final UserRepository _userRepository = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormBuilderState>();
  RxBool isBusy = false.obs;
  RxBool isSocial = false.obs;
  RxBool isSocialface = false.obs;
  RxBool isObsecure = true.obs;
  final Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    loadUserFromPrefs();
  }

  final fcmToken = AppPreferences.getFCMToken();

  void onLogin() {
    if (formKey.currentState != null &&
        formKey.currentState!.saveAndValidate()) {
      final formData = formKey.currentState!.value;
      login(formData["email"], formData["password"], formData["deviceToken"]);
    }
  }

  // Future<void> login(String email, String password) async {
  //   isBusy.value = true;

  //   final result =
  //       await _authRepository.login(email: email, password: password);
  //   isBusy.value = false;

  //   result.fold(
  //     (failure) {
  //       final errorMsg = failure.errorMessage ?? 'Login failed';
  //       SnackbarUtil.error(
  //         logMessage: errorMsg,
  //         logScreenName: Routers.login,
  //         logMethodName: 'login',
  //         message: failure.errorMessage ?? 'Unknown error',
  //       );
  //     },
  //     (responseData) async {
  //       if (responseData.token == null) {
  //         SnackbarUtil.error(
  //           message: responseData.message ?? "Login failed",
  //         );
  //         return;
  //       }
  //       // Save token if needed
  //       if (responseData.token != null) {
  //         await AppPreferences.setLoginData(responseData);
  //       }

  //       // Fetch user profile and save to preferences
  //       final profileResult = await _userRepository.fetchUser();
  //       await profileResult.fold(
  //         (error) async {
  //           print("Failed to fetch profile: ${error.errorMessage}");
  //         },
  //         (profileData) async {
  //           await AppPreferences.setUserData(
  //               profileData as Map<String, dynamic>);
  //           print(
  //               "Saved user to prefs: ${profileData.data?.name}, ${profileData.data?.email}");

  //           // Only navigate after saving!
  //           SnackbarUtil.info(
  //             message: responseData.message ?? "User Not Found",
  //             isInfo: false,
  //           );
  //           final token = AppPreferences.getAuthToken();
  //           if (token != null && token.isNotEmpty) {
  //             Get.offAllNamed(Routers.homeScreen);
  //           }
  //         },
  //       );
  //     },
  //   );
  // }

  // Future<void> login(String email, String password ,String? device_token) async {
  //   isBusy.value = true;

  //   final result =
  //       await _authRepository.login(email: email, password: password, );
  //   isBusy.value = false;

  //   result.fold(
  //     (failure) {
  //       final errorMsg = failure.errorMessage ?? 'Login failed';
  //       SnackbarUtil.error(
  //         logMessage: errorMsg,
  //         logScreenName: Routers.login,
  //         logMethodName: 'login',
  //         message: failure.errorMessage ?? 'Unknown error',
  //       );
  //     },
  //     (responseData) async {
  //       if (responseData.token == null) {
  //         SnackbarUtil.error(
  //           message: responseData.message ?? "Login failed",
  //         );
  //         return;
  //       }
  //       // Save token if needed
  //       if (responseData.token != null) {
  //         await AppPreferences.setLoginData(responseData);
  //       }

  //       // Fetch user profile and save to preferences
  //       final profileResult = await _userRepository.fetchUser();
  //       await profileResult.fold(
  //         (error) async {
  //           print("Failed to fetch profile: ${error.errorMessage}");
  //         },
  //         (profileData) async {
  //           // Corrected here: no cast to Map<String, dynamic>
  //           await AppPreferences.setUserData(profileData.toJson());

  //           print(
  //               "Saved user to prefs: ${profileData.data?.name}, ${profileData.data?.email}");

  //           // Only navigate after saving!
  //           SnackbarUtil.info(
  //             message: responseData.message ?? "User Not Found",
  //             isInfo: false,
  //           );
  //           final token = AppPreferences.getAuthToken();
  //           if (token != null && token.isNotEmpty) {
  //             Get.offAllNamed(Routers.homeScreen);
  //           }
  //         },
  //       );
  //     },
  //   );
  // }

  Future<void> login(String email, String password, String? deviceToken) async {
    isBusy.value = true;

// include fcmToken in your API login payload
    // final String? savedToken = AppPreferences.getFCMToken();
    // print("Retrieved FCM Token: $savedToken");
    print("FCM TOKEN:    $fcmToken");
    final result = await _authRepository.login(
      email: email,
      password: password,
      deviceToken: fcmToken, // pass device token here
    );
    print("PayLoadLogin:$result");
    isBusy.value = false;

    result.fold(
      (failure) {
        final errorMsg = failure.errorMessage ?? 'Login failed';
        SnackbarUtil.error(
          logMessage: errorMsg,
          logScreenName: Routers.login,
          logMethodName: 'login',
          message: failure.errorMessage ?? 'Unknown error',
        );
      },
      (responseData) async {
        if (responseData.token == null) {
          SnackbarUtil.error(
            message: responseData.message ?? "Login failed",
          );
          return;
        }
        if (responseData.token != null) {
          await AppPreferences.setLoginData(responseData);
        }

        final profileResult = await _userRepository.fetchUser();
        await profileResult.fold(
          (error) async {
            print("Failed to fetch profile: ${error.errorMessage}");
          },
          (profileData) async {
            await AppPreferences.setUserData(profileData.toJson());

            print(
              "Saved user to prefs: ${profileData.data?.name}, ${profileData.data?.email}",
            );

            SnackbarUtil.info(
              message: responseData.message ?? "User Not Found",
              isInfo: false,
            );
            final token = AppPreferences.getAuthToken();
            if (token != null && token.isNotEmpty) {
              Get.offAllNamed(Routers.homeScreen);
            }
          },
        );
      },
    );
  }

//   final auth = AuthService();
// final result = await auth.signInWithGoogle(); // or signInWithApple()

// if (result != null) {
//   print("✅ Signed in: ${result.user?.email}");
//   AppPreferences.setUserData(result.user);
//   Get.offAllNamed(Routers.homeScreen);
// }

  /// -------------------------------
  /// 🔐 Google Sign-In
  // /// -------------------------------
  // Future<void> loginWithGoogle() async {
  //   isSocial.value = true;
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) return;

  //     final googleAuth = await googleUser.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     final userCredential = await _auth.signInWithCredential(credential);
  //     final firebaseIdToken = await userCredential.user!.getIdToken(true);
  //     print("FirebaseToken:::$firebaseIdToken");
  //     final response = await dio.post(
  //       "https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api/social-login",
  //       options: Options(headers: {"Content-Type": "application/json"}),
  //       data: {
  //         "token": firebaseIdToken,
  //         "provider": "google.com",
  //       },
  //     );
  //     print("FirebaseToken:::$firebaseIdToken");
  //     if (firebaseIdToken != null) {
  //       await AppPreferences.setUserData(response.data);
  //     }

  //     print("✅ Google Login Response: ${response.data}");
  //   } catch (e) {
  //     print("❌ Google Sign-In Error: $e");
  //   } finally {
  //     isSocial.value = false;
  //   }
  // }

  Future<void> loginWithGoogle() async {
    isSocial.value = true;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final firebaseIdToken = await userCredential.user!.getIdToken(true);

      final response = await dio.post(
        "https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api/social-login",
        options: Options(headers: {"Content-Type": "application/json"}),
        data: {
          "token": firebaseIdToken,
          "provider": "google.com",
        },
      );

      // if (response.data != null && response.data['token'] != null) {
      //   await AppPreferences.setLoginData(response.data);
      //   print("Saved token: ${response.data['token']}");
      //   // Navigate after saving token and data
      //   Get.offAllNamed(Routers.homeScreen);
      // } else {
      //   print("No token found in backend response");
      //   SnackbarUtil.error(message: "Login failed: No token from server");
      // }

      if (response.data != null && response.data['token'] != null) {
        final login = Login.fromJson(response.data); // <-- add this line
        await AppPreferences.setLoginData(login); // <-- use the Login instance
        print("Saved token: ${login.token}");
        Get.offAllNamed(Routers.homeScreen);
      } else {
        print("No token found in backend response");
        SnackbarUtil.error(message: "Login failed: No token from server");
      }
    } catch (e) {
      print("❌ Google Sign-In Error: $e");
      SnackbarUtil.error(message: "Google sign-in failed");
    } finally {
      isSocial.value = false;
    }
  }

  // Future<void> loginWithApple() async {
  //   isSocial.value = true;
  //   try {
  //     final credential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );

  //     final oauthProvider = OAuthProvider("apple.com");
  //     final authCredential = oauthProvider.credential(
  //       idToken: credential.identityToken,
  //       accessToken: credential.authorizationCode,
  //     );

  //     final userCredential = await _auth.signInWithCredential(authCredential);
  //     final firebaseIdToken = await userCredential.user!.getIdToken(true);

  //     final response = await dio.post(
  //       "https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api/social-login",
  //       options: Options(headers: {"Content-Type": "application/json"}),
  //       data: {
  //         "token": firebaseIdToken,
  //         "provider": "apple.com",
  //       },
  //     );

  //     if (response.data != null && response.data['token'] != null) {
  //       final login = Login.fromJson(response.data); // <-- add this line
  //       await AppPreferences.setLoginData(login); // <-- use the Login instance
  //       print("Saved token: ${login.token}");
  //       Get.offAllNamed(Routers.homeScreen);
  //     } else {
  //       print("No token found in backend response");
  //       SnackbarUtil.error(message: "Login failed: No token from server");
  //     }

  //     print("✅ Apple Login Response: ${response.data[]}");
  //   } catch (e) {
  //     print("❌ Apple Sign-In Error: $e");
  //   } finally {
  //     isSocial.value = false;
  //   }
  // }

  Future<void> loginWithApple() async {
    isSocial.value = true;
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthProvider = OAuthProvider("apple.com");
      final authCredential = oauthProvider.credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      final userCredential = await _auth.signInWithCredential(authCredential);
      final firebaseIdToken = await userCredential.user!.getIdToken(true);

      final response = await dio.post(
        "https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api/social-login",
        options: Options(headers: {"Content-Type": "application/json"}),
        data: {
          "token": firebaseIdToken,
          "provider": "apple.com",
        },
      );

      if (response.data != null && response.data['token'] != null) {
        final login = Login.fromJson(response.data);
        await AppPreferences.setLoginData(login);
        print("✅ Saved token: ${login.token}");

        // Optionally log user info from the response
        // if (response.data['user'] != null) {
        //   print("👤 User Info: ${response.data['user']}");
        //    await AppPreferences.setUserData(profileData.toJson());

        // }

        if (response.data['user'] != null) {
          final userJson = response.data['user'];
          print("👤 User Info: $userJson");

          // Optionally convert this to a model if you have one
          // final user = User.fromJson(userJson);

          await AppPreferences.setUserData(userJson); // Save raw map directly
        }

        Get.offAllNamed(Routers.homeScreen);
      } else {
        print("⚠️ No token found in backend response: ${response.data}");
        SnackbarUtil.error(message: "Login failed: No token from server");
      }

      // ✅ Correct debug print
      print("✅ Full Apple Login Response: ${response.data}");
    } catch (e) {
      print("❌ Apple Sign-In Error: $e");
      SnackbarUtil.error(message: "Apple login failed");
    } finally {
      isSocial.value = false;
    }
  }

  // Future<void> loginWithFacebook() async {
  //   isSocialface.value = true;
  //   try {
  //     // Step 1: Facebook login
  //     final LoginResult result = await FacebookAuth.instance.login();

  //     if (result.status != LoginStatus.success || result.accessToken == null) {
  //       print("⚠️ Facebook login failed: ${result.message}");
  //       SnackbarUtil.error(message: "Facebook login failed");
  //       return;
  //     }

  //     // Step 2: Get Firebase AuthCredential
  //     final facebookAuthCredential =
  //         FacebookAuthProvider.credential(result.accessToken!.tokenString);

  //     final userCredential =
  //         await _auth.signInWithCredential(facebookAuthCredential);

  //     // Step 3: Get Firebase ID Token
  //     final firebaseIdToken = await userCredential.user!.getIdToken(true);

  //     // Step 4: Send token to backend
  //     final response = await dio.post(
  //       "https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api/social-login",
  //       options: Options(headers: {"Content-Type": "application/json"}),
  //       data: {
  //         "token": firebaseIdToken,
  //         "provider": "facebook.com",
  //       },
  //     );

  //     // Step 5: Save login and user data
  //     if (response.data != null && response.data['token'] != null) {
  //       final login = Login.fromJson(response.data);
  //       await AppPreferences.setLoginData(login);
  //       print("✅ Saved token: ${login.token}");

  //       if (response.data['user'] != null) {
  //         final userJson = response.data['user'];
  //         print("👤 User Info: $userJson");
  //         await AppPreferences.setUserData(userJson);
  //       }

  //       Get.offAllNamed(Routers.homeScreen);
  //     } else {
  //       print("⚠️ No token found in backend response: ${response.data}");
  //       SnackbarUtil.error(message: "Login failed: No token from server");
  //     }

  //     // Debug log
  //     print("✅ Full Facebook Login Response: ${response.data}");
  //   } catch (e) {
  //     print("❌ Facebook Sign-In Error: $e");
  //     SnackbarUtil.error(message: "Facebook login failed");
  //   } finally {
  //     isSocialface.value = false;
  //   }
  // }

  // Future<void> loginWithFacebook() async {
  //   isSocialface.value = true;

  //   try {
  //     // 🔹 Always log out first to clear stale/expired token

  //     // 🔹 Explicitly request permissions to avoid limited access token
  //     final LoginResult result = await FacebookAuth.instance.login(
  //       permissions: ['email', 'public_profile'],
  //     );

  //     if (result.status != LoginStatus.success || result.accessToken == null) {
  //       print("⚠️ Facebook login failed: ${result.message}");
  //       SnackbarUtil.error(message: "Facebook login failed");
  //       return;
  //     }

  //     // Debug: print token to verify in Facebook's Access Token Debugger
  //     print("🔑 FB Access Token: ${result.accessToken!.tokenString}");

  //     // Step 2: Get Firebase AuthCredential
  //     final facebookAuthCredential =
  //         FacebookAuthProvider.credential(result.accessToken!.tokenString);

  //     final userCredential =
  //         await _auth.signInWithCredential(facebookAuthCredential);

  //     // Step 3: Get Firebase ID Token
  //     final firebaseIdToken = await userCredential.user!.getIdToken(true);

  //     // Step 4: Send token to backend
  //     final response = await dio.post(
  //       "https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api/social-login",
  //       options: Options(headers: {"Content-Type": "application/json"}),
  //       data: {
  //         "token": firebaseIdToken,
  //         "provider": "facebook.com",
  //       },
  //     );

  //     // Step 5: Save login and user data
  //     if (response.data != null && response.data['token'] != null) {
  //       final login = Login.fromJson(response.data);
  //       await AppPreferences.setLoginData(login);
  //       print("✅ Saved token: ${login.token}");

  //       if (response.data['user'] != null) {
  //         final userJson = response.data['user'];
  //         print("👤 User Info: $userJson");
  //         await AppPreferences.setUserData(userJson);
  //       }

  //       Get.offAllNamed(Routers.homeScreen);
  //     } else {
  //       print("⚠️ No token found in backend response: ${response.data}");
  //       SnackbarUtil.error(message: "Login failed: No token from server");
  //     }

  //     print("✅ Full Facebook Login Response: ${response.data}");
  //   } catch (e) {
  //     print("❌ Facebook Sign-In Error: $e");
  //     SnackbarUtil.error(message: "Facebook login failed");
  //   } finally {
  //     isSocialface.value = false;
  //   }
  // }

  Future<void> loginWithFacebook() async {
    isSocialface.value = true; // show your custom loader instantly

    try {
      // Avoid Facebook native loader: use webOnly behavior
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
        loginBehavior: LoginBehavior.webOnly, // no native spinner
      );

      if (result.status != LoginStatus.success || result.accessToken == null) {
        SnackbarUtil.error(message: "Facebook login failed");
        return;
      }

      final facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.tokenString);

      final userCredential =
          await _auth.signInWithCredential(facebookAuthCredential);

      final firebaseIdToken = await userCredential.user!.getIdToken(true);

      final response = await dio.post(
        "https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api/social-login",
        options: Options(headers: {"Content-Type": "application/json"}),
        data: {
          "token": firebaseIdToken,
          "provider": "facebook.com",
        },
      );

      if (response.data != null && response.data['token'] != null) {
        final login = Login.fromJson(response.data);
        await AppPreferences.setLoginData(login);

        if (response.data['user'] != null) {
          await AppPreferences.setUserData(response.data['user']);
        }

        Get.offAllNamed(Routers.homeScreen);
      } else {
        SnackbarUtil.error(message: "Login failed: No token from server");
      }
    } catch (e) {
      SnackbarUtil.error(message: "Facebook login failed");
    } finally {
      isSocialface.value = false; // hide loader
    }
  }

  void forgotPassword() {
    Get.toNamed(Routers.forgotPassword);
  }

  void loadUserFromPrefs() {
    var data = AppPreferences.getData("rememberMe");
    print(data);
    Future.delayed(Duration(seconds: 1)).then((_) {
      formKey.currentState?.patchValue({...data ?? {}, 'password': ''});
    });
  }
}
