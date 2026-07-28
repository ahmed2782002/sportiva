// Flutter imports:
// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:url_launcher/url_launcher.dart';

class LocationServices {
  static LatLng? currentLocation;

  static Future<bool> checkPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        return await Geolocator.isLocationServiceEnabled();
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  static Future<bool> requestPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.deniedForever) {
        //  showToastMessage(allowLocationPermission.tr());
        await Geolocator.openAppSettings();
        await requestPermission();
        return false;
      }
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      // Check if permission was granted
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        if (!await Geolocator.isLocationServiceEnabled()) {
          //  showToastMessage(allowLocationPermission.tr());
          await Geolocator.openLocationSettings();
          await requestPermission();
          return false;
        }
        return true;
      }
      //  showToastMessage(allowLocationPermission.tr());
      return false;
    } catch (error) {
      // showToastMessage(allowLocationPermission.tr());
      return false;
    }
  }

  static Future<Either<String, Position>> getCurrentLocation() async {
    bool permission = await checkPermission();
    if (permission) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
          ),
        );
        if (kDebugMode) {
          debugPrint("Current Location: $position");
        }
        currentLocation = LatLng(position.latitude, position.longitude);
        return Right(position);
      } catch (error) {
        if (kDebugMode) {
          debugPrint("Error Current Location: ${error.toString()}");
        }
        //  showToastMessage(error.toString());
        return Left(error.toString());
      }
    } else {
      return Left("Error permission Location");
    }
  }

  // static Future<void> openGoogleMaps(double? lat, double? lng) async {
  //   if (lat == null || lng == null) {
  //     showToastMessage(locationNotAvailable.tr());
  //     return;
  //   }
  //
  //   final url = Uri.parse(
  //     'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
  //   );
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url, mode: LaunchMode.externalApplication);
  //   } else {
  //     showToastMessage(couldNotOpenMaps.tr());
  //   }
  // }

  static GoogleMapController? googleMapController;
  static Map<MarkerId, Marker> markers = {};
  static String lightMapString = '';
  static BitmapDescriptor? car;

  static Future<BitmapDescriptor> convertMarkerImage({
    String? assetName,
  }) async {
    if (assetName == null || assetName.isEmpty) {
      return BitmapDescriptor.defaultMarker;
    }
    return BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(45, 61)),
      assetName,
    );
  }

  static void onMapCreated(GoogleMapController controller) async {
    googleMapController = controller;
    car ??= await convertMarkerImage();
  }

  static Future<void> onMapMove(CameraPosition position) async {}

  static Future<void> goToCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
    googleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 19,
        ),
      ),
    );
  }

  static Future<void> zoomIn() async {
    googleMapController!.animateCamera(CameraUpdate.zoomIn());
  }

  static Future<void> zoomOut() async {
    googleMapController!.animateCamera(CameraUpdate.zoomOut());
  }

  static Future<void> addMyMarker({LatLng? location}) async {
    car ??= await convertMarkerImage();
    addMarker(location ?? currentLocation!, 'my_loc', icon: car!);
  }

  static Future<void> addMarker(
    LatLng latLng,
    String id, {
    BitmapDescriptor? icon,
    String? assetName,
  }) async {
    icon ??= await convertMarkerImage(assetName: assetName);
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: MarkerId(id),
      position: latLng,
      draggable: false,
      icon: icon,
    );
    markers[markerId] = marker;
  }

  static void dispose() {
    googleMapController?.dispose();
    googleMapController = null;
  }

  static Future<void> launchMaps({LatLng? location}) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${location?.latitude ?? currentLocation!.latitude},${location?.longitude ?? currentLocation!.longitude}';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      debugPrint('launching com googleUrl');
      await launchUrl(
        Uri.parse(googleUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch url';
    }
  }
}
