import 'package:equatable/equatable.dart';

class PageTrackerModel extends Equatable {
  final String bookName;
  final int totalPages;
  final int actualPage;

  double get progress => actualPage / totalPages;

  const PageTrackerModel({required this.bookName, required this.totalPages, required this.actualPage});

  @override
  List<Object?> get props => [bookName, totalPages, actualPage];
}
