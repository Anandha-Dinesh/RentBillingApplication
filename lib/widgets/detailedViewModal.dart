import 'package:flutter/material.dart';
import '../models/renter.dart';

class DetailedViewModal extends StatefulWidget {
  const DetailedViewModal(
      {super.key, required this.index, required this.filteredUsers});
  final int index;
  final List<Renter> filteredUsers;

  @override
  State<DetailedViewModal> createState() => _DetailedViewModalState();
}

class _DetailedViewModalState extends State<DetailedViewModal> {
  @override
  Widget build(BuildContext context) {
    bool isEdit = false;
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
                        setState(() {
                          isEdit = true;
                        });
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
                          widget.filteredUsers[widget.index].name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    Text(widget.filteredUsers[widget.index].phonenumber),
                    Text(widget.filteredUsers[widget.index].eBRate.toString()),
                    Text(widget.filteredUsers[widget.index].miscellaneous
                        .toString()),
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
