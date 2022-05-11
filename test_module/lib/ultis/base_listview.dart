import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BaseListView extends StatefulWidget {
  final Widget widget;
  final Function(Function() onSuccess, Function() onFailed) onLoadMore;
  final Function() onRefresh;
  final bool enableLoadMore;

  const BaseListView(
      {Key? key,
      required this.widget,
      required this.onLoadMore,
      required this.onRefresh,
      this.enableLoadMore = false})
      : super(key: key);

  @override
  _BaseListViewState createState() => _BaseListViewState();
}

class _BaseListViewState extends State<BaseListView> {
  RefreshController _refreshController = RefreshController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      child: widget.widget,
      physics: BouncingScrollPhysics(),
      enablePullUp: widget.enableLoadMore,
      header: CustomHeader(
        builder: (ctx, loadStatus) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoActivityIndicator(),
          );
        },
      ),
      footer: CustomFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        builder: (ctx, loadStatus) {
          return loadStatus == LoadStatus.loading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoActivityIndicator(),
                )
              : Container();
        },
      ),
//      physics: BouncingScrollPhysics(),
      onRefresh: () async {
        widget.onRefresh();
        if (mounted) {
          _refreshController.refreshCompleted();
        }
      },
      onLoading: () async {
        if (!isLoading) {
          setState(() {
            isLoading = true;
          });
          widget.onLoadMore(() {
            _refreshController.loadComplete();
            setState(() {
              isLoading = false;
            });
          },() {

            _refreshController.loadComplete();
                setState(() {
                  isLoading = false;
                });
          });
        }
      },
    );
  }
}
