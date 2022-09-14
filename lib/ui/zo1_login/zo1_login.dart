import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom/bloc/auth_bloc.dart';
import 'package:zoom/repository/auth.dart';
import 'package:zoom/ui/z02_main/zo2_main.dart';

//SHA1: 1E:64:12:68:F5:C0:87:CB:0C:51:14:77:CA:3D:36:3F:F4:76:D7:ED
//  SHA256: 7C:06:52:B0:04:41:55:40:B9:B1:9A:AC:BB:30:AD:AA:B5:42:72:43:3E:D8:A0:9C:8A:A5:69:AB:E3:0C:62:7D
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthRepository _authRepository = AuthRepository();

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ZO2Main(),
              ),
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UnAuthenticated) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Start or join a metting',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  Image.asset('assets/images/genaral.png'),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: ElevatedButton(
                      onPressed: () {
                        _authenticateWithGoogle(context);
                      },
                      child: Text('Google Sign In'),
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
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
