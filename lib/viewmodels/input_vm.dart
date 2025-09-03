

import 'package:flutter/material.dart';
import 'package:geo/services/geo_api.dart';

class InputViewModel extends ChangeNotifier {

  String domainText = '';
  String intentText = '';
  
  void updateDomain(String domain) {
    domainText = domain;

  }

  void updateIntent(String intent) {
    intentText = intent;

  }

  Future<void> submitData() async {
    // Here you can handle the submission logic, e.g., sending data to an API
    print('');
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));
    print('Data submitted successfully!');
  }

  Future<void> testApi() async {
    GeoApiService apiService = GeoApiService();
    try{
      var data = await apiService.getGeoData(3);

      print(data);
    }
    catch(e){
      print(e);
    }
    // Here you can handle the API test logic
    print('API test initiated');
    // Simulate a network call
  }


}