import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/app_colors.dart';
import '../screens/widgets/dashboard_widgets.dart';
import '../../core/app_strings.dart';
import '../../core/controllers/user_controller.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardHeader(),
              SizedBox(height: 10),
              Obx(
                () => Text(
                  "Hey ${userCtrl.userFirstName.value} 🙌",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                AppStrings.readyToCrushTodayGoal,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: RadialGradient(
                    center: Alignment.centerLeft,
                    radius: 5,
                    colors: [AppColors.gradientStart, AppColors.gradientEnd],
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/Mask group.png"),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.tapToClaim,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          AppStrings.todaysBoost,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: AppColors.textPrimary),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                AppStrings.yourProgressThisWeek,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProgressContainer(
                      title: AppStrings.activeGoals,
                      value: 10,
                      icon: SvgPicture.asset("assets/icons/Group (1).svg"),
                    ),
                    ProgressContainer(
                      title: AppStrings.coinsEarned,
                      value: 500,
                      icon: SvgPicture.asset("assets/icons/Group (2).svg"),
                    ),
                    ProgressContainer(
                      title: AppStrings.badges,
                      value: 10,
                      icon: SvgPicture.asset("assets/icons/Group (3).svg"),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Frame(name: AppStrings.ongoingBets),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 14,
                  children: [OngoingCard(), OngoingCard()],
                ),
              ),

              SizedBox(height: 14),
              Frame(name: AppStrings.community),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CommunityContainer(
                      title: AppStrings.loseWeight,
                      icon: SvgPicture.asset("assets/icons/Mask group.svg"),
                    ),
                    CommunityContainer(
                      title: AppStrings.lifting,
                      icon: SvgPicture.asset("assets/icons/Vector.svg"),
                    ),
                    CommunityContainer(
                      title: AppStrings.strength,
                      icon: SvgPicture.asset("assets/icons/Group (4).svg"),
                    ),
                    CommunityContainer(
                      title: AppStrings.cycling,
                      icon: SvgPicture.asset("assets/icons/Group (5).svg"),
                    ),
                    CommunityContainer(
                      title: AppStrings.running,
                      icon: Icon(Icons.star),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          BottomBar(),
          Positioned(
            top: -26, // aligns FAB center with the notch curve
            child: CustomFAB(),
          ),
        ],
      ),
    );
  }
}
