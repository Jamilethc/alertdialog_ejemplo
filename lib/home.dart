import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ejempplo de AlertDialog"),
          content: Text("Este es un AlertDialog."),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Ejemplo de un SimpleDialog"),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Opcion 2"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Opcion 1"),
            ),
          ],
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Este es un ejemplo de BottomSheet."),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _showFormDialog(context);
                  },
                  child: Text("Abrir Formulario"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ejemplo de Formulario"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Porfavor Ingresa los Datos:"),
              SizedBox(height: 20),
              _buildForm(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildForm(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String name = '';
    String age = '';
    String address = '';

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            onChanged: (value) {
              name = value;
            },
            decoration: InputDecoration(
              labelText: 'Nombre',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Escribe el nombre';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            onChanged: (value) {
              age = value;
            },
            decoration: InputDecoration(
              labelText: 'Edad',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Esribe tu edad';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            onChanged: (value) {
              address = value;
            },
            decoration: InputDecoration(
              labelText: 'Direccion',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingresa tu direccion';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('Nombre: $name, Edad: $age, Direccion: $address');
                Navigator.of(context).pop();
              }
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejemplos de Dialogos "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _showAlertDialog(context);
                },
                child: Text("Mostrar AlertDialog"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _showSimpleDialog(context);
                },
                child: Text("Mostrar SimpleDialog"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _showBottomSheet(context);
                },
                child: Text("Mostrar BottomSheet"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _showFormDialog(context);
                },
                child: Text("Abrir formulario de Dialogo"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
