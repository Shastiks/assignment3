import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Fruit { apple, banana }

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Nepal';
  var items = [
    'Nepal',
    'America',
    'Australia',
    'Japan',
    'Canada',
  ];
  Fruit? _fruit = Fruit.apple;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Travel Options'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.train),
            ),
            Tab(
              icon: Icon(Icons.flight),
            ),
            Tab(
              icon: Icon(Icons.bus_alert),
            )
          ]),
        ),
        body: TabBarView(children: [
          const ListTile(
            // leading: Icon(Icons.handshake),
            trailing: Icon(Icons.heat_pump),
            title: Text('Welcome'),
            subtitle: Text('What would you like to do ?'),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SelectableText('Write down your opinion'),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 200,
                  child: TextField(
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Copy text here',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  color: Color.fromARGB(255, 118, 156, 242),
                  child: DropdownButton(
                    value: dropdownValue,
                    focusColor: Colors.red,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
                RadioListTile<Fruit>(
                  title: const Text('First Class'),
                  value: Fruit.apple,
                  groupValue: _fruit,
                  onChanged: (Fruit? value) {
                    setState(() {
                      _fruit = value;
                    });
                  },
                ),
                RadioListTile<Fruit>(
                  title: const Text('Normal Class'),
                  value: Fruit.banana,
                  groupValue: _fruit,
                  onChanged: (Fruit? value) {
                    setState(() {
                      _fruit = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: _showAlertDialog, child: const Text('Submit')),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Thank',
                    style: TextStyle(
                        color: Color.fromARGB(255, 188, 108, 241),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'You',
                          style: TextStyle(color: Color.fromARGB(255, 246, 125, 234), fontSize: 16)),
                      TextSpan(
                          text: 'Shastika',
                          style: TextStyle(
                              color: Color.fromARGB(255, 100, 182, 241),
                              fontSize: 28,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ],
            ),
          ),
          DataTable(columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('First Name')),
            DataColumn(label: Text('Last Name'))
          ], rows: const [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Shastika')),
              DataCell(Text('Regmi'))
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Barun')),
              DataCell(Text('Sharma'))
            ]),
            DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('Prajwol')),
              DataCell(Text('Pradhan'))
            ]),
            DataRow(cells: [
              DataCell(Text('4')),
              DataCell(Text('Prerana')),
              DataCell(Text('Mali'))
            ]),
            DataRow(cells: [
              DataCell(Text('5')),
              DataCell(Text('Babin')),
              DataCell(Text('Dangol'))
            ]),
            DataRow(cells: [
              DataCell(Text('6')),
              DataCell(Text('Sgar')),
              DataCell(Text('Koju'))
            ])
          ])
        ]),
        drawer: Drawer(
            child: ListView(
          children: [
            const DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color.fromARGB(217, 30, 223, 244)),
                  accountName: Text('Shastika Regmi'),
                  accountEmail: Text('shas.regm@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(173, 124, 230, 18),
                    child: Text("S"),
                  ),
                  currentAccountPictureSize: Size.square(50),
                )),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                "Profile",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.newspaper),
              title: const Text(
                "News",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(
                "Bookings",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                "Settings",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )),
      ),
    );
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap buttonto close the alert box
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content:  SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want to submit the text?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}