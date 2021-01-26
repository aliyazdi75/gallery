import 'package:authentication_service/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:gallery/presentation/screens/login/login.dart';

class SplashPage extends StatelessWidget {
  const SplashPage();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.authenticated:
            // Navigator.of(context).pushNamed(
            //   HomePage.homeRoute,
            //   arguments: GalleryWidget(
            //     galleryRepository: GalleryRepository(),
            //   ),
            // );
            break;
          case AuthenticationStatus.unauthenticated:
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(LoginPage.loginRoute);
            },
            child: Text(GalleryLocalizations.of(context).login),
          ),
        ),
      ),
    );
  }
}
