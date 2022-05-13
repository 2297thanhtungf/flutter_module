import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_module/ui/cubit/flickr_cubit.dart';
import 'package:test_module/ui/model/flick_data.dart';
import 'package:test_module/ui/photo_detail.dart';
import 'package:test_module/ultis/base_listview.dart';
import 'package:test_module/ultis/constants.dart';
import 'package:test_module/ultis/keys.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin {
  FlickrCubit _cubit = FlickrCubit();
  final String method = 'flickr.interestingness.getList';
  late Photos _dataImage;
  String urlImage = 'https://live.staticflickr.com/';
  int _indexPage = 1;
  bool _hasData = false;
  @override
  void initState() {
    super.initState();
  }

  void initData() {
    _cubit.getDataTree(method, page: _indexPage);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocConsumer<FlickrCubit, FlickrState>(
          listener: (context, state) async {
        if (state is GetDataTreeSuccess) {
          _dataImage = _cubit.flickrData.photos;
          _hasData = true;
        }
      }, builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return true;
          },
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(Platform.isAndroid ? kToolbarHeight : 44),
              child: AppBar(
                  title: Text('Flutter Module'),
                  leading: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: ()async {
                        final bool result = await Constants.backToNativeChannel
        .invokeMethod('listen_back_from_module',);
        print('==========LOG result:$result');
                        // SystemNavigator.pop();
                      },
                      padding: EdgeInsets.zero,
                      icon: Icon(
                          Platform.isIOS
                              ? Icons.arrow_back_ios
                              : Icons.arrow_back,
                          color: Colors.black,
                          size: 24),
                    ),
                  )),
            ),
            body: SafeArea(
              child: Container(
                color: Color(0xffF4F6FA),
                child: BaseListView(
                  widget: viewImages(),
                  enableLoadMore: true,
                  key: Keys.navKey,
                  onLoadMore: (onSuccess, onFailed) {
                    _cubit.getDataTree(method,
                        page: _indexPage += 1, isLoadMore: true);

                    Future.delayed(Duration(milliseconds: 3), () {
                      onSuccess();
                    });
                  },
                  onRefresh: () {
                    _indexPage = 1;
                    _cubit.getDataTree(method, page: 1);
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget viewImages() {
    return _hasData
        ? ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: _dataImage.photo.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    top: index == 0 ? 12 : 0, bottom: 12, left: 12, right: 12),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return PhotoView(
                              url:
                                  '$urlImage${_dataImage.photo[index].server}/${_dataImage.photo[index].id}_${_dataImage.photo[index].secret}.jpg');
                        });
                  },
                  onDoubleTap: () {},
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          child: Image.network(
                            '$urlImage${_dataImage.photo[index].server}/${_dataImage.photo[index].id}_${_dataImage.photo[index].secret}.jpg',
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Text(
                            '${_dataImage.photo[index].title}',
                            style: TextStyle(
                                color: Color(0xff25282B),
                                fontFamily: 'SVN-Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 1.4286),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
        : CupertinoActivityIndicator();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    initData();
  }
}
