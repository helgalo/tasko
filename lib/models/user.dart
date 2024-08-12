import 'package:firebase_auth/firebase_auth.dart';

class Session {
  final SessionService sessionService;
  Session(this.sessionService);

  User? getUser(FirebaseAuth firebaseAuth) {
    return sessionService.getUser();
  }
}

abstract class SessionService {
  User? getUser();
}

class AuthSessionService implements SessionService {
  final FirebaseAuth firebaseAuth;
  AuthSessionService(this.firebaseAuth);

  User? getUser() {
    return firebaseAuth.currentUser;
  }
}
