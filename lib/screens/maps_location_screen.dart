import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiwa_apps/utils/colors.dart';

class MapsLocationScreen extends StatefulWidget {
  const MapsLocationScreen({super.key});

  @override
  State<MapsLocationScreen> createState() => _MapsLocationScreenState();
}

class _MapsLocationScreenState extends State<MapsLocationScreen> {
  //  final LatLng _centerLocation = const LatLng(-7.2575, 112.7521);
  static const LatLng _initialLocation = LatLng(-7.250445, 112.768845);
  LatLng _selectedPosition = const LatLng(-7.2575, 112.7521);
  GoogleMapController? _googleMapController;
  String _address = 'Memuat alamat...';

  // void _recenterMap() {
  //   _googleMapController?.animateCamera(
  //     CameraUpdate.newLatLngZoom(_initialLocation, 15.0),
  //   );
  //   setState(() {
  //     _selectedPosition = _initialLocation;
  //   });
  // }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _selectedPosition = position.target;
    });
  }

  void _onCameraIdle() {
    _getAddressFromLatLng(_selectedPosition);
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          _address =
              '${place.name}, ${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
        });
      }
    } catch (e) {
      setState(() {
        _address = 'Gagal memuat alamat';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: _initialLocation, zoom: 12),
                  onMapCreated: (controller) {
                    _googleMapController = controller;
                  },
                  onCameraMove: _onCameraMove,
                  onCameraIdle: _onCameraIdle,
                  mapType: MapType.hybrid,
                  zoomControlsEnabled: false,
                  gestureRecognizers: {
                    Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                    )
                  },
                ),
                Center(
                  child: Image.asset('assets/pin_location_2.png', scale: 10),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(color: AppColors.white),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back_rounded, size: 18)),
                      SizedBox(width: 20),
                      Text(
                        'Pilih Lokasi',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 2, 8, 2),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined, size: 16),
                              Text(
                                'Cari Lokasi',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(thickness: 0.2),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: AppColors.secondary,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _address,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  'Taman Jemursari Selatan I No.5a, Jemur Wonosari, Kec. Wonocolo, Surabaya, Jawa Timur 60237, Indonesia',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(thickness: 0.2),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Konfirmasi',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.whiteText,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
