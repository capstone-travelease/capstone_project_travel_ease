import 'package:capstone_project_travel_ease/src/domain/models/bank_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/booking_ticket_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/facilities_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/hotel_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/location_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/my_booking_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/room_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/get_my_booking_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_add_card_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_booking_body.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_search_hotel_body.dart';

abstract interface class BookingService {
  Future<List<HotelModel>> searchHotel({required PostSearchHotelBody body});

  Future<List<LocationModel>> getLocation(String location);

  Future<HotelModel> detailHotel({required int hotelId});

  Future<List<RoomModel>> listRooms({required int hotelId});

  Future<RoomModel> detailRoom({required int roomId});

  Future<List<FacilitiesModel>> listFacilities();

  Future<List<BanksModel>> listBank({required int bankType});

  Future<String> bankLink({required int userId, required PutAddCardBody body});

  Future<List<BanksModel>> listBankAccount({required int userId});

  Future<String> booking({required PostBookingBody body});

  Future<List<MyBookingModel>> listMyBooking({required GetMyBookingBody body});

  Future<BookingTicketModel> ticket({required int bookingId});
}
