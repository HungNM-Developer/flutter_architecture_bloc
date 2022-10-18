import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/config.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_circular_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  late int selectedGenre = 0;

  @override
  void initState() {
    super.initState();
    selectedGenre = widget.selectedGenre;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<GenreCubit, GenreState>(
          bloc: getIt<GenreCubit>()..fetchGenre(),
          builder: (context, state) {
            if (state is GenreLoading) {
              return SizedBox(
                height: 30.h,
                width: double.infinity,
                child: ListView(
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
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Genre genre = genres[index];
                            selectedGenre = genre.id!;
                            context
                                .read<MovieCubit>()
                                .fetchNowPlayingMovie(selectedGenre, '');
                          });
                        },
                        child: Container(
                          padding: REdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black45,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.r),
                            ),
                            color: (genre.id == selectedGenre)
                                ? Colors.teal.shade700
                                : Colors.white,
                          ),
                          child: Text(
                            genre.name!.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: selectedGenre == genre.id
                                  ? Colors.white
                                  : Colors.black45,
                              fontFamily: 'muli',
                            ),
                          ),
                        ),
                      ),
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
          bloc: context.read<MovieCubit>(),
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(
                child: AppCircularProgressIndicator(),
              );
            } else if (state is MovieLoaded) {
              List<Movie> movieList = state.movieList;

              return SizedBox(
                height: 300.h,
                child: ListView.separated(
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         MovieDetailScreen(movie: movie),
                            //   ),
                            // );
                          },
                          child: ClipRRect(
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/original///${movie.backdropPath}',
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  width: 180,
                                  height: 250,
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
                              placeholder: (context, url) => SizedBox(
                                width: 180.w,
                                height: 250.h,
                                child: const Center(
                                  child: AppCircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                width: 180.w,
                                height: 250.h,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/img_not_found.jpg'),
                                  ),
                                ),
                              ),
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
              return Container();
            }
          },
        ),
      ],
    );
  }
}
