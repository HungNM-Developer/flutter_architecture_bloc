import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';
import 'package:flutter_architecture_bloc/states/cubit/person/person_state.dart';

import '../../../core/data/models/person.dart';
import '../../../core/data/repositories/movies/moview_repository.dart';
import '../../../di/injection.dart';

class PersonCubit extends Cubit<PersonState> {
  final _moviesRepository = getIt<MoviesRepository>();

  PersonCubit() : super(PersonLoading());

  Future<void> fetchTrendingPerson() async {
    SingleResponse<dynamic> result;
    result = await _moviesRepository.getTrendingPerson();
    if (result.status != 'ok') emit(PersonError());
    final lstPerson =
        List<Person>.from((result.data as PersonGeneric).results ?? []);
    if (lstPerson.isEmpty) emit(PersonLoadEmpty());
    emit(PersonLoaded(personList: lstPerson));
  }
}
