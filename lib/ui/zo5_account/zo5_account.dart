import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom/bloc/auth_bloc.dart';
import 'package:zoom/main.dart';
import 'package:zoom/repository/auth.dart';
import 'package:zoom/ui/zo1_login/zo1_login.dart';

class ZO5Account extends StatelessWidget {
  ZO5Account({Key? key}) : super(key: key);

  final AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Account'),
        actions: [
          IconButton(
              icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: () {
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              })
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 60),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        '${_authRepository.user.photoURL}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'UserName',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          '${_authRepository.user.displayName}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          '${_authRepository.user.email}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    child: const Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.blue),
                      ),
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(SignOutRequested());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
