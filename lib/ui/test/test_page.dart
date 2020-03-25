import 'package:flutter/material.dart';
import 'package:stock/rpc/user/users.pb.dart';
import 'package:stock/service/user_service.dart';

enum LoadingPhase {
  loading,
  loaded,
}

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // State variables
  List<User> users = [];
  LoadingPhase loadingPhaseVariable;

  @override
  void initState() {
    _getUsers();
    setState(() {
      loadingPhaseVariable = LoadingPhase.loading;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildChildren(context),
    );
  }

  Widget _buildChildren(BuildContext context) {
    switch (loadingPhaseVariable) {
      case LoadingPhase.loading:
        return CircularProgressIndicator();
      case LoadingPhase.loaded:
        return new ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int i) => Text(users[i].name),
        );
    }
    return null;
  }

  Future<void> _getUsers() async {
    var users = await UserService.getUsers();
    setState(() {
      users = users;
    });
  }
}
