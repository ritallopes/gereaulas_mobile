import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/domain/place.dart';
import 'package:gereaulas_mobile/screens/select_map.dart';
import 'package:gereaulas_mobile/utils/utils_functions.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationInput extends StatefulWidget {
  final Function(Place) onLocationSelected;

  LocationInput({required this.onLocationSelected, Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData =
        await Location().getLocation(); //pega localização do usuário
    print(locData.latitude);
    print(locData.longitude);

    //CARREGANDO NO MAPA

    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
        latitude: locData.latitude, longitude: locData.longitude);
    widget.onLocationSelected(Place(
        latitude: locData.latitude ?? 0.0,
        longitude: locData.latitude ?? 0.0,
        address:
            "{latitude:${locData.latitude} , longitude:${locData.latitude} }"));
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _selectOnMap() async {
    final LatLng selectedPosition = await Navigator.of(context).push(
      MaterialPageRoute(
          fullscreenDialog: true, builder: ((context) => SelectMap())),
    );

    if (selectedPosition == null) return;

    print(selectedPosition.latitude);
    print(selectedPosition.longitude);

    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
        latitude: selectedPosition.latitude,
        longitude: selectedPosition.longitude);

    widget.onLocationSelected(Place(
        latitude: selectedPosition.latitude,
        longitude: selectedPosition.latitude,
        address:
            "{latitude:${selectedPosition.latitude} , longitude:${selectedPosition.latitude} }"));

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageUrl == null
              ? const Text('Informe o local onde ocorrerá a aula!')
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('Local atual', style: TextStyle(fontSize: 12)),
              onPressed: _getCurrentUserLocation,
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Selecionar no Mapa',
                  style: TextStyle(fontSize: 12)),
              onPressed: _selectOnMap,
            ),
          ],
        ),
      ],
    );
  }
}
