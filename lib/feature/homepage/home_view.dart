import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 42),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Center(
                    child: Text("D"),
                  ),
                ),
                Column(
                  children: const [
                    Text("Welcome Back!"),
                    Text("Devon Albex"),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
