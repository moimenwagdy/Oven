import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class MapPage extends StatefulWidget {
  final void Function(LatLng) onCameraMove;
  final bool? isManager;
  const MapPage({
    super.key,
    required this.onCameraMove,
    this.isManager = false,
  });

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
        if (widget.isManager == true)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "select your personal location on the map",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),

        SizedBox(
          width: context.screenWidth * .9,
          height: widget.isManager == true
              ? context.screenHeight * .65
              : context.screenHeight * .72,
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
        if (widget.isManager == true) SizedBox(height: 10),
        if (widget.isManager == true)
          Text(
            "If you prefer to skip this step, you can set your location later when you're ready to place a personal order.",
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
