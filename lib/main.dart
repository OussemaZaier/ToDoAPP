import 'package:flutter/material.dart';
import 'package:todo/screens/add.dart';

import 'package:todo/widgets/widgets.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context
            MaterialPageRoute(
              builder: (_) => AddToDo(),
            ),
          );
        },
        isExtended: true,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        icon: Icon(Icons.add),
        label: Text('Add'),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            expandedHeight: 100,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Remaining 3 todo\'s',
                style: TextStyle(fontSize: 13),
              ),
              centerTitle: true,
            ),
            title: Text(
              'ToDo',
              style: TextStyle(fontSize: 30),
            ),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: GestureDetector(
                    onLongPress: () {
                      print('hi');
                      final result = showModalActionSheet<String>(
                        context: context,
                        actions: [
                          const SheetAction(
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                          const SheetAction(
                            isDestructiveAction: true,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      );
                    },
                    child: Todo(
                      color: Colors.blue[100 * (index % 9 + 1)],
                    ),
                  ),
                );
              },
              childCount: 30, // list items
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}

// class BodyofApp extends StatefulWidget {
//   const BodyofApp({Key? key}) : super(key: key);

//   @override
//   _BodyofAppState createState() => _BodyofAppState();
// }

// class _BodyofAppState extends State<BodyofApp> {
//   List<SheetAction> actions1 = const [];
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           GestureDetector(
//             onLongPress: () {
//               print('hey');
//               final result = showModalActionSheet<String>(
//                 context: context,
//                 actions: [
//                   const SheetAction(
//                     icon: Icons.edit,
//                     label: 'Edit',
//                   ),
//                   const SheetAction(
//                     isDestructiveAction: true,
//                     icon: Icons.delete,
//                     label: 'Delete',
//                   ),
//                 ],
//               );
//               result.then((key) => print('hi'));
//               result.whenComplete(() => print('object'));
//               //if (result.toString() == 'ouss') {}
//               //print(result.toString());

//               // showConfirmationDialog(
//               //   context: context,
//               //   title: 'ouss',
//               //   okLabel: 'delete',
//               //   cancelLabel: 'no',
//               //   actions: [],
//               // );

//               // showModalActionSheet(
//               //   context: context,
//               //   title: 'ouss',
//               //   message: 'ssss',
//               //   cancelLabel: 'cancel',
//               //   actions: <SheetAction>[
//               //     SheetAction(
//               //       label: 'add',
//               //     ),
//               //   ],
//               //   isDismissible: true,
//               // );
//               //showOkAlertDialog(context: context, title: 'ouss');
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
