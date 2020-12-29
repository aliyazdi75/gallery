import 'package:ceit_alumni/blocs/login/bloc.dart';
import 'package:ceit_alumni/data/repositories/account/index.dart';
import 'package:ceit_alumni/data/repositories/authentication/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/ceit_alumni_localizations.dart';

import 'components/form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  static const String loginRoute = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(CeitAlumniLocalizations.of(context).login)),
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
