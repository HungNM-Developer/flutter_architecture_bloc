import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/core/routes/route_name.dart';
import 'package:flutter_architecture_bloc/core/utils/ui_utility.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';
import 'package:flutter_architecture_bloc/states/cubit/search_movie/search_movie_cubit.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_circular_progress_indicator.dart';
import 'package:flutter_architecture_bloc/ui/widgets/list_loader.dart';
import 'package:flutter_architecture_bloc/ui/widgets/search_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../config/app_colors.dart';
import '../../../core/data/models/movie.dart';

class SearchMovieScreen extends StatefulWidget {
  const SearchMovieScreen({super.key});

  @override
  State<SearchMovieScreen> createState() => _SearchMovieScreenState();
}

class _SearchMovieScreenState extends State<SearchMovieScreen>
    with AutomaticKeepAliveClientMixin {
  final _cubit = getIt<SearchMovieCubit>();
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.bgDarkBlue,
      extendBody: true,
      body: RPadding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
                textEditingController: _searchController,
                suffixIcon: Icon(
                  _searchController.text.isNotEmpty ? Icons.close : null,
                  size: 18.sp,
                  color: Colors.red,
                ),
                suffixIconTap: () {
                  _searchController.clear();
                  _cubit.searchMovie(keyword: _searchController.text);
                },
                onChanged: (value) {
                  _cubit.searchMovie(keyword: value);
                  setState(() {});
                }),
            30.verticalSpace,
            Text(
              'Search results'.toUpperCase(),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.kWhiteColor,
                fontFamily: 'muli',
              ),
            ),
            16.verticalSpace,
            Expanded(
              child: BlocBuilder<SearchMovieCubit, SearchMovieState>(
                bloc: _cubit,
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  if (state is SearchMovieInitial) {
                    return const Center(
                      child: Text('Search the Movies'),
                    );
                  } else if (state is SearchMovieLoading) {
                    return const Center(
                      child: AppCircularProgressIndicator(),
                    );
                  }
                  if (state is SearchMovieHasData) {
                    List<Movie> result = state.searchResult;
                    return ListLoader(
                      controller: _cubit.refreshController,
                      onRefresh: _cubit.onRefresh,
                      onLoadMore: _cubit.onLoadMore,
                      hasNext: _cubit.hasNext,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 24.h,
                          );
                        },
                        padding: REdgeInsets.only(bottom: 24),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final movie = result[index];
                          return MovieList(movie: movie);
                        },
                        itemCount: result.length,
                      ),
                    );
                  } else if (state is SearchMovieEmpty) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is SearchMovieError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Center(
                      child: Text(state.runtimeType.toString()),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MovieList extends StatelessWidget {
  final Movie movie;

  const MovieList({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RouteName.movieDetailScreen,
          extra: movie,
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: 115.w,
            height: 85.h,
            child: UIUtility.cachedNetworkImage(
              radius: 10.r,
              imageUrl:
                  'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
              imageBuilder: (context, imageProvider) => Container(
                width: 115.w,
                height: 85.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  movie.title ?? 'No Title',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.kWhiteColor.withOpacity(
                      0.85,
                    ),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'muli',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                8.verticalSpace,
                Text(
                  movie.releaseDate ?? 'No Release Date',
                  style: TextStyle(
                    color: AppColors.kWhiteColor.withOpacity(
                      0.7,
                    ),
                    fontFamily: 'muli',
                  ),
                ),
                8.verticalSpace,
                Row(
                  children: [
                    RatingBar.builder(
                      glow: true,
                      ignoreGestures: true,
                      allowHalfRating: true,
                      itemSize: 14.sp,
                      initialRating: movie.voteAverageStart(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding: REdgeInsets.symmetric(
                        horizontal: 1,
                      ),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: AppColors.kYellowColor,
                      ),
                      unratedColor: AppColors.kWhiteColor,
                      onRatingUpdate: (double value) {},
                    ),
                    8.horizontalSpace,
                    Text(
                      '(${movie.voteAverage})',
                      style: TextStyle(
                        color: AppColors.kWhiteColor.withOpacity(
                          0.85,
                        ),
                        fontSize: 13.sp,
                        fontFamily: 'muli',
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class AppBarMoviSearch extends StatefulWidget {
//   final TextEditingController searchController;
//   AppBarMoviSearch({
//     Key? key, required this.searchController,
//   }) : super(key: key);

//   @override
//   State<AppBarMoviSearch> createState() => _AppBarMoviSearchState();
// }

// class _AppBarMoviSearchState extends State<AppBarMoviSearch> {
//   @override
//   void dispose() {
//     widget.searchController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         GestureDetector(
//           onTap: () {
//             context.pop();
//           },
//           child: Container(
//             height: 44.r,
//             width: 44.r,
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(100),
//               border: Border.all(width: 3, color: Colors.white),
//             ),
//             child: SvgPicture.asset(AppSvgIcon.kIconBack),
//           ),
//         ),
//         15.horizontalSpace,
//         Expanded(
//           child: Container(
//             height: 44.r,
//             decoration: BoxDecoration(
//               color: AppColors.kGreyColor.withOpacity(0.12),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               children: [
//                 10.horizontalSpace,
//                 Expanded(
//                   child: TextField(
//                     controller: widget.searchController,
//                     onChanged: ((value) {
//                       setState(() {
//                         widget.searchController.text = value;
//                       });
//                     }),
//                     style: TextStyle(
//                       color: AppColors.kWhiteColor.withOpacity(0.6),
//                       fontSize: 17.sp,
//                       letterSpacing: -0.41,
//                     ),
//                     autofocus: true,
//                     decoration: InputDecoration(
//                       hintText: 'Search',
//                       border: InputBorder.none,
//                       isDense: true,
//                       hintStyle: TextStyle(
//                         color: AppColors.kWhiteColor.withOpacity(0.6),
//                         fontSize: 17.sp,
//                         letterSpacing: -0.41,
//                       ),
//                     ),
//                   ),
//                 ),
//                 8.horizontalSpace,
//                 const Icon(Icons.search),
//                 8.horizontalSpace,
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
