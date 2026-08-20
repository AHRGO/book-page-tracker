// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class ProgressTrackerModelAdapter extends TypeAdapter<ProgressTrackerModel> {
  @override
  final typeId = 0;

  @override
  ProgressTrackerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProgressTrackerModel(
      projectId: fields[0] as String,
      projectName: fields[1] as String,
      totalPositions: (fields[2] as num).toInt(),
      currentPosition: (fields[3] as num).toInt(),
      projectType: fields[4] as String?,
      trackingUnity: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProgressTrackerModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.projectId)
      ..writeByte(1)
      ..write(obj.projectName)
      ..writeByte(2)
      ..write(obj.totalPositions)
      ..writeByte(3)
      ..write(obj.currentPosition)
      ..writeByte(4)
      ..write(obj.projectType)
      ..writeByte(5)
      ..write(obj.trackingUnity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgressTrackerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
