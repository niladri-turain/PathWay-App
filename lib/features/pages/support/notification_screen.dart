import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_size.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
            color: AppColors.white,
            fontSize: AppSize.height(0.022),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Mark all as read button
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                right: AppSize.width(0.05),
                top: AppSize.height(0.02),
                bottom: AppSize.height(0.01),
              ),
              child: Text(
                "Mark all as read",
                style: TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.height(0.016),
                ),
              ),
            ),
          ),

          // Notifications List
          Expanded(
            child: ListView(
              children: [
                _buildNotificationItem(
                  icon: Icons.notifications,
                  iconColor: Colors.green,
                  title: "Your enquiry has been answered.",
                  subtitle: "Amity University",
                  time: "2 min ago",
                  isUnread: true,
                ),
                _buildNotificationItem(
                  icon: Icons.book,
                  iconColor: Colors.blue,
                  title: "New course available for MBA",
                  subtitle: "LPU, Punjab",
                  time: "1 hour ago",
                  isUnread: true,
                ),
                _buildNotificationItem(
                  icon: Icons.school,
                  iconColor: Colors.red,
                  title: "Admission open for BCA",
                  subtitle: "Chandigarh University",
                  time: "3 hours ago",
                  isUnread: false,
                ),
                _buildNotificationItem(
                  icon: Icons.assignment,
                  iconColor: Colors.orange,
                  title: "Reminder: Your enquiry is pending",
                  subtitle: "Manipal University",
                  time: "Yesterday",
                  isUnread: false,
                ),
                _buildNotificationItem(
                  icon: Icons.card_membership,
                  iconColor: Colors.indigo,
                  title: "Upcoming Scholarship Test",
                  subtitle: "Apply now and get benefits.",
                  time: "2 days ago",
                  isUnread: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.width(0.05),
        vertical: AppSize.height(0.015),
      ),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular Icon
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: AppSize.height(0.025)),
              ),
              SizedBox(width: AppSize.width(0.04)),

              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: AppSize.height(0.018),
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: AppSize.height(0.004)),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: AppSize.height(0.015),
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: AppSize.height(0.004)),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: AppSize.height(0.014),
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),

              // Status Indicator
              if (isUnread)
                Container(
                  margin: EdgeInsets.only(top: AppSize.height(0.01)),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                )
              else
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey[400],
                  size: AppSize.height(0.025),
                ),
            ],
          ),
          SizedBox(height: AppSize.height(0.015)),
          Divider(height: 1, thickness: 1, color: Colors.grey[200]),
        ],
      ),
    );
  }
}
