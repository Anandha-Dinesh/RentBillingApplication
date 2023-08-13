import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rentbillingapp/pages/new_user.dart';
import '../models/renter.dart';

class ManageUser extends StatefulWidget {
  ManageUser({
    super.key,
    required this.userId,
    required this.filteredUsers,
  });
  final String userId;
  late List<Renter> filteredUsers;

  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  void _deleteUser(userId, renterId) async {
    final url = Uri.http(dotenv.env['URL'].toString(), '/api/deleteUser');
    try {
      final response = await http.post(
        url,
        headers: {'Content-type': 'application/json'},
        body: json.encode(
          {
            "landlordId": userId,
            "renterId": renterId,
          },
        ),
      );
      if (response.statusCode == 200) {
        widget.filteredUsers
            .removeWhere((element) => element.renterId == renterId);
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ManageUser(
                userId: widget.userId, filteredUsers: widget.filteredUsers),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

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
        itemCount: widget.filteredUsers.length,
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
                        Text(widget.filteredUsers[index].name),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(widget.filteredUsers[index].phonenumber)
                      ],
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                        ),
                        onPressed: () {
                          _deleteUser(widget.userId,
                              widget.filteredUsers[index].renterId);
                        },
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
          child: InkWell(
              child: Text(
                "Add",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewUser(
                          userId: widget.userId,
                          filteredUsers: widget.filteredUsers),
                    ));
              }),
        ),
      ),
    );
  }
}
