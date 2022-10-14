import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_circular_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';
import '../../../core/data/models/movie.dart';
import '../../../states/cubit/movies/movie_cubit.dart';
import '../../widgets/mask_image.dart';
import '../../widgets/search_field_widget.dart';
import 'category_screen.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                    builder: (context, state) {
                      if (state is MovieLoading) {
                        return const Center(
                          child: AppCircularProgressIndicator(),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: Container(
      //   height: 64,
      //   width: 64,
      //   padding: const EdgeInsets.all(4),
      //   margin: const EdgeInsets.only(top: 40),
      //   decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       colors: [
      //         AppColors.kPinkColor.withOpacity(0.2),
      //         AppColors.kGreenColor.withOpacity(0.2)
      //       ],
      //     ),
      //   ),
      //   child: Container(
      //     height: 60,
      //     width: 60,
      //     padding: const EdgeInsets.all(4),
      //     decoration: const BoxDecoration(
      //       shape: BoxShape.circle,
      //       gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //         colors: [
      //           AppColors.kPinkColor,
      //           AppColors.kGreenColor,
      //         ],
      //       ),
      //     ),
      //     child: RawMaterialButton(
      //       onPressed: () {},
      //       shape: const CircleBorder(),
      //       fillColor: const Color(0xff404c57),
      //       child: const Icon(Icons.home),
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: GlassmorphicContainer(
      //   width: screenWidth,
      //   height: 92,
      //   borderRadius: 0,
      //   linearGradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       AppColors.kWhiteColor.withOpacity(0.1),
      //       AppColors.kWhiteColor.withOpacity(0.1),
      //     ],
      //   ),
      //   border: 0,
      //   blur: 30,
      //   borderGradient: const LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       AppColors.kPinkColor,
      //       AppColors.kGreenColor,
      //     ],
      //   ),
      //   child: BottomAppBar(
      //     color: Colors.transparent,
      //     notchMargin: 4,
      //     elevation: 0,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Expanded(
      //           child: IconButton(
      //             onPressed: () {},
      //             icon: SvgPicture.asset(
      //               AppColors.kIconHome,
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: IconButton(
      //             onPressed: () {},
      //             icon: SvgPicture.asset(
      //               AppColors.kIconPlayOnTv,
      //             ),
      //           ),
      //         ),
      //         const Expanded(
      //           child: Text(''),
      //         ),
      //         Expanded(
      //           child: IconButton(
      //             onPressed: () {},
      //             icon: SvgPicture.asset(
      //               AppColors.kIconCategories,
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: IconButton(
      //             onPressed: () {},
      //             icon: SvgPicture.asset(
      //               AppColors.kIconDownload,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
