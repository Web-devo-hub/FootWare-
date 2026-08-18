import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool currentState = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 13),
            width: 23,
            height: 23,
            // color: Colors.red,
            decoration: BoxDecoration(
              // color: Colors.red,
              shape: BoxShape.circle,
              border: BoxBorder.all(width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.more_horiz, size: 15)],
            ),
          ),],
        backgroundColor: Colors.grey.shade50,
        leadingWidth: 200,
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Text(
            "My Cart",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsetsGeometry.all(20),
            height: 185,
            width: double.infinity,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(60),
                        image: DecorationImage(
                          image: AssetImage("assets/images.jpeg"),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 70,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit, color: Colors.white, size: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Andrew Ainsley",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text(
                  "+92 311 6189764",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(thickness: 0.5),
          ProfileListTile(
            leadingIcon: Icons.person_outline,
            title: "Edit Profile",
            endIcon: Icons.arrow_forward_ios_rounded,
          ),
          ProfileListTile(
            leadingIcon: Icons.location_on_outlined,
            title: "Address",
            endIcon: Icons.arrow_forward_ios_rounded,
          ),
          ProfileListTile(
            leadingIcon: Icons.notifications_none_sharp,
            title: "Notifications",
            endIcon: Icons.arrow_forward_ios_rounded,
          ),
          ProfileListTile(
            leadingIcon: Icons.account_balance_wallet_outlined,
            title: "Payment",
            endIcon: Icons.arrow_forward_ios_rounded,
          ),
          ProfileListTile(
            leadingIcon: Icons.system_security_update_good_outlined,
            title: "Security",
            endIcon: Icons.arrow_forward_ios_rounded,
          ),
          ProfileListTile(
            leadingIcon: Icons.language,
            title: "Language",
            endIcon: Icons.arrow_forward_ios_rounded,
            endIconText: "English(US)",
          ),
          CustomProfileListTile(
            leadingIcon: Icons.remove_red_eye_outlined,
            title: "Dark Mode",
            trailings: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  inactiveTrackColor: Colors.grey[100],
                  inactiveThumbColor: Colors.white,
                  activeTrackColor: Colors.grey,
                  activeThumbColor: Colors.black,
                  value: currentState,
                  onChanged: (state) {
                    currentState = state;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          ProfileListTile(
            leadingIcon: Icons.lock,
            title: "Privacy",
            endIcon: Icons.arrow_forward_ios_rounded,
          ),
          ProfileListTile(
            leadingIcon: Icons.help_center_outlined,
            title: "Help Center",
            endIcon: Icons.arrow_forward_ios_rounded,
          ),
          ProfileListTile(
            leadingIcon: Icons.people_outline,
            title: "Invite Friends",
            endIcon: Icons.arrow_forward_ios_rounded,
          ),
          ProfileListTile(leadingIcon: Icons.exit_to_app, title: "Logout ",textColor: Colors.red, iconColor: Colors.red,),
        ],
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.endIconText,
    this.endIcon, this.textColor, this.iconColor,
  });

  final IconData leadingIcon;
  final String title;
  final String? endIconText;
  final IconData? endIcon;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(

      minTileHeight: 35,
      leading: Icon(leadingIcon,color: iconColor??Colors.black,),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold,color: textColor??Colors.black)),

      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            endIconText ?? "",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            endIcon,
            color: Colors.black,
          ),
        ],
      ),

    );
  }
}

class CustomProfileListTile extends StatelessWidget {
  const CustomProfileListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.trailings,
  });

  final IconData leadingIcon;
  final String title;
  final Widget? trailings;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 35,
      leading: Icon(leadingIcon),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: trailings,
    );
  }
}
