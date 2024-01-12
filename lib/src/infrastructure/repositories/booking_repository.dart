import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
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
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:capstone_project_travel_ease/src/infrastructure/base/booking_client/booking_client.dart';
import 'package:get/get.dart';

class BookingRepository implements BookingService {
  final _bookingClient =
      Get.find<BookingClient>(tag: Constant.bookingClientTAG);

  @override
  Future<List<HotelModel>> searchHotel(
      {required PostSearchHotelBody body}) async {
    try {
      final res = await _bookingClient.searchHotel(body);
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
  Future<List<LocationModel>> getLocation(String location) async {
    try {
      final res = await _bookingClient.getLocation(location);
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

  @override
  Future<List<RoomModel>> listRooms({required int hotelId}) async {
    try {
      final res = await _bookingClient.listRooms(hotelId);
      if (res != null) {
        final data = (res['data'] as List)
            .map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
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
  Future<RoomModel> detailRoom({required int roomId}) async {
    try {
      final res = await _bookingClient.detailRoom(roomId);
      if (res != null) {
        final data = RoomModel.fromJson(res['data'] as Map<String, dynamic>);
        return data;
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HotelModel> detailHotel({required int hotelId}) async {
    try {
      final res = await _bookingClient.detailHotel(hotelId);
      if (res != null) {
        final data = HotelModel.fromJson(res['data'] as Map<String, dynamic>);
        return data;
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BanksModel>> listBank({required int bankType}) async {
    try {
      final res = await _bookingClient.listBank(bankType);
      if (res != null) {
        final data = (res['data'] as List)
            .map((e) => BanksModel.fromJson(e as Map<String, dynamic>))
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
  Future<String> bankLink(
      {required int userId, required PutAddCardBody body}) async {
    try {
      final res = await _bookingClient.bankLink(userId, body);
      if (res != null) {
        return res['message'];
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BanksModel>> listBankAccount({required int userId}) async {
    try {
      final res = await _bookingClient.listBankAccount(userId);
      if (res != null) {
        final data = (res['data'] as List)
            .map((e) => BanksModel.fromJson(e as Map<String, dynamic>))
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
  Future<List<FacilitiesModel>> listFacilities() async {
    try {
      final res = await _bookingClient.listFacilities();
      if (res != null) {
        final data = (res['data'] as List)
            .map((e) => FacilitiesModel.fromJson(e as Map<String, dynamic>))
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
  Future<String> booking({required PostBookingBody body}) async {
    try {
      final res = await _bookingClient.booking(body);
      if (res != null) {
        return res['message'];
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MyBookingModel>> listMyBooking(
      {required GetMyBookingBody body}) async {
    try {
      final res = await _bookingClient.listMyBooking(body);
      if (res != null) {
        final data = (res['data'] as List)
            .map((e) => MyBookingModel.fromJson(e as Map<String, dynamic>))
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
  Future<BookingTicketModel> ticket({required int bookingId}) async {
    try {
      final res = await _bookingClient.ticket(bookingId);
      if (res != null) {
        final data =
            BookingTicketModel.fromJson(res['data'] as Map<String, dynamic>);
        return data;
      } else {
        throw Exception('Request Error: $res');
      }
    } catch (e) {
      rethrow;
    }
  }
}
