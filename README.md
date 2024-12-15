# Bloc Fake Login
Just figuring out a simple login system.

Built with flutter and bloc.

## Purpose
Learn to develop flutter apps using BLoC to separate presentation from business logic and gauge its benefits over Provider.
* Updated UI based on part of bloc state with context.select<SubjectBloc, SelectedOutput>(..).
* Used Equatable to prevent unnecessary rebuilds.
* Added evens with context.read<SubjectBloc>().add(BlocEvent)
* Built app using BlocListener, RepositoryProvider, and BlocProvider.

## Acknowledgements
This project was based on "Flutter Login," a tutorial application available on the [Bloc Library](https://bloclibrary.dev/tutorials/flutter-login).
