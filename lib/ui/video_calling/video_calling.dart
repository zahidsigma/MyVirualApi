import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/services/singleton.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/utils/util.dart';

class VideoCallingScreen extends StatefulWidget {
  const VideoCallingScreen({super.key});
  @override
  State<VideoCallingScreen> createState() => _VideoCallingScreenState();
}

class _VideoCallingScreenState extends State<VideoCallingScreen> {
  InAppWebViewController? _webViewController;
  bool isVideoDisabled = false;
  bool isMuted = false;
  bool isLoaded = false;

  String sessionId = "";
  String username = "";
  String? patientName = "";

  _onVideoToggled() {
    _webViewController?.evaluateJavascript(source: """
   window.postMessage({type: 'video'});
  """);
    setState(() {
      isVideoDisabled = !isVideoDisabled;
    });
  }

  _onAudioToggled() {
    _webViewController?.evaluateJavascript(source: """
   window.postMessage({type: 'audio'});
  """);
    setState(() {
      isMuted = !isMuted;
    });
  }

  _switchCamera() {
    _webViewController?.evaluateJavascript(source: """
   window.postMessage({type: 'camera'});
  """);
  }

  _disconnect() {
    _webViewController?.evaluateJavascript(source: """
   window.postMessage({type: 'leave'});
  """);
    Get.back();
    // Future.delayed(Duration(seconds: 1)).then((value) {
    //   Get.toNamed(Routers.reviewScreen);
    //   var homeCtrl = Get.find<HomeController>();
    //   homeCtrl.ongoingSession.value.clear();
    // });
  }

  Widget _renderToggleButton(
      bool isToggled, IconData icon, Function() onPressed) {
    return IconButton(
      onPressed: onPressed,
      iconSize: 27,
      icon: Icon(
        icon,
        color: isToggled ? Colors.black45 : Colors.blue,
      ),
      style: IconButton.styleFrom(
          backgroundColor: isToggled ? Colors.blue : Colors.white),
    );
  }

  @override
  void initState() {
    super.initState();
    // print("vc_initState called");
    var session = Singleton.instance.session;

    setState(() {
      username = session["requestedBy"];
      sessionId = session["sessionId"];
      patientName = session["patientName"];
    });
    // print(widget.sessionId + widget.username);
    if (Platform.isAndroid) {
      AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
        // appBar: AppBar(title: Text("Video Call Demo")),s
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                child: InAppWebView(
                    initialUrlRequest: URLRequest(
                        // url: Uri.parse(
                        //     // "http://192.168.1.113:3000?userId=App&sessionId=12345678")),
                        //     // "https://192.168.1.113:3000?userId=${username}&sessionId=${sessionId}&dt=${DateTime.now().millisecondsSinceEpoch}")),
                        //     "https://testing-project-7095e.web.app?userId=${patientName}&sessionId=${sessionId}&dt=${DateTime.now().millisecondsSinceEpoch}")),
                        ),
                    initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                            mediaPlaybackRequiresUserGesture: false,
                            javaScriptEnabled: true

                            // debuggingEnabled: true,
                            ),
                        ios: IOSInAppWebViewOptions(
                          allowsInlineMediaPlayback: true,
                          // allowsPictureInPictureMediaPlayback: false,
                          // allowsAirPlayForMediaPlayback: false,
                          // allowsLinkPreview: true
                        )),
                    onReceivedServerTrustAuthRequest:
                        (controller, challenge) async {
                      return ServerTrustAuthResponse(
                          action: ServerTrustAuthResponseAction.PROCEED);
                    },
                    onWebViewCreated: (InAppWebViewController controller) {
                      _webViewController = controller;
                    },
                    androidOnPermissionRequest:
                        (InAppWebViewController controller, String origin,
                            List<String> resources) async {
                      return PermissionRequestResponse(
                          resources: resources,
                          action: PermissionRequestResponseAction.GRANT);
                    }),
              ),
              Positioned(
                  top: 10,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          width: 40,
                          height: 36,
                          child: GestureDetector(
                            onTap: () {
                              Util.showConfirmationDialog(
                                  context,
                                  'Exit Confirmation',
                                  'Do you want to close this session?',
                                  'Yes, Close',
                                  "No, Don't Close",
                                  _disconnect);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              Singleton.instance.session["doctorName"],
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: COLOR_PRIMARY,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "with ${patientName ?? 'Patient'}",
                              style:
                                  TextStyle(fontSize: 16, color: COLOR_ACCENT),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              if (false)
                Positioned(
                    bottom: 15,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _renderToggleButton(
                                isVideoDisabled,
                                isVideoDisabled
                                    ? Icons.videocam_off
                                    : Icons.videocam,
                                _onVideoToggled),
                            _renderToggleButton(
                                isMuted,
                                isMuted ? Icons.mic_off : Icons.mic,
                                _onAudioToggled),
                            IconButton(
                              onPressed: _switchCamera,
                              iconSize: 27,
                              icon: Icon(
                                Icons.cameraswitch,
                                color: Colors.blue,
                              ),
                              style: IconButton.styleFrom(
                                  backgroundColor: Colors.white),
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.red,
                              onPressed: () => _showConfirmationDialog(context),
                              child: Icon(
                                Icons.call_end,
                                color: Colors.white,
                              ),
                            )
                          ]),
                    ))
            ],
          ),
        ));
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button to close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exit Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to close this session?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("No, Don't Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Yes, Close'),
              onPressed: () {
                // Perform action here
                // For example, you can delete something or proceed with an operation
                // After performing the action, close the dialog
                Navigator.of(context).pop();
                _disconnect();
              },
            ),
          ],
        );
      },
    );
  }
}
