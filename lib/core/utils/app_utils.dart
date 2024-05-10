import "dart:math";

import "package:flutter/material.dart";
import "package:gap/gap.dart";

sealed class AppUtils {
  AppUtils._();

  /// random
  static final Random random = Random();

  /// box
  static const SizedBox kGap = SizedBox.shrink();
  static const Gap kGap2 = Gap(2);
  static const Gap kGap4 = Gap(4);
  static const Gap kGap6 = Gap(6);
  static const Gap kGap8 = Gap(8);
  static const Gap kGap12 = Gap(12);
  static const Gap kGap16 = Gap(16);
  static const Gap kGap20 = Gap(20);
  static const Gap kGap24 = Gap(24);
  static const Gap kGap32 = Gap(32);
  static const Gap kGap40 = Gap(40);
  static const Gap kGap48 = Gap(48);
  static const Gap kGap56 = Gap(56);
  static const Gap kGap64 = Gap(64);

  /// sliver gap
  static const SliverGap kSliverGap8 = SliverGap(8);
  static const SliverGap kSliverGap16 = SliverGap(16);

  /// divider
  static const Divider kDivider = Divider(height: 1, thickness: 1);
  static const Divider kDivider2 = Divider(height: 2, thickness: 2);
  static const Divider kDividerPad16 = Divider(
    height: 1,
    indent: 16,
    endIndent: 16,
  );
  static const Divider kDividerLeft16 = Divider(
    indent: 16,
    height: 1,
    thickness: 1,
  );

  /// spacer
  static const Spacer kSpacer = Spacer();
  static const Spacer kSpacer2 = Spacer(flex: 2);

