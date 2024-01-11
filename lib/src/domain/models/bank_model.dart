import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BanksModel extends Equatable {
  const BanksModel(
    this.bankId,
    this.accountName,
    this.accountId,
    this.accountNumber,
    this.bankType, {
    this.imageBankUrl,
    this.typeBank,
    this.nameBank,
  });
  @JsonKey(name: 'bankId')
  final int? bankId;
  @JsonKey(name: 'imageBank')
  final String? imageBankUrl;
  @JsonKey(name: 'bankType')
  final int? typeBank;
  @JsonKey(name: 'typeBank')
  final int? bankType;
  @JsonKey(name: 'nameBank')
  final String? nameBank;
  @JsonKey(name: 'accountName')
  final String? accountName;
  @JsonKey(name: 'accountId')
  final int? accountId;
  @JsonKey(name: 'accountNumber')
  final String? accountNumber;

  factory BanksModel.fromJson(Map<String, dynamic> json) =>
      _$BanksModelFromJson(json);

  Map<String, dynamic> toJson() => _$BanksModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        bankId,
        nameBank,
        imageBankUrl,
      ];
}
