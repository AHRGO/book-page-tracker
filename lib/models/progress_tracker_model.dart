import 'package:equatable/equatable.dart';

class ProgressTrackerModel extends Equatable {
  final String projectId;
  final String projectName;
  final int totalPositions;
  final int currentPosition;
  final String? projectType;
  final String? trackingUnity;

  double get progress => currentPosition / totalPositions;

  const ProgressTrackerModel({
    required this.projectId,
    required this.projectName,
    required this.totalPositions,
    required this.currentPosition,
    this.projectType,
    this.trackingUnity,
  });

  @override
  List<Object?> get props => [projectId, projectType, projectName, trackingUnity, totalPositions, currentPosition];
}
