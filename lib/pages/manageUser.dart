import 'package:flutter/material.dart';
import 'package:rentbillingapp/dummydata.dart';

class ManageUser extends StatefulWidget {
  const ManageUser({super.key});

  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manage User",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: ListView.builder(
        itemCount: dummyRenters.length,
        itemBuilder: (ctx, index) {
          return Card(
              color: Theme.of(context).colorScheme.onSecondary,
              elevation: 10,
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dummyRenters[index].name),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(dummyRenters[index].phonenumber)
                      ],
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                        ),
                        onPressed: () {},
                      ),
                    )),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                  ],
                ),
              ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 80,
        height: 45,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/newuser');
          },
          backgroundColor: Colors.lightGreen[400],
          child: Text(
            "Add",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
