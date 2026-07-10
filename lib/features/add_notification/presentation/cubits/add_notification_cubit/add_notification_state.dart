abstract class AddNotificationStates {}

final class InitialAddNotificationState extends AddNotificationStates {}

final class SuccessAddNotificationState extends AddNotificationStates {}


final class LoadingAddNotificationState extends AddNotificationStates {}


final class FailureAddNotificationState extends AddNotificationStates {
  final String errorMessage;

  FailureAddNotificationState({required this.errorMessage});
}


