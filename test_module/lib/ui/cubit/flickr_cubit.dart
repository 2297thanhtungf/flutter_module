import 'package:bloc/bloc.dart';
import 'package:test_module/ui/cubit/flickr_repo.dart';
import 'package:test_module/ui/model/flick_data.dart';
import 'package:test_module/ultis/constants.dart';

part 'flickr_state.dart';

class FlickrCubit extends Cubit<FlickrState> {
  FlickrCubit() : super(FlickrInitial());
  // FlickrCubit({required FlickrState initialState}) : super(initialState);

  FlickrRepo repository = FlickrRepo();
  late FlickrData flickrData;

  void backToNative() async {
    final bool result = await Constants.backToNativeChannel
        .invokeMethod('listen_back_from_module');
    
    if (result) emit(BackToNativeSuccess());
    
  }

  Future<FlickrData> getDataTree(String method,
      {int page = 1, bool isLoadMore = false}) async {
    if (!isLoadMore) {
      flickrData = await repository.getDataTree(method, page);
    } else {
      FlickrData dataNew = await repository.getDataTree(method, page);
      List<Photo> newList = List.from(flickrData.photos.photo)
        ..addAll(dataNew.photos.photo);
      flickrData.photos.photo = newList;
    }
    emit(GetDataTreeSuccess());
    return flickrData;
  }
}
