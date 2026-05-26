import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../models/cached_location.dart';
import '../storage/storage_service.dart';
import '../constants/app_constants.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();

  final StorageService _storage = StorageService();
  Timer? _cacheTimer;
  bool _isRunning = false;

  Future<bool> requestPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return false;
    }
    if (permission == LocationPermission.deniedForever) return false;

    return true;
  }

  Future<void> startPeriodicCaching() async {
    if (_isRunning) return;

    final hasPermission = await requestPermission();
    if (!hasPermission) {
      debugPrint('[LocationService] No location permission');
      return;
    }

    _isRunning = true;

    // Cache immediately on start
    await _cacheCurrentLocation();

    // Then every 4 hours
    _cacheTimer = Timer.periodic(
      const Duration(hours: AppConstants.locationCacheIntervalHours),
      (_) => _cacheCurrentLocation(),
    );

    debugPrint('[LocationService] Periodic caching started (every ${AppConstants.locationCacheIntervalHours}h)');
  }

  void stopPeriodicCaching() {
    _cacheTimer?.cancel();
    _cacheTimer = null;
    _isRunning = false;
    debugPrint('[LocationService] Periodic caching stopped');
  }

  Future<void> _cacheCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );

      String? address;
      try {
        final placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        if (placemarks.isNotEmpty) {
          final p = placemarks.first;
          address = [
            p.street,
            p.subLocality,
            p.locality,
            p.administrativeArea,
            p.country,
          ].where((s) => s != null && s.isNotEmpty).join(', ');
        }
      } catch (e) {
        debugPrint('[LocationService] Geocoding failed: $e');
      }

      final cached = CachedLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
      );

      await _storage.cacheLocation(cached);
      debugPrint('[LocationService] Cached: ${position.latitude}, ${position.longitude} → $address');
    } catch (e) {
      debugPrint('[LocationService] Failed to get position: $e');
    }
  }

  CachedLocation? get lastCachedLocation => _storage.lastLocation;

  void dispose() {
    stopPeriodicCaching();
  }
}
