import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/domain/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectMap extends StatefulWidget {
  final Place initialLocation;
  final bool isReadonly;

  SelectMap(
      {this.initialLocation = const Place(
        latitude: 37.419857,
        longitude: -122.078827,
      ),
      this.isReadonly = false});

  @override
  _SelectMapState createState() => _SelectMapState();
}

class _SelectMapState extends State<SelectMap> {
  LatLng? _pickedPosition;
  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marque o local da aula no Mapa'),
        actions: <Widget>[
          if (!widget.isReadonly)
            IconButton(
              onPressed: _pickedPosition == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedPosition);
                    },
              icon: const Icon(Icons.check),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 10,
        ),
        onTap: widget.isReadonly ? null : _selectPosition,
        markers: _pickedPosition == null
            ? {}
            : {
                Marker(
                  markerId: MarkerId('p1'),
                  position: _pickedPosition!,
                ),
              },
      ),
    );
  }
}
