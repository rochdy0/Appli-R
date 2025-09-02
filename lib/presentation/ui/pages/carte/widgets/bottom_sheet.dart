import 'package:appli_r/presentation/ui/pages/carte/widgets/bottomSheetWidgets/bottom_sheet_container.dart';
import 'package:appli_r/presentation/viewmodels/voi_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetCarte extends StatefulWidget {
  final void Function(bool isExpanded) onExpandChanged;
  final ValueNotifier<double> sheetExtentNotifier;

  const BottomSheetCarte({
    super.key,
    required this.onExpandChanged,
    required this.sheetExtentNotifier,
  });

  @override
  State<BottomSheetCarte> createState() => _BottomSheetCarteState();
}

class _BottomSheetCarteState extends State<BottomSheetCarte> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();
  bool _wasExpanded = false;
  final List<double> _palierTailleSheet = [0.08, 0.4, 0.925];
  double _lastExtent = 0.4;
  double _maxChildSize = 0.925;
  double _minChildSize = 0.08;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateMaxSize();
  }

  void updateMaxSize() {
    if (context.watch<VoiViewModel>().selectedVehicule != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.animateTo(
          0.3,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      });

      setState(() {
        _maxChildSize = 0.3;
        _lastExtent = 0.3;
        _minChildSize = 0.3;
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.animateTo(
          0.4,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      });

      setState(() {
        _maxChildSize = 0.925;
        _lastExtent = 0.4;
        _minChildSize = 0.08;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        final extent = notification.extent;
        if (extent != _lastExtent) {
          widget.sheetExtentNotifier.value = extent;
        }
        _lastExtent = extent;

        final isExpanded = extent >= 0.835;
        if (isExpanded != _wasExpanded) {
          _wasExpanded = isExpanded;
          widget.onExpandChanged(isExpanded);
        }

        return true;
      },
      child: DraggableScrollableSheet(
        controller: _controller,
        initialChildSize: _lastExtent,
        minChildSize: _minChildSize,
        maxChildSize: _maxChildSize,
        builder: (context, scrollController) {
          return Listener(
            onPointerUp: (_) {
              // 🔁 À ce moment-là, le drag est relâché, on peut snapper
              final nearest = _palierTailleSheet.reduce(
                (a, b) =>
                    (_lastExtent - a).abs() < (_lastExtent - b).abs() ? a : b,
              );

              _controller.animateTo(
                nearest,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: BottomSheetContainer(scrollController: scrollController),
            ),
          );
        },
      ),
    );
  }
}
