import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121127),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 42),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Center(
                      child: Text("D"),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: const [
                      Text(
                        "Welcome Back!",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Devon Albex",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child:
                        Center(child: Image.asset("assets/icons/Profile.png")),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFF1f1e34),
                    ),
                  ),
                ],
              ),
              ListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
