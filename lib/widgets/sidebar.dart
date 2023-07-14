import 'package:flutter/material.dart';
import 'package:rentbillingapp/dummydata.dart';
import './sidebar_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // padding: EdgeInsets.all(5),
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.fromLTRB(2, 2, 10, 2),
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
                child: ListTile(
                  leading: Icon(Icons.settings_input_component_rounded),
                  minLeadingWidth: 5,
                  horizontalTitleGap: 5,
                  minVerticalPadding: 0,
                  title: SidebarItem(
                    title: 'Configurations',
                    onTap: () {
                      handleMenuItemTap(context, 'Lets Configure Settings');
                    },
                  ),
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
 // child: Row(
              //   children: [
              //     // Container(
              //     //   height: 90,
              //     //   width: 90,
              //     //   // decoration: BoxDecoration(
              //     //   //   border: Border.all(color: Colors.black),
              //     //   // ),
              //     //   child: const CircleAvatar(
              //     //     backgroundColor: Colors.grey,
              //     //     backgroundImage: NetworkImage(
              //     //         "https://w0.peakpx.com/wallpaper/999/880/HD-wallpaper-eren-yeager-attack-on-titan-shingeki-no-kyojin-manga-mikasa-anime-levi.jpg"),
              //     //   ),
              //     // ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.stretch,
              //       children: [
              //         Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "Name",
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodyMedium!
              //                   .copyWith(fontSize: 18),
              //             ),
              //             // Text(
              //             //   "email",
              //             //   style: Theme.of(context)
              //             //       .textTheme
              //             //       .bodyMedium!
              //             //       .copyWith(fontSize: 18),
              //             // ),
              //             Text(
              //               "Houses",
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodyMedium!
              //                   .copyWith(fontSize: 18),
              //             ),
              //             Text(
              //               "Next Bill",
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodyMedium!
              //                   .copyWith(fontSize: 18),
              //             ),
              //           ],
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Text(
              //               "ANAND",
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodySmall!
              //                   .copyWith(fontSize: 16),
              //             ),
              //             // Text(
              //             //   "ananddineesh481@gmail.com",
              //             //   style: Theme.of(context).textTheme.bodySmall,
              //             // ),
              //             // Text(
              //             //   "7010663257",
              //             //   style: Theme.of(context).textTheme.bodySmall,
              //             // ),
              //             Text(
              //               "32",
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodySmall!
              //                   .copyWith(fontSize: 16),
              //             ),
              //             Container(
              //               width: 100,
              //               child: Text(
              //                 "House.no : 404 in 4 days",
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .bodySmall!
              //                     .copyWith(fontSize: 16),
              //                 maxLines: 2,
              //               ),
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //   ],
              // ),