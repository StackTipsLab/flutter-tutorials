import 'package:flutter/material.dart';

class CardViewExample extends StatefulWidget {
  const CardViewExample({super.key});

  @override
  State<CardViewExample> createState() {
    return CardViewExampleState();
  }
}

class CardViewExampleState extends State<CardViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: const Text('CardView',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            )),
      ),
      body: Card(
          elevation: 5,
          color: Colors.green.shade600,
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // side: BorderSide(color: Colors.green.shade800, width: 2),
          ),
          margin: const EdgeInsets.all(20),
          child: const Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            FadeInImage(
              fit: BoxFit.cover,
              height: 180,
              width: double.infinity,
              placeholder: AssetImage('assets/images/loading.gif'),
              image: NetworkImage('https://images.unsplash.com/photo-1556656793-08538906a9f8'),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Apple iPhone 14 Pro Max",
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Powerful A14 Bionic chip, 5G capability, and a stunning Super Retina XDR display.',
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        height: 1.3,
                        fontWeight: FontWeight.w500,
                      ))
                ],
              ),
            )
          ])),

      /* body: Card(
        color: Colors.green.shade600,
        margin: const EdgeInsets.all(20),

        child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Powerful A14 Bionic chip, 5G capability, and a stunning Super Retina XDR display.',
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ),
            ]
        ),
      ),*/
    );
  }
}
