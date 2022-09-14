// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom/repository/auth.dart';
import 'package:zoom/repository/jitsi_meet_methods.dart';
import 'package:zoom/ui/zo3_create_meet/widget/meeting_option.dart';

class ZO3JoinMeeting extends StatefulWidget {
  const ZO3JoinMeeting({Key? key}) : super(key: key);

  @override
  State<ZO3JoinMeeting> createState() => _ZO3JoinMeetingState();
}

class _ZO3JoinMeetingState extends State<ZO3JoinMeeting> {
  final AuthRepository _authRepository = AuthRepository();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(
      text: _authRepository.user.displayName,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Join a Meeting',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: SizedBox(
              height: 60,
              child: TextField(
                controller: meetingIdController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room ID',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: SizedBox(
              height: 60,
              child: TextField(
                controller: nameController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(18),
            child: ElevatedButton(
              onPressed: _joinMeeting,
              child: const Text(
                'Join',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: const Size(
                  double.infinity,
                  50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          MeetingOption(
            text: 'Mute Audio',
            isMute: isAudioMuted,
            onChange: onAudioMuted,
          ),
          MeetingOption(
            text: 'Turn Off My Video',
            isMute: isVideoMuted,
            onChange: onVideoMuted,
          ),
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
