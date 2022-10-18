import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/ui/screens/movie_home/trending_person_screen.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_circular_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';
import '../../../core/data/models/movie.dart';
import '../../../core/data/models/person_generic.dart';
import '../../../states/cubit/movies/movie_cubit.dart';
import '../../../states/cubit/person/person_cubit.dart';
import '../../../states/cubit/person/person_state.dart';
import '../../widgets/app_shimmer.dart';
import '../../widgets/mask_image.dart';
import '../../widgets/search_field_widget.dart';
import 'category_screen.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    List<Movie> movies = [];
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kGreenColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.4,
              right: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kPinkColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kCyanColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: ListView(
                primary: true,
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
                  const RPadding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'New movies',
                      style: TextStyle(
                        color: AppColors.kWhiteColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  25.verticalSpace,
                  BlocBuilder<MovieCubit, MovieState>(
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
                      } else if (state is MovieLoaded) {
                        movies = state.movieList;
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
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
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
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Category movies',
                          style: TextStyle(
                            color: AppColors.kWhiteColor,
                            fontSize: 17.sp,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
