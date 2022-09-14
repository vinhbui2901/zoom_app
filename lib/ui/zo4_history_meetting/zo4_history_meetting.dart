import 'package:flutter/material.dart';
import 'package:zoom/repository/firestore.dart';
import 'package:intl/intl.dart';

class ZO4HistoryMeetting extends StatelessWidget {
  const ZO4HistoryMeetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => Container(
            child: Center(
              child: ListTile(
                title: Center(
                  child: Text(
                    'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
