import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tria/Screens/callscreens/call_screen.dart';
import 'package:tria/constants/strings.dart';
import 'package:tria/models/call.dart';
import 'package:tria/models/log.dart';
import 'package:tria/models/users.dart';
import 'package:tria/resources/call_methods.dart';
import 'package:tria/resources/local_db/repository/log_repository.dart';

class CallUtils {
  static final CallMethods callMethods = CallMethods();
  static dial({Users from, Users to, context}) async {
    Call call = Call(
      callerId: from.uid,
      callerName: from.name,
      callerPic: from.profilePhoto,
      receiverId: to.uid,
      receiverName: to.name,
      receiverPic: to.profilePhoto,
      channelId: Random().nextInt(1000).toString(),
    );

    Log log = Log(
      callerName: from.name,
      callerPic: from.profilePhoto,
      callStatus: CALL_STATUS_DIALLED,
      receiverName: to.name,
      receiverPic: to.profilePhoto,
      timestamp: DateTime.now().toString(),
    );
    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      LogRepository.addLogs(log);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallScreen(call: call),
          ));
    }
  }
}
