import "package:flutter/material.dart";

class Partials {
  static AppBar _buildAppBar() {
    return AppBar(
      elevation: 1.0,
      title: Text(
        'Brainbatu',
        style: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: Text(
              'Bal: \$500',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xff0CB058),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xffefefef),
          ),
        )
      ],
    );
  }
}
