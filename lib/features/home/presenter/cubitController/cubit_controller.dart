
import 'package:bloc/bloc.dart';
import 'package:nasa_clean_arch/core/usecase/usecase.dart';
import 'package:nasa_clean_arch/features/home/data/models/space_media_model.dart';
import 'package:equatable/equatable.dart';
import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:nasa_clean_arch/features/home/domain/entities/space_media_entipy.dart';

part 'home_state.dart';

class CubitController extends Cubit<HomeState> {
  final Usecase _usecase;
  CubitController({required Usecase usecase})
    : _usecase = usecase,
      super(const HomeState.inital());

  Future<void> getSpaceMediaFromDate(DateTime date) async {
    emit(state.copyWith(status: HomeStatus.loading));
    Future.delayed(Duration(seconds: 2));
    final result = await _usecase.call(date);
      result.fold(
        (erro) => emit(state.copyWith(error: erro, status: HomeStatus.error)), 
        (spaceMedia) => emit(state.copyWith(spaceMediaModel: spaceMedia, status: HomeStatus.success))
      );
  }
  
}