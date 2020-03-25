import 'package:flutter/material.dart';
import 'package:stock/widgets/lib/widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isObscure = true;
  Color _eyeColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          children: _buildChildren(context),
        ),
      ),
    );
  }

  List<Widget> _buildChildren(BuildContext context) => [
        _buildTitle(context),
        _buildAccountTextField(context),
        _buildPasswordTextField(context),
        SizedBox(height: 60.0),
        buildLoginButton(context),
      ];

  Widget buildLoginButton(BuildContext context) {
    return MaxWidthFilledButton(
      title: '登陆',
      onPressed: () {
        if (_formKey.currentState.validate()) {
          ///只有输入的内容符合要求通过才会到达此处
          _formKey.currentState.save();
          //TODO 执行登录方法
          print('email:$_email , assword:$_password');
        }
      },
      buttonColor: Colors.blue[300],
    );
  }

  /// Build the Welcome Title.
  static Widget _buildTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100, bottom: 20),
      alignment: Alignment.center,
      child: Text(
        '欢迎登陆',
        style: TextStyle(fontSize: 36.0),
      ),
    );
  }

  /// Build the account text field.
  Widget _buildAccountTextField(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextFormField(
        style: TextStyle(
          fontSize: theme.textTheme.subhead.fontSize,
        ),
        decoration: InputDecoration(
          labelText: '账号  ',
          hintText: '请输入用户名',
        ),
        onSaved: (String value) => _email = value,
      ),
    );
  }

  /// Build the password text field, support hide pwd.
  Widget _buildPasswordTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        onSaved: (String value) => _password = value,
        obscureText: _isObscure,
        decoration: InputDecoration(
            labelText: '密码  ',
            hintText: '请输入6-8位密码',
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: _eyeColor,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                    _eyeColor = _isObscure
                        ? Colors.grey
                        : Theme.of(context).iconTheme.color;
                  });
                })),
      ),
    );
  }
}
