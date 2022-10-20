part of movie_detail_screen;

class _BodyWidget extends StatelessWidget {
  final MovieDetail movieDetail;
  const _BodyWidget({Key? key, required this.movieDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.only(
        top: 500,
        left: 24,
        right: 24,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'overview'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.kWhiteColor,
                fontFamily: 'muli',
              ),
            ),
            10.verticalSpace,
            Text(
              movieDetail.overview.toString(),
              style: TextStyle(
                fontSize: 13.sp,
                fontFamily: 'muli',
                color: AppColors.kWhiteColor.withOpacity(
                  0.6,
                ),
              ),
            ),
            20.verticalSpace,
            Text(
              'cast & crew'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.kWhiteColor,
                fontFamily: 'muli',
              ),
            ),
            10.verticalSpace,
            SizedBox(
              height: 110.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => VerticalDivider(
                  color: Colors.transparent,
                  width: 5.w,
                ),
                itemCount: movieDetail.castList!.length,
                itemBuilder: (context, index) {
                  Cast cast = movieDetail.castList![index];
                  return Column(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        elevation: 3,
                        child: ClipRRect(
                          child: UIUtility.cachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w200${cast.profilePath}',
                            width: 80.r,
                            height: 80.r,
                            radius: 100.r,
                            imageBuilder: (context, imageBuilder) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: imageBuilder,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          cast.name!.toUpperCase(),
                          style: TextStyle(
                            color: AppColors.kWhiteColor.withOpacity(0.5),
                            fontSize: 8.sp,
                            fontFamily: 'muli',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          cast.character!.toUpperCase(),
                          style: TextStyle(
                            color: AppColors.kWhiteColor.withOpacity(0.5),
                            fontSize: 8.sp,
                            fontFamily: 'muli',
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            20.verticalSpace,
            Text(
              'screenshot'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.kWhiteColor,
                fontFamily: 'muli',
              ),
            ),
            10.verticalSpace,
            SizedBox(
              height: 155.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => VerticalDivider(
                  color: Colors.transparent,
                  width: 5.w,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: movieDetail.movieImage!.backdrops.length,
                itemBuilder: (context, index) {
                  Screenshot image = movieDetail.movieImage!.backdrops[index];
                  return Card(
                    elevation: 3,
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: UIUtility.cachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/w500${image.imagePath}',
                        width: 250.w,
                        height: 200.h,
                      ),
                    ),
                  );
                },
              ),
            ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
