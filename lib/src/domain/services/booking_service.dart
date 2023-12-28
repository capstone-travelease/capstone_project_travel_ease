import 'package:capstone_project_travel_ease/src/domain/models/hotel_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/location_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/room_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_search_hotel_body.dart';

abstract interface class BookingService {
  Future<List<HotelModel>> searchHotel({required PostSearchHotelBody body});

  Future<List<LocationModel>> getLocation();

  Future<HotelModel> detailHotel({required int hotelId});

  Future<List<RoomModel>> listRooms({required int hotelId});

  Future<RoomModel> detailRoom({required int roomId});
// Future booking();
}
