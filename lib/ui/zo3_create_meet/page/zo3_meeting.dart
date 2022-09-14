import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom/main.dart';
import 'package:zoom/repository/jitsi_meet_methods.dart';
import 'package:zoom/ui/zo3_create_meet/widget/zo3_join_meetting.dart';
import 'package:zoom/utils/common/home_meeting_button.dart';

class ZO3Meeting extends StatelessWidget {
  ZO3Meeting({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ZO3JoinMeeting(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeMeetingButton(
                      onPressed: createNewMeeting,
                      text: 'New Meeting',
                      icon: Icons.videocam,
                      color: Colors.amber[700],
                    ),
                    HomeMeetingButton(
                      onPressed: () => joinMeeting(context),
                      text: 'Join Meeting',
                      icon: Icons.add_box_rounded,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 250,
                  child: Image.asset(
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? 'assets/images/genaral.png'
                        : 'assets/images/onboarding.jpg',
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Create/Join Meetings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
