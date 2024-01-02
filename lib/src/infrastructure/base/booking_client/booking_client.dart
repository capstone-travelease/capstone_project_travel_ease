import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_search_hotel_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'booking_client.g.dart';

@RestApi()
abstract class BookingClient {
  factory BookingClient(Dio dio, {String baseUrl}) = _BookingClient;
  @POST('/api/hotel/search')
  Future searchHotel(@Body() PostSearchHotelBody body);

  @GET('/api/location/search?name={locationName}')
  Future getLocation(@Path('locationName') String locationName);

  @GET('/api/room/list?hotelId={hotelId}')
  Future listRooms(@Path('hotelId') int hotelId);

  @GET('/api/room/detail/get-room?roomId={roomId}')
  Future detailRoom(@Path('roomId') int roomId);

  @GET('/api/hotel/detail?hotelId={hotelId}')
  Future detailHotel(@Path('hotelId') int hotelId);
}