  /// padding
  static const EdgeInsets kPaddingAll2 = EdgeInsets.all(2);
  static const EdgeInsets kPaddingAll4 = EdgeInsets.all(4);
  static const EdgeInsets kPaddingAll6 = EdgeInsets.all(6);
  static const EdgeInsets kPaddingAll8 = EdgeInsets.all(8);
  static const EdgeInsets kPaddingAll10 = EdgeInsets.all(10);
  static const EdgeInsets kPaddingAll12 = EdgeInsets.all(12);
  static const EdgeInsets kPaddingAll13 = EdgeInsets.all(13);
  static const EdgeInsets kPaddingAll14 = EdgeInsets.all(14);
  static const EdgeInsets kPaddingAll16 = EdgeInsets.all(16);
  static const EdgeInsets kPaddingAll20 = EdgeInsets.all(20);
  static const EdgeInsets kPaddingAllB16 = EdgeInsets.fromLTRB(16, 16, 16, 0);
  static const EdgeInsets kPaddingAllT16 = EdgeInsets.fromLTRB(16, 0, 16, 16);
  static const EdgeInsets kPaddingAll24 = EdgeInsets.all(24);
  static const EdgeInsets kPaddingAll36 = EdgeInsets.all(36);
  static const EdgeInsets kPaddingAll48 = EdgeInsets.all(48);
  static const EdgeInsets kPaddingHor4 = EdgeInsets.symmetric(horizontal: 4);
  static const EdgeInsets kPaddingHor6 = EdgeInsets.symmetric(horizontal: 6);
  static const EdgeInsets kPaddingHor10 = EdgeInsets.symmetric(horizontal: 10);
  static const EdgeInsets kPaddingHor12 = EdgeInsets.symmetric(horizontal: 12);
  static const EdgeInsets kPaddingHor16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets kPaddingHor32 = EdgeInsets.symmetric(horizontal: 32);
  static const EdgeInsets kPaddingVer8 = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets kPaddingVer16 = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets kPaddingHor32Ver20 =
      EdgeInsets.symmetric(horizontal: 32, vertical: 20);
  static const EdgeInsets kPaddingHor16Ver12 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const EdgeInsets kPaddingHor16Ver4 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 4);
  static const EdgeInsets kPaddingHor16Ver8 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const EdgeInsets kPaddingHor16Ver10 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const EdgeInsets kPaddingHor12Ver10 =
      EdgeInsets.symmetric(horizontal: 12, vertical: 10);
  static const EdgeInsets kPaddingHor32Ver8 =
      EdgeInsets.symmetric(horizontal: 32, vertical: 8);
  static const EdgeInsets kPaddingHor12Ver8 =
      EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  static const EdgeInsets kPaddingHor10Ver8 =
      EdgeInsets.symmetric(horizontal: 10, vertical: 8);
  static const EdgeInsets kPaddingHor10Ver6 =
      EdgeInsets.symmetric(horizontal: 10, vertical: 6);
  static const EdgeInsets kPaddingHor8Ver4 =
      EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const EdgeInsets kPaddingHor8Ver2 =
      EdgeInsets.symmetric(horizontal: 8, vertical: 2);
  static const EdgeInsets kPaddingHor10Ver3 =
      EdgeInsets.symmetric(horizontal: 10, vertical: 3);
  static const EdgeInsets kPaddingLeft12Right6Ver8 =
      EdgeInsets.only(left: 12, right: 6, top: 8, bottom: 8);
  static const EdgeInsets kPaddingOnlyBottom4 = EdgeInsets.only(bottom: 8);

  /// border radius
  static const Radius kRadius = Radius.zero;
  static const Radius kRadius8 = Radius.circular(8);
  static const Radius kRadius12 = Radius.circular(12);
  static const BorderRadius kBorderRadius = BorderRadius.zero;
  static const BorderRadius kBorderRadius2 =
      BorderRadius.all(Radius.circular(2));
  static const BorderRadius kBorderRadius4 =
      BorderRadius.all(Radius.circular(4));
  static const BorderRadius kBorderRadius6 =
      BorderRadius.all(Radius.circular(6));
  static const BorderRadius kBorderRadius8 =
      BorderRadius.all(Radius.circular(8));
  static const BorderRadius kBorderRadius12 =
      BorderRadius.all(Radius.circular(12));
  static const BorderRadius kBorderRadius16 =
      BorderRadius.all(Radius.circular(16));
  static const BorderRadius kBorderTopRadius20 = BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  );
  static const BorderRadius kBorderTopRadius24 = BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );
  static const BorderRadius kBorderRadius24 =
      BorderRadius.all(Radius.circular(24));
  static const BorderRadius kBorderRadius48 =
      BorderRadius.all(Radius.circular(48));
  static const BorderRadius kBorderRadius64 =
      BorderRadius.all(Radius.circular(64));

  static const RoundedRectangleBorder kShapeZero = RoundedRectangleBorder();
  static const RoundedRectangleBorder kShapeTop8 = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8),
    ),
  );
  static const RoundedRectangleBorder kShapeTop16 = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
    ),
  );
  static const RoundedRectangleBorder kShapeBottom8 = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
  );
  static const RoundedRectangleBorder kShapeBottom16 = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(16),
      bottomRight: Radius.circular(16),
    ),
  );
  static const RoundedRectangleBorder kShapeAll8 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const RoundedRectangleBorder kShapeAll16 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );

  // static const kTabBarBoxDecoration = BoxDecoration(
  //   color: AppColors.bgGrey2,
  //   borderRadius: kBorderRadius8,
  // );
  // static const kTabBarBoxDecorationDark = BoxDecoration(
  //   color: ThemeColors.backgroundDark,
  //   borderRadius: kBorderRadius8,
  // );
  // static const kTabBoxDecoration = BoxDecoration(
  //   color: AppColors.white,
  //   borderRadius: kBorderRadius8,
  // );

  ///
  static const BoxConstraints kBoxConstraints24 = BoxConstraints.tightFor(
    width: 24,
    height: 24,
  );

  ///
  static const MaterialStatePropertyAll<Size> kStateAllHeight48 =
      MaterialStatePropertyAll<Size>(Size.fromHeight(48));

  static void showSnackBar(BuildContext context, String text) {
    final SnackBar snackBar = SnackBar(
      content: Text(text, style: const TextStyle(fontSize: 24)),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
