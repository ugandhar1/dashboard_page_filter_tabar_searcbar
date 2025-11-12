import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/project_model.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(PortfolioState.initial()) {
    on<LoadProjects>(_onLoadProjects);
    on<FilterProjects>(_onFilterProjects);
  }

  // Load static data
  static final List<ProjectModel> _mockProjects = [
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      language: 'BAHASA SUNDA',
      author: 'Oleh Al-Baiqi Samaam',
      image: 'assets/images/p1.png',
      grade: 'A',
    ),
    ProjectModel(
      title: 'Kemampuan Menulis Artikel',
      language: 'BAHASA SUNDA',
      author: 'Oleh Al-Baiqi Samaam',
      image: 'assets/images/p2.png',
      grade: 'A',
    ),
    ProjectModel(
      title: 'Yugandhar Flutter Developer',
      language: 'BAHASA SUNDA',
      author: 'Oleh Al-Baiqi Samaam',
      image: 'assets/images/p3.png',
      grade: 'A',
    ),
    ProjectModel(
      title: 'Java Developer',
      language: 'BAHASA SUNDA',
      author: 'Oleh Al-Baiqi Samaam',
      image: 'assets/images/p1.png',
      grade: 'A',
    ),
    ProjectModel(
      title: 'Kemampuan Menulis Artikel',
      language: 'BAHASA SUNDA',
      author: 'Oleh Al-Baiqi Samaam',
      image: 'assets/images/p2.png',
      grade: 'A',
    ),
    ProjectModel(
      title: 'Yugandhar Flutter Developer',
      language: 'BAHASA SUNDA',
      author: 'Oleh Al-Baiqi Samaam',
      image: 'assets/images/p3.png',
      grade: 'A',
    ),
  ];

  void _onLoadProjects(LoadProjects event, Emitter<PortfolioState> emit) {
    emit(state.copyWith(
      allProjects: event.projects,
      filteredProjects: event.projects,
      query: '',
    ));
  }

  void _onFilterProjects(FilterProjects event, Emitter<PortfolioState> emit) {
    final query = event.query.toLowerCase();
    final filtered = state.allProjects
        .where((p) => p.title.toLowerCase().contains(query))
        .toList();

    emit(state.copyWith(filteredProjects: filtered, query: event.query));
  }

  /// Convenience method to initialize the data
  void init() {
    add(LoadProjects(_mockProjects));
  }
}
