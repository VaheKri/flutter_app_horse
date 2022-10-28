
import 'package:flutter/material.dart';
import 'Mango/MangoDB.dart';

class registerHorse extends StatefulWidget {
  const registerHorse({Key? key}) : super(key: key);

  @override
  State<registerHorse> createState() => _registerHorseState();
}

class _registerHorseState extends State<registerHorse> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _race = TextEditingController();
  final _age = TextEditingController();
  final _robe = TextEditingController();
  final _sexe = TextEditingController();
  final _url = TextEditingController();
  final _specialite = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD A HORSE'),
      ),
      key: _formKey,
      body: Center(
      child: Column(
      children: <Widget>[
      TextFormField(
      controller: _name,
      decoration: const InputDecoration(
        icon: Icon(Icons.pets_sharp),
        hintText: 'Entrez son nom',
        labelText: 'Nom',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    ),
    TextFormField(
    controller: _race,
    decoration: const InputDecoration(
    icon: Icon(Icons.add),
    hintText: 'race',
    labelText: 'race',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter some text';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _age,
    decoration: const InputDecoration(
    icon: Icon(Icons.cake),
    hintText: 'Entrez son age',
    labelText: 'Age',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter some text';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _robe,
    decoration: const InputDecoration(
    icon: Icon(Icons.star),
    hintText: 'Entrez sa robe',
    labelText: 'robe',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter some text';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _url,
    decoration: const InputDecoration(
    icon: Icon(Icons.image),
    hintText: 'Entrez un URL',
    labelText: 'URL',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter some text';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _specialite,
    decoration: const InputDecoration(
    icon: Icon(Icons.pets),
    hintText: 'spécialité',
    labelText: 'spécialité',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter some text';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _sexe,
    decoration: const InputDecoration(
    icon: Icon(Icons.male),
    hintText: 'SEXE',
    labelText: 'SEXE',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter some text';
    }
    return null;
    },
    ),
    Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: ElevatedButton(
    onPressed: () {
    MangoDatabase.registerHose(
    _name.text,
    _race.text,
    _age.text,
    _robe.text,
    _url.text,
    _specialite.text,
    _sexe.text,
    MangoDatabase.OnlineUser.id

    );
    },
    child: const Text('Submit'),
    ),
    ),
    ],
    ),
    ),
    );
    }
    }