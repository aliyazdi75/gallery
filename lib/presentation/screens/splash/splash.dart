import 'package:ceit_alumni/blocs/authentication/bloc.dart';
import 'package:ceit_alumni/data/repositories/gallery/index.dart';
import 'package:ceit_alumni/presentation/screens/home/home.dart';
import 'package:ceit_alumni/presentation/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/ceit_alumni_localizations.dart';

class SplashPage extends StatelessWidget {
  const SplashPage();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.authenticated:
            Navigator.of(context).pushNamed(
              HomePage.homeRoute,
              arguments: HomePageArguments(
                galleryRepository: GalleryRepository(),
              ),
            );
            break;
          case AuthenticationStatus.unauthenticated:
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        body: Center(
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(LoginPage.loginRoute);
            },
            child: Text(CeitAlumniLocalizations.of(context).login),
          ),
        ),
      ),
    );
  }
}
