import 'package:serverpod/serverpod.dart';

/// This is a simple example of a future call that logs a birthday reminder.
///
/// In a real-world application, you would implement the logic to send a
/// an email or a push notification to the user.
class BirthdayReminder extends FutureCall {
  Future<void> sendReminder(Session session, String message, String author) async {
    // This is where you would implement the logic to send a birthday reminder.
    // For example, you could send an email or a notification to the user.
    session.log('$message from $author - Remember to send a birthday card!');
  }
}
