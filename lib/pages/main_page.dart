import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/renter.dart';
import '../widgets/detailedViewModal.dart';
import '../widgets/sidebar.dart';
import './new_user.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key, required this.userId});
  final String userId;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Renter> filteredUsers = [];
  List<Renter> _filteredUsers = [];
  late Future<List<Renter>> _loadState;
  late String _userId;
  final TextEditingController _currentreadingcontroller =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    _loadState = _getUsers();
    _userId = widget.userId.replaceAll('"', '');
  }

  Future<List<Renter>> _getUsers() async {
    final url = Uri.http(
      dotenv.env['URL'].toString(),
      '/api/homescreen',
    );
    final response = await http.get(url);
    final List<Renter> users;
    users = await (json.decode(response.body) as List)
        .map((i) => Renter.fromJson(i))
        .toList();

    for (final user in users) {
      if (user.landlordId.toString() == _userId) {
        filteredUsers.add(
          Renter(
            renterId: user.renterId,
            landlordId: user.landlordId,
            houseId: user.houseId,
            name: user.name,
            email: user.email,
            phonenumber: user.phonenumber,
            rent: user.rent,
            currentReading: user.currentReading,
            lastReading: user.lastReading,
            miscellaneous: user.miscellaneous,
            eBRate: user.eBRate,
          ),
        );
      }
    }
    setState(() {
      _filteredUsers = filteredUsers;
    });
    return filteredUsers;
  }

  billamount(currentReading, renterId, userId) async {
    final url = Uri.http(dotenv.env['Url'].toString(), '/api/generateBill');
    final response = await http.post(url,
        headers: {'Content-Type': 'appliction/json'},
        body: json.encode({
          "currentReading": currentReading,
          "renterId": renterId,
          "landlordId": userId,
        }));
  }

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
                  filteredUsers: filteredUsers,
                )),
          );
        },
      );
    }

    void _bill(BuildContext ctx, int index) {
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
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Bill",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
                        child: TextField(
                          controller: _currentreadingcontroller,
                          decoration: const InputDecoration(
                              hintText: ("Enter current Reading")),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: OutlinedButton(
                          onPressed: () {
                            billamount(_currentreadingcontroller.text,
                                filteredUsers[index].renterId, widget.userId);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                            side: BorderSide(
                              width: 1.0,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          child: const Text("Bill"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    Widget content = ListView.builder(
      itemCount: filteredUsers.length,
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
                            "https://cdn.pixabay.com/photo/2021/07/02/04/48/user-6380868_960_720.png"),
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
                                  filteredUsers[index].name,
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
                              filteredUsers[index].rent,
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
                                int.parse(filteredUsers[index].currentReading),
                                int.parse(filteredUsers[index].lastReading),
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
                                int.parse(filteredUsers[index].rent),
                                int.parse(filteredUsers[index].currentReading),
                                int.parse(filteredUsers[index].lastReading),
                                int.parse(filteredUsers[index].miscellaneous),
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
                                    onPressed: () {
                                      _bill(ctx, index);
                                    },
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

    if (filteredUsers.isEmpty) {
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

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'RentBillingApp',
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 26),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewUser(
                          userId: _userId,
                          filteredUsers: filteredUsers,
                        ),
                      ));
                },
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
        drawer: Sidebar(
          userId: _userId,
          filteredUsers: filteredUsers,
        ),
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        body: FutureBuilder(
            future: _loadState,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("No data ..."),
                );
              }

              return content;
            }));
  }
}
