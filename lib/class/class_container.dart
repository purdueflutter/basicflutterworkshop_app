import 'package:flutter/material.dart';

import '../theme.dart';

class ClassContainer extends StatelessWidget {
  final String subject;
  final String date;

  const ClassContainer({
    Key? key,
    required this.subject,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width * 8,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: pinkColor.withOpacity(0.4),
                offset: Offset(10, 10),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: pinkColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    date,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text(
                      subject,
                      style: TextStyle(
                        fontSize: 18,
                        color: darkBlueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
