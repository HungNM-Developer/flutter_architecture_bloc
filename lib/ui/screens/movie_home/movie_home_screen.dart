import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';
import 'package:flutter_architecture_bloc/ui/screens/movie_home/trending_person_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';
import '../../../core/data/models/movie.dart';
import '../../../states/cubit/movies/movie_cubit.dart';
import '../../widgets/app_shimmer.dart';
import '../../widgets/mask_image.dart';
import '../../widgets/search_field_widget.dart';
import 'category_screen.dart';

class MovieHomeScreen extends StatefulWidget {
  const MovieHomeScreen({super.key});

  @override
  State<MovieHomeScreen> createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  final _cubitMovie = getIt<MovieCubit>();
  @override
  void dispose() {
    _cubitMovie.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDarkBlue,
      extendBody: true,
      body: ListView(
        shrinkWrap: true,
        primary: true,
        physics: const ClampingScrollPhysics(),
        children: [
          24.verticalSpace,
          Text(
            'What would you\nlike to watch?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.sp,
              color: AppColors.kWhiteColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          30.verticalSpace,
          SearchFieldWidget(
            padding: REdgeInsets.symmetric(
              horizontal: 20,
            ),
          ),
          39.verticalSpace,
          RPadding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'new movies'.toUpperCase(),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.kWhiteColor,
                fontFamily: 'muli',
              ),
            ),
          ),
          20.verticalSpace,
          BlocBuilder<MovieCubit, MovieState>(
            bloc: _cubitMovie..fetchNowPlayingMovie(0, ''),
            buildWhen: (previous, current) => current != previous,
            builder: (context, state) {
              if (state is MovieLoading) {
                return RPadding(
                  padding: const EdgeInsets.all(16),
                  child: AppShimmer(
                    height: 180.h,
                    width: double.infinity,
                  ),
                );
              }
              if (state is MovieLoaded) {
                List<Movie> movies = state.movieList;
                return SizedBox(
                  height: 180.h,
                  child: CarouselSlider.builder(
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      Movie movie = movies[itemIndex];
                      return MaskImage(
                        onPressed: () {},
                        backdropPath: movie.backdropPath,
                        title: movie.title?.toUpperCase(),
                      );
                    },
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 400),
                      pauseAutoPlayOnTouch: true,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong!!!'),
                );
              }
            },
          ),
          25.verticalSpace,
          RPadding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category movies'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kWhiteColor,
                    fontFamily: 'muli',
                  ),
                ),
                15.verticalSpace,
                const BuildWidgetCategory(),
                15.verticalSpace,
                Text(
                  'Trending persons on this week'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kWhiteColor,
                    fontFamily: 'muli',
                  ),
                ),
                12.verticalSpace,
                const TrendingPersonScreen(),
                24.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
