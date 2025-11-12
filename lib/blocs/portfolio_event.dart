import '../../models/project_model.dart';
import 'package:equatable/equatable.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object?> get props => [];
}

class LoadProjects extends PortfolioEvent {
  final List<ProjectModel> projects;

  const LoadProjects(this.projects);

  @override
  List<Object?> get props => [projects];
}

class FilterProjects extends PortfolioEvent {
  final String query;

  const FilterProjects(this.query);

  @override
  List<Object?> get props => [query];
}
