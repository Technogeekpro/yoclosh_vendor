import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class YoCloshVendorFirebaseUser {
  YoCloshVendorFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

YoCloshVendorFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<YoCloshVendorFirebaseUser> yoCloshVendorFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<YoCloshVendorFirebaseUser>(
            (user) => currentUser = YoCloshVendorFirebaseUser(user));
