import 'package:flutter/material.dart';
import '../components/custom_icon.dart';
import '../widgets/create_account_bottom_sheet.dart';
import '../widgets/login_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'Assets/images/image2.png',
            ),
          ),
          const Text(
            'WELCOME',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 27,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Column(
            children: [
              Text(
                'Lorem ipsum dolor sit amet,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                'consectetur adipiscing elit, sed ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                ' do eiusmod',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          CustomIconButton(
            color: Colors.yellow,
            text: 'Create Account',
            onPressed: () => showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.yellow.shade100,
                context: context,
                builder: (context) => CreateAccountBottomSheet()),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomIconButton(
            color: Colors.black,
            text: ' Login ',
            colorText: Colors.yellow,
            border: Border.all(color: Colors.yellow, width: 2),
            onPressed: () {
              return showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.yellow.shade100,
                  context: context,
                  builder: (context) => LoginBottomSheet());
            },
          ),
          const SizedBox(

            height: 45,
          ),
          const Text('All Right Reserved @2021',
              style: TextStyle(color: Colors.yellow, fontSize: 12))
        ],
      ),
    );
  }
}
