import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:KUDAMONOCode/components/file_button.dart';
import 'package:KUDAMONOCode/components/directory_button.dart';
import 'package:KUDAMONOCode/components/home_appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF161616),
        appBar: const HomeAppBar(),
        body: Column(children: [
          const SizedBox(height: 16),
          Row(children: [
            const SizedBox(width: 18),
            Text("Home",
                style: GoogleFonts.anton(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onPrimary))
          ]),
          Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      shrinkWrap: true,
                      children: [
                        FileButton(
                          onPressed: () {},
                          onLeaderPressed: () {},
                          fileName: "abcd1234",
                        ),
                      ]),
                ],
              ))
        ]));
  }
}
