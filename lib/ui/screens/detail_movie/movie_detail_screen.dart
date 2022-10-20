library movie_detail_screen;

import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/config.dart';
import 'package:flutter_architecture_bloc/core/core.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_circular_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/data/models/movie.dart';
import '../../../core/data/models/movie_credits.dart';
import '../../../core/data/models/movie_detail.dart';
import '../../../core/data/models/screen_shot.dart';
import '../../../di/injection.dart';
import '../../../states/cubit/movie_detail/movie_detail_cubit.dart';
import 'movie_detail_button.dart';

part 'heading_widget.dart';
part 'body_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: AppColors.bgDarkBlue,
        extendBody: true,
        body: _buildDetailBody(context),
      ),
      onWillPop: () async => true,
    );
  }

  Widget _buildDetailBody(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      bloc: getIt<MovieDetailCubit>()..fetchMovieDetail(movie.id!),
      builder: (context, state) {
        if (state is MovieDetailLoading) {
          return const Center(
            child: AppCircularProgressIndicator(),
          );
        }
        if (state is MovieDetailLoaded) {
          MovieDetail movieDetail = state.detail;

          return SingleChildScrollView(
            primary: true,
            physics: const ClampingScrollPhysics(),
            child: Stack(
              children: [
                BackgroundWidget(movieDetail: movieDetail),
                Container(
                  height: 300.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        const Color(0xFF101930).withOpacity(1),
                      ],
                    ),
                  ),
                ),
                const AppBarMoviDetail(),
                _HeadingWidget(movieDetail: movieDetail),
                const RPadding(
                  padding: EdgeInsets.only(top: 420),
                  child: MovieDetailButton(),
                ),
                _BodyWidget(movieDetail: movieDetail),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
    required this.movieDetail,
  }) : super(key: key);

  final MovieDetail movieDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          child: UIUtility.cachedNetworkImage(
            imageUrl:
                'https://image.tmdb.org/t/p/original/${movieDetail.backdropPath}',
            height: 300.h,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          height: 200.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                const Color(0xFF101930).withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
