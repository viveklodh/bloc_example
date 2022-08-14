import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc /login_bloc/login_bloc.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          _scaffoldKey.currentState
              ?.showSnackBar(new SnackBar(content: new Text(state.email!)));

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePage(state.email!)));
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // BlocBuilder<LoginBloc, LoginState>(
                //   builder: (context, state) {
                //     if (state is LoginInitialState) {
                //       return Text("welcome",
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold, fontSize: 30));
                //     } else if (state is LoginLoadingState) {
                //       return CircularProgressIndicator();
                //     } else if (state is LoginSuccessState) {
                //       return Container(
                //         color: Colors.green,
                //         width: 200,
                //         height: 200,
                //         child: Center(
                //             child: Text(
                //           state.email ?? "error",
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold, fontSize: 30),
                //         )),
                //       );
                //     } else if (state is LoginFailureState) {
                //       return Container(
                //         color: Colors.red,
                //         width: 200,
                //         height: 200,
                //         child: Center(
                //             child: Text(
                //           "error",
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold, fontSize: 30),
                //         )),
                //       );
                //     } else {
                //       return Text("Thanks");
                //     }
                //   },
                // ),
                TextFormField(
                  controller: emailController,
                ),
                TextFormField(
                  controller: passwordController,
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(context).add(LoginSubmitEvent(
                          emailController.text, passwordController.text));
                    },
                    child: Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
