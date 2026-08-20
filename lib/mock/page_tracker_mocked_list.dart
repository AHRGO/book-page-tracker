import '../models/progress_tracker_model.dart';

final class PageTrackerMockedList {
  static const List<ProgressTrackerModel> list = [
    ProgressTrackerModel(projectId: "0", projectName: "The Hobbit", totalPositions: 1000, currentPosition: 48),
    ProgressTrackerModel(projectId: "1", projectName: "The Hobbit", totalPositions: 1000, currentPosition: 96),
    ProgressTrackerModel(
      projectId: "2",
      projectName: "The Lord of the Rings: The Fellowship of the Ring",
      totalPositions: 1000,
      currentPosition: 183,
    ),
    ProgressTrackerModel(projectId: "3", projectName: "The Silmarillion", totalPositions: 1000, currentPosition: 245),
    ProgressTrackerModel(projectId: "4", projectName: "Dune", totalPositions: 1000, currentPosition: 312),
    ProgressTrackerModel(projectId: "5", projectName: "Foundation", totalPositions: 1000, currentPosition: 495),
    ProgressTrackerModel(projectId: "6", projectName: "1984", totalPositions: 1000, currentPosition: 566),
    ProgressTrackerModel(projectId: "7", projectName: "1984", totalPositions: 1000, currentPosition: 645),
    ProgressTrackerModel(projectId: "8", projectName: "Brave New World", totalPositions: 1000, currentPosition: 721),
    ProgressTrackerModel(projectId: "9", projectName: "The Name of the Wind", totalPositions: 1000, currentPosition: 893),
    ProgressTrackerModel(projectId: "10", projectName: "Mistborn: The Final Empire", totalPositions: 1000, currentPosition: 915),
    ProgressTrackerModel(projectId: "11", projectName: "The Way of Kings", totalPositions: 1000, currentPosition: 986),
  ];
}
