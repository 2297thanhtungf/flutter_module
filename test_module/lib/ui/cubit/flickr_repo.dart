import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test_module/base_request.dart';
import 'package:test_module/ui/model/flick_data.dart';
import 'package:test_module/ultis/constants.dart';

class FlickrRepo {
  Future<FlickrData> getDataTree(String method, int page) async {
    String url = '?method=$method&api_key=${Constants.API_KEY}';
    FormData formData = FormData.fromMap({
      "format": 'json',
      "nojsoncallback": 1,
      "page": page,
      'per_page': 20,
    });
    final result = await BaseRequest().sendRequest(url, RequestMethod.POST,
        jsonMap: formData, useCache: true, forceRefreshCache: false, customDomain: Constants.BASE_URL);
    return await compute(flickrDataFromJson, result);
  }
}
