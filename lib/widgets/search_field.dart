import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday_llp/blocs/portfolio_bloc.dart';
import 'package:yoliday_llp/blocs/portfolio_event.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<PortfolioBloc>().add(FilterProjects(value));
      },
      decoration: InputDecoration(
        hintText: 'Search a project',
        suffixIcon: Padding(
          padding: EdgeInsets.all(8.0), // Optional: add padding
          child: Image.asset(
            'assets/images/search.png',
            width: 24.w,
            height: 24.h,
            fit: BoxFit.contain, // ensures proper aspect ratio
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      ),
    );
  }
}
