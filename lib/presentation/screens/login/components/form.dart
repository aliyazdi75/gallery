import 'package:ceit_alumni/blocs/authentication/bloc.dart';
import 'package:ceit_alumni/blocs/login/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/ceit_alumni_localizations.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          context.bloc<AuthenticationBloc>().add(
              const AuthenticationStatusChanged(
                  AuthenticationStatus.authenticated));
        } else if (state.status == LoginStatus.failure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  CeitAlumniLocalizations.of(context).authenticationFailure,
                ),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _UsernameInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _PasswordInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _LoginButton(formKey),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextFormField(
          onChanged: (username) =>
              context.bloc<LoginBloc>().add(LoginUsernameChanged(username)),
          validator: (username) => username.isEmpty
              ? CeitAlumniLocalizations.of(context).usernameNotEmpty
              : null,
          decoration: InputDecoration(
              labelText: CeitAlumniLocalizations.of(context).username),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          onChanged: (password) =>
              context.bloc<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          validator: (password) => password.isEmpty
              ? CeitAlumniLocalizations.of(context).passwordNotEmpty
              : null,
          decoration: InputDecoration(
              labelText: CeitAlumniLocalizations.of(context).password),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  _LoginButton(this.formKey);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.loading
            ? const CircularProgressIndicator()
            : RaisedButton(
                child: Text(CeitAlumniLocalizations.of(context).login),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    context.bloc<LoginBloc>().add(const LoginSubmitted());
                  }
                },
              );
      },
    );
  }
}
