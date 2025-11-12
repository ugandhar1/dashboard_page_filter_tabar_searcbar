import '../../models/project_model.dart';
import 'package:equatable/equatable.dart';

class PortfolioState extends Equatable {
  final List<ProjectModel> allProjects;
  final List<ProjectModel> filteredProjects;
  final String query;

  const PortfolioState({
    required this.allProjects,
    required this.filteredProjects,
    required this.query,
  });

  factory PortfolioState.initial() {
    return const PortfolioState(
      allProjects: [],
      filteredProjects: [],
      query: '',
    );
  }

  PortfolioState copyWith({
    List<ProjectModel>? allProjects,
    List<ProjectModel>? filteredProjects,
    String? query,
  }) {
    return PortfolioState(
      allProjects: allProjects ?? this.allProjects,
      filteredProjects: filteredProjects ?? this.filteredProjects,
      query: query ?? this.query,
    );
  }

  @override
  List<Object?> get props => [allProjects, filteredProjects, query];
}
