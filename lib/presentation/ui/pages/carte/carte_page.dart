import 'package:appli_r/presentation/ui/pages/carte/widgets/bottom_sheet.dart';
import 'package:appli_r/presentation/ui/pages/carte/widgets/carte.dart';
import 'package:appli_r/presentation/ui/pages/carte/widgets/top_barre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';

class CartePage extends StatefulWidget {
  final void Function(bool) isNavDisplayed;

  const CartePage({super.key, required this.isNavDisplayed});

  @override
  State<CartePage> createState() => _CartePageState();
}

class _CartePageState extends State<CartePage> {
  bool isFullScreen = false;
  bool isBottomSheetMaxSize = false;
  final ValueNotifier<double> sheetExtent = ValueNotifier(0.0);

  void _enterFullScreen() {
    widget.isNavDisplayed(false);
    setState(() {
      isFullScreen = true;
    });
  }

  void _exitFullScreen() {
    widget.isNavDisplayed(true);
    setState(() {
      isFullScreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider<MapController>(
      create: (context) => MapController(),
      child: Stack(
        children: [
          Listener(
            onPointerDown: (_) => _enterFullScreen(),
            child: CarteWidget(),
          ),

          TopBarreCarte(
            isFullScreen: isFullScreen,
            isCoveredByBottomSheet: isBottomSheetMaxSize,
            exitFullScreen: () => _exitFullScreen(),
          ),

          ValueListenableBuilder<double>(
            valueListenable: sheetExtent,
            builder: (context, extent, _) {
              final opacity = (((extent - 0.5) * 0.5).clamp(0.0, 0.2) * 255).toInt();
              return IgnorePointer(
                ignoring: true,
                child: Container(color: Color.fromARGB(opacity, 0, 0, 0)),
              );
            },
          ),

          BottomSheetCarte(
            onExpandChanged: (booleen) =>
                setState(() => isBottomSheetMaxSize = booleen),
            sheetExtentNotifier: sheetExtent,
          ),
        ],
      ),
    );
  }
}
