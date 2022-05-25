// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_module/base/routes/navigation_service.dart';
import 'package:test_module/base/routes/routes.dart';
import 'package:test_module/custom/row_container.dart';
import 'package:test_module/feature/digital_lending/representation/blocs/lending_bloc.dart';
import 'package:test_module/feature/digital_lending/representation/lending/bg_bar_scroll.dart';
import 'package:test_module/res/strings.dart';
import 'package:test_module/ultis/app_color.dart';
import 'package:test_module/ultis/font_scale.dart';

class LendingPage extends StatefulWidget {
  const LendingPage({Key? key}) : super(key: key);

  @override
  State<LendingPage> createState() => _LendingPageState();
}

class _LendingPageState extends State<LendingPage> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0);
  final RefreshController _refreshController = RefreshController();
  late LendingBloc lendingBloc;

  @override
  void initState() {
    lendingBloc = BlocProvider.of<LendingBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LendingBloc, LendingState>(
      builder: (context, state) {
        return Scaffold(
          // backgroundColor: Color(0xffF4F6FA),
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Colors.transparent,
            ),
            child: SafeArea(
              top: false,
              child: Stack(
                children: [
                  SmartRefresher(
                    controller: _refreshController,
                    scrollController: _scrollController,
                    header: const MaterialClassicHeader(
                      backgroundColor: Colors.white,
                      color: Color(0xff00B4FA),
                    ),
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [_banner(), _body()],
                      ),
                    ),
                    onRefresh: () {
                      Future.delayed(Duration(seconds: 4),
                          () => _refreshController.refreshCompleted());
                    },
                  ),
                  BackgroundBarScroll(
                      scrollController: _scrollController, heightTrigger: 174),
                  btnBottom(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _banner() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xff003D73), Color(0xff2B88D8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Image.asset(
        'assets/images/top_banner.png',
        height: 180,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 114),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffF4F6FA),
            Colors.white,
            Colors.white,
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 12, left: 24, right: 24),
        child: ListView(
          padding: const EdgeInsets.only(bottom: 88),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Text(Strings.titleLending.toUpperCase())
                .semiBold16(color: Color(0xff1B67C5)),
            SizedBox(
              height: 8,
            ),
            Text(Strings.subTitleLending).large24(color: Color(0xff0A2851)),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Image.asset(
                'assets/images/img_lending.png',
                width: 230,
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              Strings.contentLending,
              textAlign: TextAlign.center,
            ).semiBold16(),
            Text('15.000.000 VND', textAlign: TextAlign.center)
                .large24(color: Color(0xff0A73F0)),
            SizedBox(
              height: 36,
            ),
            MCrectangle(
                titleColor: Color(0xff0A2851).withOpacity(0.7),
                img: 'img_lending1.png',
                content: Strings.contentLending1,
                title: Strings.titleLending1),
            MCrectangle(
                titleColor: Color(0xff0A2851).withOpacity(0.7),
                img: 'img_lending2.png',
                content: Strings.contentLending2,
                title: Strings.titleLending2),
            MCrectangle(
                titleColor: Color(0xff0A2851).withOpacity(0.7),
                img: 'img_lending3.png',
                content: Strings.contentLending3,
                title: Strings.titleLending3),
          ],
        ),
      ),
    );
  }

  Widget btnBottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            thickness: 1,
            color: AppColors.dividerColor,
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: InkWell(
              onTap: () {
                // lendingBloc.onClickBtn(lendingBloc.statusBtn);
                NavigationService.push(Routes.loanPage);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 56,
                  width: double.infinity,
                  color: lendingBloc.statusBtn
                      ? Color(0xff0A73F0)
                      : AppColors.bodyTextColor,
                  child: Center(
                    child: Text(
                      Strings.startNow,
                      textAlign: TextAlign.center,
                    ).semiBold16(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
