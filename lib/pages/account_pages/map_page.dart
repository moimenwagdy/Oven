import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class MapPage extends StatefulWidget {
  final void Function(LatLng) onCameraMove;
  final bool? isManager;
  final CameraPosition? initialLocation;
  const MapPage({
    super.key,
    required this.onCameraMove,
    this.isManager = false,
    this.initialLocation,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final CameraPosition initial;

  @override
  void initState() {
    super.initState();

    initial =
        widget.initialLocation ??
        const CameraPosition(target: LatLng(30.0444, 31.2357), zoom: 12);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: onPrimary,
                ),
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded, color: primary),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.isManager == true
                      ? "select your personal location on the map"
                      : "Select branch location on the map",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          SizedBox(
            width: context.screenWidth * .9,
            height: widget.isManager == true
                ? context.isSmallDevice
                      ? context.screenHeight * .55
                      : context.screenHeight * .65
                : context.isSmallDevice
                ? context.screenHeight * .63
                : context.screenHeight * .70,
            child: GoogleMap(
              onTap: widget.onCameraMove,
              initialCameraPosition: initial,
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
      ),
    );
  }
}
