import 'package:flutter/material.dart';

import './detailedViewModal.dart';

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

    void _showUserDetails(BuildContext ctx, int index) {
      showDialog(
        context: ctx,
        builder: (ctx) {
          return Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 16,
                insetPadding: const EdgeInsets.fromLTRB(10, 10, 10, 40),
                backgroundColor: const Color.fromARGB(255, 240, 235, 235),
                child: DetailedViewModal(
                  index: index,
                )),
          );
        },
      );
    }

    Widget content = ListView.builder(
      itemCount: dummyRenters.length,
      itemBuilder: (ctx, index) => Container(
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
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 80,
                      width: 130,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://w0.peakpx.com/wallpaper/999/880/HD-wallpaper-eren-yeager-attack-on-titan-shingeki-no-kyojin-manga-mikasa-anime-levi.jpg"),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Name:",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 130,
                              constraints: const BoxConstraints(minWidth: 100),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  dummyRenters[index].name,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Rent  : ",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              dummyRenters[index].rent,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Units : ",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              _eBunits(
                                int.parse(dummyRenters[index].currentReading),
                                int.parse(dummyRenters[index].lastReading),
                              ).toString(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Total  :",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _totalAmount(
                                int.parse(dummyRenters[index].rent),
                                int.parse(dummyRenters[index].currentReading),
                                int.parse(dummyRenters[index].lastReading),
                                int.parse(dummyRenters[index].miscellaneous),
                                7,
                              ).toString(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 25, 5),
                                child: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        _showUserDetails(ctx, index);
                                      },
                                      style: const ButtonStyle(
                                        padding: MaterialStatePropertyAll(
                                          EdgeInsets.fromLTRB(2, 0, 10, 0),
                                        ),
                                      ),
                                      child: const Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 25,
                                            ),
                                          ),
                                          Text("More"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
