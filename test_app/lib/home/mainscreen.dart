import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  late GoogleMapController mapController;
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  late Position _currentPosition;
  String _currentAddress = '';
  bool _isLocationGenerated = false;

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  String _startAddress = '';

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
      _isLocationGenerated = true;
    });
    await _getAddress();
  }

  Future<void> _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade800,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        elevation: 0,
        backgroundColor: Colors.indigo.shade800,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: _initialLocation,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: Rishi Kumar',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Designation: Teacher',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'CPIS Number: CW123G',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Location Assigned:',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      _currentAddress,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _goToMyLocation,
                      icon: Icon(Icons.location_on),
                      label: Text('Get My Location'),
                      style: ElevatedButton.styleFrom(
                        primary:
                            _isLocationGenerated ? Colors.grey : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _goToMyLocation() {
    if (_isLocationGenerated) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              _currentPosition.latitude,
              _currentPosition.longitude,
            ),
            zoom: 15.0,
          ),
        ),
      );
    }
  }
}
