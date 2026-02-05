import 'dart:developer';

import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/smtp_server.dart';

import 'package:serverpod_openapi/serverpod_openapi.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'package:wm_server/src/web/routes/root.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');

  // Add OpenAPI documentation route
  pod.webServer.addRoute(
    RouteOpenApi(
      pod,
      title: 'weMultiply API',
      version: '1.0.0',
      description: 'API documentation for my weMultiply application.',
    ),
    '/openapi',
  );

  // Note: Static file serving removed due to Relic routing conflicts.
  // If you need static files, consider using a CDN or configuring
  // static files through your web server (nginx/apache) instead.

  //authentication config
  auth.AuthConfig.set(
    auth.AuthConfig(
      minPasswordLength: 8,
      sendValidationEmail: (session, email, validationCode) async {
        // ignore: avoid_print
        print('Send email to $email with validation code: $validationCode');
        // retrieve email server settings from passwords config
        final gmailEmail = session.passwords['gmailEmail'];
        final gmailPassword = session.passwords['gmailPassword'];

        final smtpServer = gmail(gmailEmail!, gmailPassword!);

        // Create an email message with the validation link.
        final message = mailer.Message()
          ..from = mailer.Address(gmailEmail)
          ..recipients.add(email)
          ..subject = 'Email validation for WeMultiply'
          ..html = 'Here is your validation code: $validationCode>';
        try {
          log('Attempting to send email to $email');
          await mailer.send(message, smtpServer);
        } catch (e) {
          // ignore: avoid_print
          print('Error sending email: $e');
          session.log(
            'Error sending email $e',
            level: LogLevel.error,
          );
          return false;
        }
        session.log('Validation email was sent to $email', level: LogLevel.info);
        return true;
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        // ignore: avoid_print
        print('Send password reset email to ${userInfo.email} with code: $validationCode');
        // Retrieve the credentials from passwords config
        final gmailEmail = session.passwords['gmailEmail']!;
        final gmailPassword = session.passwords['gmailPassword']!;

        // Create a SMTP client for Gmail.
        final smtpServer = gmail(gmailEmail, gmailPassword);

        // Create an email message with the password reset link.
        final message = mailer.Message()
          ..from = mailer.Address(gmailEmail)
          ..recipients.add(userInfo.email!)
          ..subject = 'Password reset link for weMultiply'
          ..html = 'Here is your password reset code: $validationCode>';

        // Send the email message.
        try {
          await mailer.send(message, smtpServer);
        } catch (_) {
          // Return false if the email could not be sent.
          session.log(
            'Error:',
            level: LogLevel.error,
          );
          return false;
        }
        session.log(
          'User reset email was sent to ${userInfo.email}',
          level: LogLevel.info,
        );
        return true;
      },
      onUserCreated: (session, auth.UserInfo userInfo) async {
        if (userInfo.email?.startsWith('wemultiply') ?? false) {
          //add admin scope to the user
          await auth.Users.updateUserScopes(
            session,
            userInfo.id!,
            {
              Scope.admin,
              Scope('APIUser'),
            },
          );
          session.log(
            'User ${userInfo.email} created with admin scope',
            level: LogLevel.info,
          );
        }
      },
      // onUserUpdated: (session, userInfo) {
      //   log('User updated, $userInfo');
      // },
    ),
  );

  // Start the server.
  await pod.start();

  // After starting the server, you can schedule future calls. Future calls are
  // tasks that need to happen in the future, or independently of the request/
  // response cycle. For example, you can use future calls to send emails, or to
  // schedule tasks to be executed at a later time. Future calls are executed in
  // the background. Their schedule is persisted to the database, so you will
  // not lose them if the server is restarted.
  //
  // In Serverpod 3.x, future calls use a type-safe generated API.
  // After running `serverpod generate`, you can schedule calls like:
  // await pod.futureCalls
  //   .callWithDelay(const Duration(seconds: 5))
  //   .birthdayReminder
  //   .sendReminder('Hello!', 'Serverpod Server');
}
