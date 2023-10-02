import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
//SignIn Function
Future<User?> signInWithGoogle() async {
  final _auth = FirebaseAuth.instance;
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);
  //Credential signing in
  final UserCredential = await _auth.signInWithCredential(credential);
  final User? user = UserCredential.user;
  //Checking of User
  assert(!user!.isAnonymous);
  assert(await user?.getIdToken() != null);
  final User? currentUser = await _auth.currentUser;
  assert(currentUser?.uid == user?.uid);
  print(user);
  return user;
}
