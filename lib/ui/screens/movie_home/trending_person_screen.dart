import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/config.dart';
import 'package:flutter_architecture_bloc/core/data/models/person_generic.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_circular_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../di/injection.dart';
import '../../../states/cubit/person/person_cubit.dart';
import '../../../states/cubit/person/person_state.dart';

class TrendingPersonScreen extends StatelessWidget {
  const TrendingPersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BlocBuilder<PersonCubit, PersonState>(
          builder: (context, state) {
            if (state is PersonLoading) {
              return const Center(
                child: AppCircularProgressIndicator(),
              );
            }
            if (state is PersonLoaded) {
              List<Person> personList = state.personList;
              if (kDebugMode) {
                print(personList.length);
              }
              return SizedBox(
                height: 110.h,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: personList.length,
                  separatorBuilder: (context, index) => VerticalDivider(
                    color: Colors.transparent,
                    width: 5.w,
                  ),
                  itemBuilder: (context, index) {
                    Person person = personList[index];
                    return Column(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          elevation: 3,
                          child: ClipRRect(
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w200${person.profilePath}',
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100.r),
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              placeholder: (context, url) => SizedBox(
                                width: 80.r,
                                height: 80.r,
                                child: const Center(
                                  child: AppCircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                width: 80.r,
                                height: 80.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100.r),
                                  ),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/img_not_found.jpg',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            person.name!.toUpperCase(),
                            style: TextStyle(
                              color: AppColors.kWhiteColor,
                              fontSize: 8.sp,
                              fontFamily: 'muli',
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            person.knownForDepartment!.name.toUpperCase(),
                            style: TextStyle(
                              color: AppColors.kWhiteColor,
                              fontSize: 8.sp,
                              fontFamily: 'muli',
                            ),
                          ),
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
