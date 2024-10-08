import 'package:flutter/material.dart';
import 'package:putt_putt_pal/widgets/waiting_room/HostSettingsInput.dart';

class HostSettings extends StatelessWidget {
  const HostSettings({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.85;

    return Container(
      alignment: Alignment.topCenter,
      child: Column(
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
