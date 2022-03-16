import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/bloc/LoginAuth/auth_bloc.dart';
import '../../../Components/loader.dart';
import '../../../Components/spacers.dart';
import '../Widgets/button.dart';
import '../Widgets/text_data_widget.dart';
import '../Widgets/text_form_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FocusNode usernameFocus;
  late FocusNode passwordFocus;
  late FocusNode loginBtnFocus;
  late TextEditingController userName;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
    loginBtnFocus = FocusNode();
    userName = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    usernameFocus.dispose();
    passwordFocus.dispose();
    loginBtnFocus.dispose();
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state)  {
            if (state is AuthError) {
              buildErrorLayout();
            } else if (state is AuthLoaded) {
              clearTextData();
              Navigator.of(context)
                  .pushNamed('/dashboard', arguments: state.username);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const LoadingWidget();
            } else {
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextData(message: "User"),
          const HeightSpacer(myHeight: 50),
          InputField(
            focusNode: usernameFocus,
            textController: userName,
            label: "Username",
            icons: const Icon(Icons.person, color: Colors.blue),
          ),
          const HeightSpacer(myHeight: 20),
          InputField(
            focusNode: passwordFocus,
            textController: password,
            label: "Password",
            icons: const Icon(Icons.lock, color: Colors.blue),
          ),
          const HeightSpacer(myHeight: 20),
          ButtonWidget(
            focusNode: loginBtnFocus,
            userName: userName,
            password: password,
          ),
        ],
      );

  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username/password!'),
        ),
      );

  clearTextData() {
    userName.clear();
    password.clear();
  }
}
