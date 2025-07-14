import 'package:appli_r/pages/carte/widgets/topBarWidgets/transport_configuration_button.dart';
import 'package:appli_r/pages/carte/widgets/topBarWidgets/localisation_button.dart';
import 'package:flutter/material.dart';

class TopBarreCarte extends StatefulWidget {
  final bool isFullScreen;
  final bool isCoveredByBottomSheet;
  final void Function() exitFullScreen;

  const TopBarreCarte({
    super.key,
    required this.isFullScreen,
    required this.isCoveredByBottomSheet,
    required this.exitFullScreen,
  });

  @override
  State<TopBarreCarte> createState() => _TopBarreState();
}

class _TopBarreState extends State<TopBarreCarte> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      right: 10,
      left: widget.isFullScreen ? 0 : 10,
      child: AnimatedOpacity(
        opacity: widget.isCoveredByBottomSheet ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: Column(
          spacing: 10,
          children: [
            Row(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, anim) => SizeTransition(
                    sizeFactor: anim,
                    axis: Axis.horizontal,
                    child: child,
                  ),
                  child: widget.isFullScreen
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 67, 189, 189),
                            foregroundColor: Colors.white,
                            shape: const CircleBorder(),
                          ),
                          onPressed: () {
                            widget.exitFullScreen();
                          },
                          child: Icon(Icons.arrow_back_ios),
                        )
                      : const SizedBox.shrink(key: ValueKey('empty')),
                ),
                Expanded(
                  child: SearchBar(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    leading: const Icon(Icons.search),
                    hintText: 'Rechercher...',
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(children: [LocalisationButton(), TransportConfigurationButton()]),
            ),
          ],
        ),
      ),
    );
  }
}
