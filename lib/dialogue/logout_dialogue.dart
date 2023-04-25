import 'package:flutter/foundation.dart' show immutable;

import 'alert_dialogue.dart';

@immutable
class LogoutDialogue extends AlertDialogueModel<bool> {
  LogoutDialogue()
      : super(
          title: 'Logout',
          message:
              'Are You Sure You Want To Logout',
          buttons: {
            'Logout': true,
            'Cancel': false,
          },
        );
}
