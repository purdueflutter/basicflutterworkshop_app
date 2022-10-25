import 'package:flutter/material.dart';

import '../theme.dart';

class NewClassButton extends StatelessWidget {
  const NewClassButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: darkBlueColor,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Add a Class",
                  style: TextStyle(
                    color: lightColor,
                    fontSize: 20,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.add,
                  color: lightColor,
                  size: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
