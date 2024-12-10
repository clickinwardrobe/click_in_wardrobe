import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../my_app_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea:'),
          Text(appState.current.asLowerCase),

          ElevatedButton(
            onPressed: () {
                print(appState.current);
            },
            child: Text('Next')
          ),
        ],
      ),
    );
  }
}
