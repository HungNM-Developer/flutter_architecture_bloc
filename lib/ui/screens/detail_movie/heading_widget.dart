part of movie_detail_screen;

class _HeadingWidget extends StatelessWidget {
  const _HeadingWidget({
    Key? key,
    required this.movieDetail,
  }) : super(key: key);

  final MovieDetail movieDetail;

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.only(
        left: 24,
        top: 170,
      ),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              UIUtility.cachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/original/${movieDetail.backdropPath}',
                width: 165.w,
                height: 230.h,
                radius: 20.r,
                imageBuilder: (context, imageProvider) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                      ],
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () async {
                  final youtubeUrl =
                      'https://www.youtube.com/embed/${movieDetail.trailerId}';
                  if (movieDetail.trailerId == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.bgDarkBlue,
                        content: Text(
                          'Oop! No trailer!',
                          style: TextStyle(
                            color: AppColors.kWhiteColor,
                            fontSize: 14.sp,
                            fontFamily: 'muli',
                          ),
                        ),
                        dismissDirection: DismissDirection.startToEnd,
                        action: SnackBarAction(
                          label: 'Ok',
                          onPressed: () {},
                        ),
                      ),
                    );
                  } else {
                    if (!await launchUrl(
                      Uri.parse(youtubeUrl),
                      mode: LaunchMode.externalApplication,
                    )) {
                      throw 'Could not launch $youtubeUrl';
                    }
                  }
                },
                child: Container(
                  width: 60.r,
                  height: 60.r,
                  padding: REdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffFE53BB),
                        Color(0xFF09FBD3),
                      ],
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.kGreyColor,
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: AppColors.kWhiteColor,
                      size: 50.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: REdgeInsets.only(
                    left: 10,
                    bottom: 8,
                    right: 20,
                  ),
                  width: double.infinity,
                  child: Text(
                    movieDetail.title ?? '',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'muli',
                      color: AppColors.kWhiteColor.withOpacity(
                        0.85,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: REdgeInsets.only(
                    left: 10,
                    bottom: 8,
                    right: 20,
                  ),
                  width: double.infinity,
                  child: Text(
                    movieDetail.releaseDate.toString(),
                    style: TextStyle(
                      fontFamily: 'muli',
                      color: AppColors.kWhiteColor.withOpacity(0.7),
                    ),
                  ),
                ),
                Container(
                  padding: REdgeInsets.only(
                    left: 10,
                    bottom: 8,
                    right: 20,
                  ),
                  width: double.infinity,
                  child: Row(
                    children: [
                      RatingBar.builder(
                        glow: true,
                        ignoreGestures: true,
                        allowHalfRating: true,
                        itemSize: 14.sp,
                        initialRating: movieDetail.rating(),
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
                      5.horizontalSpace,
                      Text('(${movieDetail.rating()})'),
                    ],
                  ),
                ),
                Container(
                  padding: REdgeInsets.only(
                    left: 10,
                    bottom: 8,
                    right: 20,
                  ),
                  width: double.infinity,
                  child: Text(
                    movieDetail.genresName(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'muli',
                      color: AppColors.kWhiteColor.withOpacity(0.7),
                    ),
                  ),
                ),
                Container(
                  padding: REdgeInsets.only(
                    left: 10,
                    bottom: 8,
                    right: 20,
                  ),
                  width: double.infinity,
                  child: Text(
                    movieDetail.intToTimeLeft(movieDetail.runtime ?? 0),
                    style: TextStyle(
                      fontFamily: 'muli',
                      color: AppColors.kWhiteColor.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarMoviDetail extends StatelessWidget {
  const AppBarMoviDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              height: 44.r,
              width: 44.r,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 3, color: Colors.white),
              ),
              child: SvgPicture.asset(AppSvgIcon.kIconBack),
            ),
          ),
          Container(
            height: 44.r,
            width: 44.r,
            padding: REdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(width: 3, color: Colors.white),
            ),
            child: SvgPicture.asset(AppSvgIcon.kIconMenu),
          ),
        ],
      ),
    );
  }
}
