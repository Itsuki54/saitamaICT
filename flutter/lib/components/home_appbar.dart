import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text("KUDAMONO CODE",
            style: GoogleFonts.anton(
                fontSize: 32, color: Theme.of(context).colorScheme.onPrimary)),
        backgroundColor: Theme.of(context).primaryColor);
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
