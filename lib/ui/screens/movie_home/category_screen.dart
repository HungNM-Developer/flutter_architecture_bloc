import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/config.dart';
import 'package:flutter_architecture_bloc/core/core.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_circular_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/data/models/genre.dart';
import '../../../core/data/models/movie.dart';
import '../../../di/injection.dart';
import '../../../states/cubit/genre/genre_cubit.dart';
import '../../../states/cubit/movies/movie_cubit.dart';
import '../../widgets/app_shimmer.dart';

class BuildWidgetCategory extends StatefulWidget {
  final int selectedGenre;

  const BuildWidgetCategory({
    Key? key,
    this.selectedGenre = 0,
  }) : super(key: key);

  @override
  BuildWidgetCategoryState createState() => BuildWidgetCategoryState();
}

class BuildWidgetCategoryState extends State<BuildWidgetCategory> {
  late int _selectedGenre;
  final _cubitGenres = getIt<GenreCubit>();
  @override
  void initState() {
    super.initState();
    _selectedGenre = widget.selectedGenre;
  }

  @override
  void dispose() {
    _cubitGenres.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<GenreCubit, GenreState>(
          builder: (context, state) {
            if (state is GenreLoading) {
              return SizedBox(
                height: 30.h,
                width: double.infinity,
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: List.generate(
                    6,
                    (index) => Row(
                      children: [
                        AppShimmer(
                          height: 30.h,
                          width: 70.w,
                        ),
                        5.horizontalSpace,
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is GenreLoaded) {
              List<Genre> genres = state.genreList;
              return SizedBox(
                height: 40.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: true,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) =>
                      VerticalDivider(
                    color: Colors.transparent,
                    width: 5.w,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  itemBuilder: (context, index) {
                    Genre genre = genres[index];
                    return Center(
                      child: ChoiceChip(
                          label: Text(
                            genre.name!.toUpperCase(),
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: _selectedGenre == genre.id
                                  ? Colors.white
                                  : Colors.black45,
                              fontFamily: 'muli',
                            ),
                          ),
                          selected: _selectedGenre == genre.id,
                          backgroundColor: Colors.white,
                          selectedColor: Colors.tealAccent.shade700,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedGenre = genre.id!;
                              context
                                  .read<MovieCubit>()
                                  .fetchNowPlayingMovie(_selectedGenre, '');
                            });
                          }),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text('Something went wrong!!!'),
              );
            }
          },
        ),
        30.verticalSpace,
        Text(
          'new playing'.toUpperCase(),
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.kWhiteColor,
            fontFamily: 'muli',
          ),
        ),
        10.verticalSpace,
        BlocBuilder<MovieCubit, MovieState>(
          bloc: context.read<MovieCubit>()
            ..fetchNowPlayingMovie(_selectedGenre, ''),
          builder: (context, state) {
            if (state is MovieLoading) {
              return SizedBox(
                height: 300.h,
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: List.generate(
                    4,
                    (index) => Row(
                      children: [
                        AppShimmer(
                          height: 250.h,
                          width: 180.w,
                        ),
                        5.horizontalSpace,
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is MovieLoaded) {
              List<Movie> movieList = state.movieList;
              return SizedBox(
                height: 300.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: true,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => VerticalDivider(
                    color: Colors.transparent,
                    width: 15.w,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {
                    Movie movie = movieList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(
                              RouteName.movieDetailScreen,
                              extra: movie,
                            );
                          },
                          child: ClipRRect(
                            child: UIUtility.cachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/original///${movie.backdropPath}',
                              width: 180.w,
                              height: 250.h,
                              radius: 12.r,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.r),
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        SizedBox(
                          width: 180.w,
                          child: Text(
                            movie.title!.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.kWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'muli',
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14.sp,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14.sp,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14.sp,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14.sp,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14.sp,
                            ),
                            Text(
                              movie.voteAverage.toString(),
                              style: const TextStyle(
                                color: AppColors.kGreyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
