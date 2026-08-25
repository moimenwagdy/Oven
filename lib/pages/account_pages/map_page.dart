import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class MapPage extends StatefulWidget {
  final void Function(LatLng) onCameraMove;
  const MapPage({super.key, required this.onCameraMove});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const _initialPosition = CameraPosition(
    target: LatLng(30.0444, 31.2357), // Cairo, swap for whatever
    zoom: 12,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ],
        ),
        SizedBox(
          width: context.screenWidth * .9,
          height: context.screenHeight * .72,
          child: GoogleMap(
            onTap: widget.onCameraMove,
            initialCameraPosition: _initialPosition,
            onMapCreated: (controller) {
              debugPrint('🗺️ Google Map CREATED');
            },
            // onCameraMove: widget.onCameraMove,
            myLocationEnabled: false,
          ),
        ),
      ],
    );
  }
}
