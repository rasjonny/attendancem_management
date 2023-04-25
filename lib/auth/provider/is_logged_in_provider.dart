import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as devtools show log;
extension Log on Object{
void log()=>devtools.log(toString());
}
// final isLoggedInProvider = Provider<bool>((ref) {
//   final result = ref.watch(authStateProvider);
//   return result.result == AuthResult.success;
// });

final isLoggedInProvider = FutureProvider<bool>((ref) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  if (token != null && token != '') {
    token.log();
    return true;
  } else {
    return false;
  }
});
