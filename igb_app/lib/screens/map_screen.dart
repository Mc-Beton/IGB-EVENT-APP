import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final TransformationController _transformationController = TransformationController();
  double _currentScale = 1.0;

  @override
  void initState() {
    super.initState();
    _transformationController.addListener(_onTransformChanged);
  }

  void _onTransformChanged() {
    final matrix = _transformationController.value;
    final scaleX = matrix.row0.r; // skala pozioma
    setState(() {
      _currentScale = scaleX;
    });
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mapa wydarzenia")),
      body: InteractiveViewer(
        transformationController: _transformationController,
        minScale: 0.5,
        maxScale: 5.0,
        child: Center(
          child: SizedBox(
            width: 3000,
            height: 2000,
            child: Stack(
              children: [
                // Tło mapy (widoczne zawsze)
                Image.asset(
                  'assets/mapa/mapa_base.png',
                  width: 3000,
                  height: 2000,
                  fit: BoxFit.fill,
                ),
                // Nakładka z detalami (widoczna przy dużym zoomie)
                if (_currentScale >= 1.8)
                  IgnorePointer(
                    child: Image.asset(
                      'assets/mapa/mapa_full.png',
                      width: 3000,
                      height: 2000,
                      fit: BoxFit.fill,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
