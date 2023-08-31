import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveInSharedPreferences extends StatefulWidget {
  SaveInSharedPreferences({Key? key}) : super(key: key);

  @override
  _SaveInSharedPreferencesState createState() => _SaveInSharedPreferencesState();
}

class _SaveInSharedPreferencesState extends State<SaveInSharedPreferences> {

  late String  gName='', gLocation='', gAge='';
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  TextEditingController location = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save Objects in Shared Preferences'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Name'),
              controller: name,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Age'),
              controller: age,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Location'),
              controller: location,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('N', name.text.toString());
                      await prefs.setString('A', age.text.toString());
                      await prefs.setString('L', location.text.toString());
                      //****************************************************
                      final snackBar = SnackBar(
                        content: const Text('Saved..'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      print('Data saved');
                    },
                    child: const Text('Save'),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      setState(() {
                        gName = prefs.getString('N')??'';
                        gAge = prefs.getString('A')??'';
                        gLocation = prefs.getString('L')??'';

                      });
                      //**************************************************
                      final snakbar=SnackBar(content:  const Text('Data Loaded'),
                        action:SnackBarAction(label: 'undo', onPressed: (){


                        })


                      );
                      ScaffoldMessenger.of(context).showSnackBar(snakbar);
                    },
                    child: const Text('Load'),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.remove('N');
                      await prefs.remove('L');
                      await prefs.remove('A');
                      setState(() {
                        gName = '';
                        gLocation = '';
                        gAge = '';
                      });
                      final snakbar=SnackBar(content: const Text('Data Cleared'),
                      action: SnackBarAction(label: 'undo', onPressed: (){}),

                      );
                      ScaffoldMessenger.of(context).showSnackBar(snakbar);
                    },
                    child: const Text('Clear'),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text('Name: $gName', style: TextStyle(fontSize: 20)),
            const Spacer(),
            Text('Age: $gAge', style: TextStyle(fontSize: 20)),
            const Spacer(),
            Text('Location: $gLocation', style: TextStyle(fontSize: 20)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
