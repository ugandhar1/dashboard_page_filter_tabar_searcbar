import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday_llp/blocs/portfolio_bloc.dart';
import 'package:yoliday_llp/blocs/portfolio_state.dart';
import '../widgets/project_card.dart';
import '../widgets/search_field.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PortfolioBloc()..init(),
      child: DefaultTabController(
        length: 4, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Portfolio',
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
            ),
            actions: [
              const Icon(Icons.bookmark_outline, color: Color.fromARGB(255, 255, 77, 0),),
              SizedBox(width: 16.w),
              const Icon(Icons.notifications_none, color: Color.fromARGB(255, 255, 77, 0),),
              SizedBox(width: 16.w),
            ],
            bottom: const TabBar(
              indicatorColor:  Color.fromARGB(255, 255, 77, 0),
              indicatorWeight: 3,
              labelColor:  Color.fromARGB(255, 255, 77, 0), // Selected tab color
              unselectedLabelColor: Colors.grey,   // Unselected tab color
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: 'Project'),
                Tab(text: 'Saved'),
                Tab(text: 'Shared'),
                Tab(text: 'Achievement'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // 🟠 Project Tab
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  children: [
                    const SearchField(),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: BlocBuilder<PortfolioBloc, PortfolioState>(
                        builder: (context, state) {
                          if (state.filteredProjects.isEmpty) {
                            return const Center(child: Text('No projects found'));
                          }
                          return ListView.builder(
                            itemCount: state.filteredProjects.length,
                            itemBuilder: (context, index) {
                              final project = state.filteredProjects[index];
                              return ProjectCard(project: project);
                            },
                          );
                        },
                      ),
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {},
                      backgroundColor:  const Color.fromARGB(255, 255, 77, 0),
                      label: const Text('Filter'),
                      icon: const Icon(Icons.filter_list),
                    ),
                  ],
                ),
              ),

              // 🟢 Saved Tab
              Center(
                child: Text(
                  'Saved Projects',
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
                ),
              ),

              // 🔵 Shared Tab
              Center(
                child: Text(
                  'Shared Projects',
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
                ),
              ),

              // 🟣 Achievement Tab
              Center(
                child: Text(
                  'Achievements',
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
