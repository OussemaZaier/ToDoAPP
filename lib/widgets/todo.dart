import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  final Color? color;
  const Todo({
    Key? key,
    @required this.color,
  }) : super(key: key);

  @override
  _TodoState createState() => _TodoState(color: color);
}

class _TodoState extends State<Todo> {
  final Color? color;
  _TodoState({@required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        child: ListTile(
          title: Text('name todo'),
          subtitle: Text('date todo'),
          trailing: Checkbox(
            value: true,
            onChanged: (value) {},
            activeColor: Colors.green,
          ),
        ),
        // Row(
        //   children: [
        //     Icon(
        //       Icons.today_outlined,
        //       size: 30,
        //       color: Colors.black26,
        //     ),
        //     SizedBox(
        //       width: 30,
        //     ),
        //     Text(
        //       'Todo',
        //       style: TextStyle(
        //         fontSize: 20,
        //         color: Colors.black54,
        //       ),
        //     ),
        //     Checkbox(
        //       value: true,
        //       onChanged: (value) {},
        //       activeColor: Colors.green,
        //     )
        //   ],
        // ),

        style: ElevatedButton.styleFrom(
            primary: color,
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
