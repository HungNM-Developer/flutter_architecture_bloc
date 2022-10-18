import 'package:equatable/equatable.dart';

import '../../../core/data/models/person_generic.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

class PersonLoading extends PersonState {}

class PersonError extends PersonState {}

class PersonLoadEmpty extends PersonState {}

class PersonLoaded extends PersonState {
  final List<Person> personList;
  const PersonLoaded({required this.personList});

  @override
  List<Object> get props => [personList];
}
