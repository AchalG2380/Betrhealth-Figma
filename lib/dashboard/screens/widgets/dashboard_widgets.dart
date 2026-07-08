import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_strings.dart';
import '../../../core/controllers/user_controller.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 43,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.secondary,
          ),
          child: ClipOval(
            child: Image.asset(
              "assets/images/d466572777d96b636e6a6a316c6277802abc2091.png",
              height: 41,
            ),
          ),
        ),
        Spacer(),
        Text(
          AppStrings.dashboard,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.secondary,
          ),
          child: Row(
            children: [
              Image.asset("assets/images/Group 2.png"),
              Text(
                AppStrings.points,
                style: TextStyle(color: AppColors.textPrimary, fontSize: 14),
              ),
            ],
          ),
        ),
        SvgPicture.asset("assets/icons/Notification.svg"),
      ],
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: CustomPaint(
              painter: _NotchedBarPainter(),
              child: SizedBox(
                height: 75,
                child: Row(
                  children: [
                    // Left side — equal half
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildNavItem(
                            icon: SvgPicture.asset(
                              "assets/icons/hugeicons_home-08.svg",
                            ),
                            label: AppStrings.home,
                            color: AppColors.primary,
                          ),
                          _buildNavItem(
                            icon: SvgPicture.asset(
                              "assets/icons/Group (1).svg",
                              colorFilter: ColorFilter.mode(
                                AppColors.textGrey,
                                BlendMode.srcIn,
                              ),
                            ),
                            label: AppStrings.goals,
                            color: AppColors.textGrey,
                          ),
                        ],
                      ),
                    ),

                    // Center gap for FAB
                    const SizedBox(width: 30),

                    // Right side — equal half
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildNavItem(
                            icon: SvgPicture.asset(
                              "assets/icons/fluent_broad-activity-feed-16-regular.svg",
                            ),
                            label: AppStrings.feed,
                            color: AppColors.textGrey,
                          ),
                          _buildNavItem(
                            icon: SvgPicture.asset(
                              "assets/icons/Group (6).svg",
                            ),
                            label: AppStrings.settings,
                            color: AppColors.textGrey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String label,
    required Widget icon,
    required color,
  }) {
    return Column(
      children: [
        SizedBox(height: 18),
        icon,
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

/// Custom painter that draws a rounded rectangle with a circular notch at the top center.
class _NotchedBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double fabRadius = 35; // FAB is 60px wide
    final double notchGap = 30; // space between FAB edge and notch edge
    final double notchRadius = fabRadius + notchGap; // 38px — tight fit
    final double notchDepth = fabRadius + 0; // how deep the notch dips (34px)
    final double barRadius = 20; // corner radius of the bar
    final double centerX = size.width / 2;

    final Path path = Path();

    // Start from top-left corner
    path.moveTo(0, barRadius);
    // Top-left rounded corner
    path.quadraticBezierTo(0, 0, barRadius, 0);

    // Line to left edge of notch
    final double notchLeft = centerX - notchRadius;
    path.lineTo(notchLeft, 0);

    // Smooth S-curve down into the notch (left side)
    path.cubicTo(
      centerX - notchRadius * 0.6,
      0, // control point 1 (horizontal pull)
      centerX - fabRadius * 0.9,
      notchDepth, // control point 2 (pull toward bottom)
      centerX,
      notchDepth, // end at bottom center of notch
    );

    // Smooth S-curve back up out of the notch (right side)
    path.cubicTo(
      centerX + fabRadius * 0.9,
      notchDepth, // control point 1
      centerX + notchRadius * 0.6,
      0, // control point 2
      centerX + notchRadius,
      0, // end at right edge of notch
    );

    // Line to top-right corner
    path.lineTo(size.width - barRadius, 0);
    // Top-right rounded corner
    path.quadraticBezierTo(size.width, 0, size.width, barRadius);

    // Right side down
    path.lineTo(size.width, size.height - barRadius);
    // Bottom-right rounded corner
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - barRadius,
      size.height,
    );

    // Bottom side
    path.lineTo(barRadius, size.height);
    // Bottom-left rounded corner
    path.quadraticBezierTo(0, size.height, 0, size.height - barRadius);

    // Left side back to start
    path.close();

    // Draw shadow
    canvas.drawShadow(path, AppColors.black.withValues(alpha: 0.3), 8, true);

    // Fill the bar
    final Paint paint = Paint()..color = AppColors.textPrimary;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: FloatingActionButton(
        onPressed: () {},
        elevation: 4,
        backgroundColor: Colors.transparent,
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            gradient: RadialGradient(
              center: Alignment.centerLeft,
              radius: 1.1,
              colors: [AppColors.gradientStart, AppColors.gradientEnd],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x665B2D8E),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(14),
            child: SvgPicture.asset("assets/icons/Vector (1).svg"),
          ),
        ),
      ),
    );
  }
}

class ProgressContainer extends StatelessWidget {
  final String title;
  final int value;
  final Widget icon;

  const ProgressContainer({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.textPrimary.withValues(alpha: .04),
      ),
      padding: EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          icon,
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class CommunityContainer extends StatelessWidget {
  final String title;
  final Widget icon;
  const CommunityContainer({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.textPrimary.withValues(alpha: .09),
              width: 2,
            ),
            color: AppColors.textPrimary.withValues(alpha: .04),
          ),
          padding: EdgeInsets.all(12),
          child: icon,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class OngoingCard extends StatelessWidget {
  const OngoingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();
    return Container(
      width: 370,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.textPrimary.withValues(alpha: .04),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 37,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.textSecondary.withValues(alpha: .03),
                ),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/d466572777d96b636e6a6a316c6277802abc2091.png",
                    height: 35,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      userCtrl.userName.value,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    AppStrings.loseWeight,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.textPrimary.withValues(alpha: .04),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: RadialGradient(
                          center: Alignment.centerLeft,
                          radius: 6,
                          colors: [
                            AppColors.gradientStart,
                            AppColors.gradientEnd,
                          ],
                        ),
                      ),
                      child: Text(
                        "Predicted Success Odds 60%",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: RadialGradient(
                          center: Alignment.centerLeft,
                          radius: 1,
                          colors: [
                            AppColors.gradientStart,
                            AppColors.gradientEnd,
                          ],
                        ),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/iconoir_leaderboard-star.svg",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  AppStrings.slimDownThighs,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "You’ve challenged yourself to lose 10 pounds this bet month. Based on your fitness data, Coach as Sandow AI predicts you have a 70% chance.",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    TitleContainer(title: "1 Month Bet Old"),
                    TitleContainer(title: "Daily Steps 8000"),
                    TitleContainer(title: "Feeling : Great"),
                    TitleContainer(title: "Wager : 10c"),
                    TitleContainer(title: "Target Value : 3kg"),
                    TitleContainer(title: "Lose Weight : 10kg Chance"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.buttonOrange,
                  ),
                  child: Text(
                    "Place Bet",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.buttonBlue,
                  ),
                  child: Text(
                    "Bet Against",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TitleContainer extends StatelessWidget {
  final String title;
  const TitleContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: AppColors.primary,
      ),
      child: Text(
        title,
        style: TextStyle(color: AppColors.textPrimary, fontSize: 12),
      ),
    );
  }
}

class Frame extends StatelessWidget {
  final String name;

  const Frame({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.textPrimary.withValues(alpha: .08),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SvgPicture.asset("assets/icons/arrow-right.svg"),
        ),
      ],
    );
  }
}
