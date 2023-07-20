import 'package:flutter/material.dart';
import '../dummydata.dart';

class DetailedViewModal extends StatefulWidget {
  const DetailedViewModal({super.key, required this.index});
  final int index;

  @override
  State<DetailedViewModal> createState() => _DetailedViewModalState();
}

class _DetailedViewModalState extends State<DetailedViewModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        children: <Widget>[
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Detailed View',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("Name :"),
                    const Text("Phone :"),
                    const Text("EB rate :"),
                    const Text("Extras :"),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        side: BorderSide(
                          width: 1.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: const Text("Edit"),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 130,
                      constraints: const BoxConstraints(minWidth: 100),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          dummyRenters[widget.index].name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    Text(dummyRenters[widget.index].phonenumber),
                    Text(dummyRenters[widget.index].eBRate),
                    Text(dummyRenters[widget.index].miscellaneous),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  Theme.of(context).colorScheme.primary,
                              side: BorderSide(
                                width: 1.0,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            child: const Text("Save"),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
