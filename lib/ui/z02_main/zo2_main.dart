import 'package:flutter/material.dart';
import 'package:zoom/ui/zo3_create_meet/page/zo3_meeting.dart';
import 'package:zoom/ui/zo4_history_meetting/zo4_history_meetting.dart';
import 'package:zoom/ui/zo5_account/zo5_account.dart';

class ZO2Main extends StatefulWidget {
  const ZO2Main({Key? key}) : super(key: key);

  @override
  State<ZO2Main> createState() => _ZO2MainState();
}

class _ZO2MainState extends State<ZO2Main> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> _screen = [
    ZO3Meeting(),
    ZO4HistoryMeetting(),
    ZO5Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_page],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 2.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xff40BFFF),
          unselectedItemColor: const Color(0xff9098B1),
          currentIndex: _page,
          onTap: onPageChanged,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: 'Meet '),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.lock_clock,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Contacts',
            ),
          ]),
    );
  }
}
