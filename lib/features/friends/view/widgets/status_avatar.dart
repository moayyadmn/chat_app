import 'package:flutter/material.dart';

class StatusAvatar extends StatelessWidget {
  const StatusAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Ahmad",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ));
          }),
    );
  }
}
