import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/app_colors.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.primary,
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
          "Dashboard",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Spacer(),
        Image.asset("assets/images/Group 2.png"),
        SvgPicture.asset("assets/icons/Notification.svg"),
      ],
    );
  }
}

class ProgrssContainer extends StatelessWidget {
  final String title;
  final int value;
  final Widget icon;

  const ProgrssContainer({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(52, 32, 77, 1),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Text(title, style: TextStyle(fontSize: 14, color: Colors.white)),
          SizedBox(height: 5),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
          margin: EdgeInsets.all(10),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color.fromRGBO(255, 255, 255, 0.07),
          ),
          padding: EdgeInsets.all(10),
          child: icon,
        ),
        Text(title, style: TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }
}

class OngoingCard extends StatelessWidget {
  const OngoingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.primary,
                ),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/d466572777d96b636e6a6a316c6277802abc2091.png",
                    height: 35,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alex Watson",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Lost weight",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
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
              color: Color.fromRGBO(255, 255, 255, .1),
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
                        color: Color.fromRGBO(177, 66, 115, 1),
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
                        color: Color.fromRGBO(177, 66, 115, 1),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/iconoir_leaderboard-star.svg",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Slim Down Thighs",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "You’ve challenged yourself to lose 10 pounds this bet month. Based on your fitness data, Coach as Sandow AI predicts you have a 70% chance.",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
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
                    style: TextStyle(color: AppColors.textPrimary),
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
                    style: TextStyle(color: AppColors.textPrimary),
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
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromRGBO(39, 22, 67, 1),
      ),
      child: Text(
        title,
        style: TextStyle(color: AppColors.textPrimary, fontSize: 12),
      ),
    );
  }
}
