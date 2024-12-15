import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../bloc/login_bloc.dart';
import '../models/models.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failed')),
            );
        }
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: _UsernameInput(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: _PasswordInput(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _SubmitButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (LoginBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);

    return ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      onPressed: isValid
          ? () => context.read<LoginBloc>().add(LoginSubmitted())
          : null,
      child: const Text('Login'),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select<LoginBloc, UsernameValidationError?>(
      (bloc) => bloc.state.username.displayError,
    );
    return TextField(
      key: const ValueKey('loginForm_usernameInput_textField'),
      onChanged: (String value) {
        context.read<LoginBloc>().add(LoginUsernameChanged(username: value));
      },
      decoration: InputDecoration(
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: 'Username',
        hintText: 'Enter your username',
        errorText: displayError?.text(),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select<LoginBloc, PasswordValidationError?>(
      (bloc) => bloc.state.password.displayError,
    );
    return TextField(
      key: const ValueKey('loginForm_usernameInput_textField'),
      onChanged: (String value) {
        context.read<LoginBloc>().add(LoginPasswordChanged(password: value));
      },
      decoration: InputDecoration(
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: 'Password',
        hintText: 'Enter your password',
        errorText: displayError?.text(),
      ),
    );
  }
}
