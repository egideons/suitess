import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kribb/app/auth/signup/content/signup_cupertino_nav_bar.dart';
import 'package:kribb/app/auth/signup/content/signup_page_header.dart';

class SignupCupertinoScaffold extends StatelessWidget {
  const SignupCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return CupertinoPageScaffold(
      navigationBar:
          signupCupertinoNavBar(colorScheme: colorScheme, media: media),
      child: SafeArea(
        child: ListView(
          children: [
            signupPageHeader(colorScheme: colorScheme, media: media),
          ],
        ),
      ),
    );
  }
}
