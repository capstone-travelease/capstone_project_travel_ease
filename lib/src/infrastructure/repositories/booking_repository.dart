import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/src/domain/models/hotel_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/location_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_search_hotel_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:capstone_project_travel_ease/src/infrastructure/booking_client/booking_client.dart';
import 'package:get/get.dart';

class BookingRepository implements BookingService {
  final _client = Get.find<BookingClient>(tag: Constant.bookingClientTAG);

  @override
  Future<List<HotelModel>> searchHotel(
      {required PostSearchHotelBody body}) async {
    try {
      final res = await _client.searchHotel(body);
      if (res != null) {
        final data = (res['data'] as List)
            .map((e) => HotelModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return data;
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<LocationModel>> getLocation() async {
    try {
      final res = await _client.getLocation();
      if (res != null) {
        final data = (res['data'] as List)
            .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return data;
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }
}
