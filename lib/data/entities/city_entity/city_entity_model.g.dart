// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_entity_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityEntityModelAdapter extends TypeAdapter<CityEntityModel> {
  @override
  final int typeId = 0;

  @override
  CityEntityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityEntityModel(
      city: fields[0] as String,
      city_ascii: fields[1] as String?,
      lat: fields[2] as double,
      lng: fields[3] as double,
      country: fields[4] as String?,
      iso2: fields[5] as String?,
      iso3: fields[6] as String?,
      adminName: fields[7] as String?,
      capital: fields[8] as String?,
      population: fields[9] as String?,
      id: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CityEntityModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.city_ascii)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.lng)
      ..writeByte(4)
      ..write(obj.country)
      ..writeByte(5)
      ..write(obj.iso2)
      ..writeByte(6)
      ..write(obj.iso3)
      ..writeByte(7)
      ..write(obj.adminName)
      ..writeByte(8)
      ..write(obj.capital)
      ..writeByte(9)
      ..write(obj.population)
      ..writeByte(10)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityEntityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
