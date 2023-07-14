import 'package:flutter/material.dart';

import '../dummydata.dart';

class Renters extends StatelessWidget {
  const Renters({super.key});
  @override
  Widget build(BuildContext context) {
    int _totalAmount(int rent, int currentReading, int lastReading,
        int miscellaneous, int amountPerUnit) {
      int totalAmount = ((currentReading - lastReading) * amountPerUnit) +
          rent +
          miscellaneous;
      return totalAmount;
    }

    int _eBunits(int currentReading, int lastReading) {
      int units = currentReading - lastReading;
      return units;
    }

    Widget content = ListView.builder(
      itemCount: dummyRenters.length,
      itemBuilder: (ctx, index) => InkWell(
        onTap: () {},
        child: Container(
          child: Container(
            padding: const EdgeInsets.all(10),

            constraints: const BoxConstraints(
              maxHeight: 180,
            ),
            //color: Colors.amber,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              elevation: 8,
              color: Colors.amber,
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 80,
                          width: 130,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://w0.peakpx.com/wallpaper/999/880/HD-wallpaper-eren-yeager-attack-on-titan-shingeki-no-kyojin-manga-mikasa-anime-levi.jpg"),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  "Name:",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  "Rent : ",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  "Units : ",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  "Total :",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const SizedBox(height: 10),
                                Container(
                                  constraints:
                                      const BoxConstraints(minWidth: 140),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      dummyRenters[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Text(
                                  dummyRenters[index].rent,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  _eBunits(
                                    int.parse(
                                        dummyRenters[index].currentReading),
                                    int.parse(dummyRenters[index].lastReading),
                                  ).toString(),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  _totalAmount(
                                    int.parse(dummyRenters[index].rent),
                                    int.parse(
                                        dummyRenters[index].currentReading),
                                    int.parse(dummyRenters[index].lastReading),
                                    int.parse(
                                        dummyRenters[index].miscellaneous),
                                    7,
                                  ).toString(),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 5),
                      child: InkWell(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Bill"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (dummyRenters.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("No renters added... "),
            SizedBox(
              height: 20,
            ),
            Text("Try adding renters"),
          ],
        ),
      );
    }
    return content;
  }
}
