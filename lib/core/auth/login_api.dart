import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';

class LoginApi {
  static final _googleSignIn = GoogleSignIn(
    scopes: [CalendarApi.calendarScope],
  );

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future<GoogleSignInAccount?> signOut() => _googleSignIn.signOut();

  static Future<Events> getCalendar() async {
    var httpClient = (await _googleSignIn.authenticatedClient())!;
    Events eventList = await CalendarApi(httpClient)
        .events
        .list('primary',
            timeZone: 'id',
            orderBy: 'startTime',
            singleEvents: true,
            timeMin: DateTime.now().add(
              const Duration(days: -10),
            ),
            timeMax: DateTime.now().add(
              const Duration(days: 30),
            ));
    return eventList;
  }
}
