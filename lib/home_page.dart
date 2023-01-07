import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// ホームページ画面
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ホーム画面'),
            ElevatedButton(
                onPressed: () {
                  context.go("/myPage/tab1");
                },
                child: const Text('マイページ(タブが存在するページ)に遷移する')),
          ],
        ),
      ),
    );
  }
}
