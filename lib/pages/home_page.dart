import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final Map<String, List<String>> shoppingList = {
  'Fruttivendolo': ['Mele', 'Pere', 'Banane', 'Ananas'],
  'Panificio': ['Panini', 'Pizza', 'Focaccia'],
  'Macelleria': ['Braciole', 'Salsicce', 'Arrosticini'],
};

class HomePage extends StatefulWidget{
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _ShoppingList();
  
}


class _ShoppingList extends State<HomePage> {
  
  // da questo ci prendiamo l'input dell'utente
  TextEditingController controller = TextEditingController();


  @override
  void initState(){
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }


  // questa è la funzione che verrà chiamata alla pressione del pulsante

  void _showAddListDialog(BuildContext context) {
    showDialog(
      //funzione base per lanciare un alertDialog
      context: context,
      builder: (context) {
        return AlertDialog(
          //questo è il widget di alert dialog che ha le seguenti proprietà
          title: Text("Nuova lista"),
          content: TextField(
            controller: controller, //assegnamo il controller
            decoration: InputDecoration(
              //creiamo il placeholder della casella di testo
              hintText: "Inserisci qui il nome della nuova lista",
            ),
          ),
          actions: [
            //mettiamo le azioni disponibili nel dialog (il tasto crea o annulla)
            TextButton(
              //creiamo il tasto per tornare indietro
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Annulla"),
            ),
            TextButton(
              // creiamo il tasto per confermare
              onPressed: () {
                final String newListName = controller.text.trim();
                if (newListName.isNotEmpty) {
                  shoppingList[newListName] =
                      []; // creiamo nella map shopping list una nuova chiave alla quale associamo per ora come valore una lista vuota
                  print("Aggiunta nuova lista: $newListName");
                  setState((){
                    shoppingList [newListName] = [];
                  });
                }
                Navigator.pop(context);
              },
              child: Text("Aggiungi"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddListDialog(
              context
            );
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: shoppingList.length,
          itemBuilder: (context, index) {
            String category = shoppingList.keys.elementAt(index);
            List<String> items = shoppingList[category] ?? [];
            int num = items.length;
            return ListTile(
              leading: Icon(Icons.accessible_forward_rounded),
              title: Text(category),
              subtitle: Text('items: $num'),
              trailing: Icon(Icons.arrow_right_sharp),
              onTap: (){
                context.push(
                  '/detail',
                  extra: {
                    'title' : category,
                    'items': items,
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
