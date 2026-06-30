import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/app_colors.dart';
import '../screens/widgets/dashboard_widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text(
                "Hey Alexandra07 🙌",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Ready to Crush Today’s Goal?",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromRGBO(177, 66, 115, 1),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/Mask group.png"),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tap To Claim",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Today’s Boost!",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Your Progress This Week",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProgrssContainer(
                      title: "Active Goals",
                      value: 10,
                      icon: SvgPicture.asset("assets/icons/Group (1).svg"),
                    ),
                    ProgrssContainer(
                      title: "Coins Earned",
                      value: 500,
                      icon: SvgPicture.asset("assets/icons/Group (2).svg"),
                    ),
                    ProgrssContainer(
                      title: "Badges",
                      value: 10,
                      icon: SvgPicture.asset("assets/icons/Group (3).svg"),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ongoing Bets",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SvgPicture.asset("assets/icons/arrow-right.svg"),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 14,
                  children: [OngoingCard(), OngoingCard()],
                ),
              ),

              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Community",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SvgPicture.asset("assets/icons/arrow-right.svg"),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CommunityContainer(
                      title: "Loss weight",
                      icon: SvgPicture.asset("assets/icons/Mask group.svg"),
                    ),
                    CommunityContainer(
                      title: "Lifting",
                      icon: SvgPicture.asset("assets/icons/Vector.svg"),
                    ),
                    CommunityContainer(
                      title: "Strength",
                      icon: SvgPicture.asset("assets/icons/Group (4).svg"),
                    ),
                    CommunityContainer(
                      title: "Cycling",
                      icon: SvgPicture.asset("assets/icons/Group (5).svg"),
                    ),
                    CommunityContainer(
                      title: "Running",
                      icon: Icon(Icons.star),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
