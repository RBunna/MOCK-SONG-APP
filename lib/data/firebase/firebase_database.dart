class FirebaseConfig {
  static const firebaseUrl = String.fromEnvironment('FIREBASE_URL');
  static final Uri baseUri = Uri.https(Uri.parse(firebaseUrl).authority);
}
