import 'package:account_service/account_service.dart';
import 'package:authentication_service/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:login_service/login_service.dart';

import 'components/form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(GalleryLocalizations.of(context).login)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
              accountRepository:
                  RepositoryProvider.of<AccountRepository>(context),
            );
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}
