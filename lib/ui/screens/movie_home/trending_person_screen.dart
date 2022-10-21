import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/config.dart';
import 'package:flutter_architecture_bloc/core/core.dart';
import 'package:flutter_architecture_bloc/core/data/models/person_generic.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_circular_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../states/cubit/person/person_cubit.dart';
import '../../../states/cubit/person/person_state.dart';
import '../../widgets/app_shimmer.dart';

class TrendingPersonScreen extends StatefulWidget {
  const TrendingPersonScreen({super.key});

  @override
  State<TrendingPersonScreen> createState() => _TrendingPersonScreenState();
}

class _TrendingPersonScreenState extends State<TrendingPersonScreen> {
  final _cubit = getIt<PersonCubit>();
  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BlocBuilder<PersonCubit, PersonState>(
          bloc: _cubit..fetchTrendingPerson(),
          builder: (context, state) {
            if (state is PersonLoading) {
              return SizedBox(
                height: 110.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(
                    6,
                    (index) => Row(
                      children: [
                        AppShimmer(
                          width: 80.r,
                          height: 80.r,
                          radius: 100.r,
                        ),
                        5.horizontalSpace,
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is PersonLoaded) {
              List<Person> personList = state.personList;
              return SizedBox(
                height: 110.h,
                width: double.infinity,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  primary: true,
                  shrinkWrap: true,
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
                            child: UIUtility.cachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w200${person.profilePath}',
                              width: 80.r,
                              height: 80.r,
                              radius: 100.r,
                              imageBuilder: (context, imageProvider) {
                                return DecoratedBox(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
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
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
