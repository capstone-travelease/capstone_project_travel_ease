import 'package:equatable/equatable.dart';

class PostRatingBody extends Equatable {
  const PostRatingBody({
    this.userId,
    this.hotelId,
    this.content,
    this.starRate,
  });
  final int? userId;
  final int? hotelId;
  final String? content;
  final int? starRate;

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'hotelId': hotelId,
      'content': content,
      'starRate': starRate
    };
  }

  PostRatingBody copyWith({
    int? userId,
    int? hotelId,
    String? content,
    int? starRate,
  }) {
    return PostRatingBody(
      userId: userId ?? this.userId,
      hotelId: hotelId ?? this.hotelId,
      content: content ?? this.content,
      starRate: starRate ?? this.starRate,
    );
  }

  @override
  String toString() {
    return 'PostRatingBody(userId: $userId, hotelId: $hotelId, content: $content, starRate: $starRate)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
