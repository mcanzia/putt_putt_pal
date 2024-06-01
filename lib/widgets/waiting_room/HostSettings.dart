import 'package:flutter/material.dart';
import 'package:putt_putt_pal/widgets/waiting_room/HostSettingsInput.dart';

class HostSettings extends StatelessWidget {
  const HostSettings({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.7;

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints:
                BoxConstraints(minWidth: buttonWidth, maxWidth: buttonWidth),
            child: HostSettingsInput(),
          ),
        ],
      ),
    );
  }
}
