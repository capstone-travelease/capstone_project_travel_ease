import 'package:capstone_project_travel_ease/src/domain/models/hotel_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/location_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_search_hotel_body.dart';

abstract interface class BookingService {
  Future<List<HotelModel>> searchHotel({required PostSearchHotelBody body});
  Future<List<LocationModel>> getLocation();
// Future detailHotel();
// Future listRooms();
// Future detailRooms();
// Future booking();
}
