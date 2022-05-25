// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_module/base/routes/navigation_service.dart';
import 'package:test_module/base/widgets/mc_base_button.dart';
import 'package:test_module/base/widgets/mc_ic_button.dart';
import 'package:test_module/base/widgets/mc_scaffold.dart';
import 'package:test_module/base/widgets/mc_text_field.dart';
import 'package:test_module/res/component_style.dart';
import 'package:test_module/res/strings.dart';
import 'package:test_module/ultis/app_color.dart';
import 'package:test_module/ultis/font_scale.dart';

class LoanInfoPage extends StatefulWidget {
  const LoanInfoPage({Key? key}) : super(key: key);

  @override
  State<LoanInfoPage> createState() => _LoanInfoPageState();
}

class _LoanInfoPageState extends State<LoanInfoPage> {
  @override
  Widget build(BuildContext context) {
    return MCScaffold(
      appbarColor: Colors.white,
      leading: MCIconButton(
        backgroundColor: Colors.white,
        icon: platformIconBack(Colors.black),
        onPress: () async {
          NavigationService.pop();
        },
      ),
      child: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 60, left: 24, right: 24),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _contetBody(),
                  Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 8),
                    child: Text(Strings.contentLoan2)
                        .semiBold13(color: Color(0xff6C7E98)),
                  ),
                  MCTextField(
                    hindText: 'Nhập hạn mức mong muốn',
                  )
                ],
              ),
            ),
            btnBottom(),
          ],
        ),
      ),
    );
  }

  Widget _contetBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: LinearProgressIndicator(
              value: 0.3,
              semanticsLabel: '',
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(Strings.titleLoan).large24(),
        Text(Strings.contentLoan1)
            .regular16(color: AppColors.titleTextColor.withOpacity(0.7)),
      ],
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
          MCBaseButton(
            title: Strings.continues,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
