import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReviewModel extends Equatable {
  const ReviewModel({
    this.fullName,
    this.dateReview,
    this.content,
    this.starRating,
    this.imageUser,
  });
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'dateReview')
  final DateTime? dateReview;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'starRating')
  final double? starRating;
  @JsonKey(name: 'imageUser')
  final String? imageUser;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
