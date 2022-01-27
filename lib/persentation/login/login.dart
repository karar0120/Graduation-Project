
import 'package:advanced/persentation/border/border.dart';
import 'package:advanced/persentation/forgotpassword/forgotpassword.dart';
import 'package:advanced/persentation/resource/Color.dart';
import 'package:advanced/persentation/resource/Stringmanger.dart';
import 'package:advanced/persentation/resource/imageManger.dart';
import 'package:advanced/persentation/resource/route_manger.dart';
import 'package:advanced/persentation/resource/valuemanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'loginviewmodal.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = LoginViewModel(); // todo pass here login useCase
  FocusNode po=FocusNode();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManger.wight,
      body: Container(
        padding: const EdgeInsets.only(top: paddingApp.p100),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Image(image: AssetImage(StringImage.splash_logo)),
                const SizedBox(height: SizeApp.s28),
                Padding(
                  padding: const EdgeInsets.only(
                      left: paddingApp.p28, right: paddingApp.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsUserNameValid,
                    builder: (context, snapshot) {
                      return  TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _userNameController,
                        decoration: InputDecoration(
                            hintText: StringManger.username,
                            labelText: StringManger.username,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : StringManger.errorusername),
                      );
                    },
                  ),
                ),
                const SizedBox(height: SizeApp.s28),
                Padding(
                  padding: const EdgeInsets.only(
                      left: paddingApp.p28, right: paddingApp.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)
                            ),
                            hintText:StringManger.password,

                            labelText: StringManger.password,

                            errorText: (snapshot.data ?? true)
                                ? null
                                : StringManger.erorrpassword),
                      );
                    },
                  ),
                ),
                const SizedBox(height: SizeApp.s28),
                Padding(
                    padding: const EdgeInsets.only(
                        left: paddingApp.p28, right: paddingApp.p28),
                    child: StreamBuilder<bool>(
                      stream: _viewModel.outputIsAllInputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height: SizeApp.s40,

                          child: ElevatedButton(
                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                _viewModel.login();
                              }
                                  : null,
                              child: Text("Login")),
                        );
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    top: paddingApp.p8,
                    left: paddingApp.p28,
                    right: paddingApp.p28,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context,routeManger.forgotpasswordRoute );
                        },
                        child: Text(StringManger.forgetPassword,
                            style: Theme.of(context).textTheme.subtitle2),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context,routeManger.registerRoute);
                        },
                        child: Text(StringManger.registerText,
                            style: Theme.of(context).textTheme.subtitle2),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}