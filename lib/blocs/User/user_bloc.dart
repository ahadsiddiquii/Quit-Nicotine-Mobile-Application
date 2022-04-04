import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nicotine/resources/firebase_services/OnBoardingFirestoreService.dart';

import '../../models/User.dart';
import '../../utils/local_storage.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());
  final onBoardingFirestoreService = OnBoardingFirestoreService();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is InitialStatePush) {
      yield UserInitial();
    } else if (event is CheckIfLoggedIn) {
      yield UserSplashScreen();
      try {
        print("Inside Check if Logged in");
        if (Storage.getValue("userId") == null ||
            Storage.getValue("userId") == "null") {
          print('Not Logged In, key not found');
          yield UserInitial();
        } else {
          print('pref key found');
          final userId = Storage.getValue("userId");

          final user =
              await onBoardingFirestoreService.withOutPasswordLogin(userId!);

          yield UserLoggedIn(user: user);
        }
      } catch (e) {
        print('Error');
        print(e.toString());
        yield UserInitial();
      }
    } else if (event is SignUp) {
      yield UserLoading();
      try {
        print("UserBloc: SignUp event");

        User user = await onBoardingFirestoreService.createUser(
            event.email, event.fullName, event.password);

        if ((user.userQuestionsAsked!) == false) {
          yield UserShowQuestions(user: user);
        } else {
          Storage.setValue("userId", user.userId!);

          yield UserLoggedIn(user: user);
        }
      } catch (e) {
        print('error in Signup');
        yield LogInError(error: e.toString());
      }
    } else if (event is SignIn) {
      yield UserLoading();
      try {
        print("UserBloc: SignIn event");

        User user = await onBoardingFirestoreService.loginUser(
            event.email, event.password);
        if ((user.userQuestionsAsked!) == false) {
          yield UserShowQuestions(user: user);
        } else {
          Storage.setValue("userId", user.userId!);

          yield UserLoggedIn(user: user);
        }
      } catch (e) {
        print('error in Signup');
        yield LogInError(error: e.toString());
      }
    } else if (event is QuestionsSubmitted) {
      yield UserLoading();
      try {
        print("UserBloc: QuestionsSubmitted event");

        User user =
            await onBoardingFirestoreService.questionsSubmitted(event.userId);

        Storage.setValue("userId", user.userId!);

        yield UserLoggedIn(user: user);
      } catch (e) {
        print('error in Signup');
        yield LogInError(error: e.toString());
      }
    } else if (event is UpdateProfile) {
      try {
        print("UserBloc: UpdateProfile event");

        User user = await onBoardingFirestoreService.updateProfile(event.user,
            event.email, event.fullName, event.password, event.mistake);

        yield UserLoggedIn(user: user);
      } catch (e) {
        print('error in Signup');
        yield LogInError(error: e.toString());
      }
    } else if (event is Logout) {
      print("UserBloc: Logout event");
      Storage.setValue('userId', 'null');
      yield UserInitial();
    }
  }
}
