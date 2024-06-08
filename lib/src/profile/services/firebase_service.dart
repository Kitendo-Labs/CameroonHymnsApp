import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_service.g.dart';

final isSignedIn = StateProvider((ref) => false);

enum AuthenticationState {
  completed,
  loading,
  initial,
}

@riverpod
class FirebaseAuthentication extends _$FirebaseAuthentication {
  @override
  AuthenticationState build() {
    return AuthenticationState.initial;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    state = AuthenticationState.loading;
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    state = AuthenticationState.completed;
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signInWithApple() async {
    state = AuthenticationState.loading;
    await Future.delayed(const Duration(seconds: 4));
    state = AuthenticationState.completed;
  }
}
