import 'package:flutter/material.dart';

import './sidebar_item.dart';
import '../pages/manageUser.dart';
import '../models/renter.dart';

class Sidebar extends StatelessWidget {
  final userId;
  final List<Renter> filteredUsers;
  const Sidebar({
    super.key,
    required this.userId,
    required this.filteredUsers,
  });
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // padding: EdgeInsets.all(5),
        children: <Widget>[
          DrawerHeader(
            margin: const EdgeInsets.fromLTRB(2, 2, 10, 2),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://w0.peakpx.com/wallpaper/999/880/HD-wallpaper-eren-yeager-attack-on-titan-shingeki-no-kyojin-manga-mikasa-anime-levi.jpg"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(minWidth: 140),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "ANAND",
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 32, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      leading:
                          const Icon(Icons.settings_input_component_rounded),
                      minLeadingWidth: 5,
                      horizontalTitleGap: 5,
                      minVerticalPadding: 0,
                      title: SidebarItem(
                        title: 'Manage People',
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => ManageUser(
                                    userId: userId,
                                    filteredUsers: filteredUsers,
                                  )),
                            ),
                          );
                        },
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout_outlined),
                      minLeadingWidth: 5,
                      horizontalTitleGap: 5,
                      minVerticalPadding: 0,
                      title: SidebarItem(
                        title: 'Log Out',
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (Route<dynamic> route) => false);
                        },
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

  void handleMenuItemTap(BuildContext context, String title) {
    // Implement your logic here for handling the sidebar item tap
    print('Tapped on: $title');
    Navigator.pop(context);
  }
}
