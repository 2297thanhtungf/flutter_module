import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_module/feature/flic/data/model/flick_data.dart';
import 'package:test_module/feature/flic/domain/usecase/get_flic_images.dart';

class FlicBloc extends Cubit<FlicState> {
  final GetFlicImagesUseCase getFlicImagesUseCase;

  FlicBloc({required this.getFlicImagesUseCase}) : super(const FlicStateImpl());

  FlickrData? get flicData => state.flicData;

  getFlicImages(
      {required String method,
      required int index,
      required bool isLoadMore}) async {
    GetFlicParams params = GetFlicParams(method: method, index: index);
    final reponse = await getFlicImagesUseCase(params);
    reponse.fold((failed) {
      print('Call api some thing went wrong');
    }, (data) {
      if (!isLoadMore) {
        emit(state.coptWith(flicData: data));
      } else {
        FlickrData dataNew = data;
        List<Photo> newList = List.from(state.flicData!.photos.photo)
          ..addAll(dataNew.photos.photo);

        dataNew.photos.photo = newList;
        emit(state.coptWith(flicData: dataNew));
      }
    });
  }
}

@immutable
abstract class FlicState extends Equatable {
  final FlickrData? flicData;

  const FlicState({this.flicData});

  FlicStateImpl coptWith({final FlickrData? flicData}) {
    return FlicStateImpl(
      flicData: flicData,
    );
  }
}

class FlicStateImpl extends FlicState {
  const FlicStateImpl({final FlickrData? flicData}) : super(flicData: flicData);

  @override
  List<Object?> get props => [flicData];
}
