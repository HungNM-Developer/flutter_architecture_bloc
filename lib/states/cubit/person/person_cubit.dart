import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_bloc/states/cubit/person/person_state.dart';

import '../../../core/data/models/person_generic.dart';
import '../../../core/data/repositories/movies/moview_repository.dart';
import '../../../di/injection.dart';

class PersonCubit extends Cubit<PersonState> {
  final _moviesRepository = getIt<MoviesRepository>();

  PersonCubit() : super(PersonLoading());

  Future<void> fetchTrendingPerson() async {
    final result = await _moviesRepository.getTrendingPerson();
    result.fold(success: (response) {
      final lstPerson =
          List<Person>.from((response.data as PersonGeneric).results ?? []);
      if (lstPerson.isEmpty) emit(PersonLoadEmpty());
      emit(PersonLoaded(personList: lstPerson));
    }, error: (error) {
      emit(PersonError());
    });
  }
}
