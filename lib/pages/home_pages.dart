import 'package:flutter/material.dart';
import 'package:galeria_fljutter/DATA/imagenes_data.dart';
import 'package:galeria_fljutter/pages/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* barra */
        appBar: AppBar(
          title: const Text('Galería de imágenes'),
          backgroundColor: Colors.black,
        ),
        /* vista cuadricula */

        body: GridView.extent(
          maxCrossAxisExtent: 150,
          /* ancho de elementos */
          padding: const EdgeInsets.all(4),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: _imagesList(context), /* array de widget */
        ));
  }

  List<Widget> _imagesList(BuildContext context) {
    List<Widget> imagesWidgetsList = [];
    /* recorrido el array de url  */
    for (var image in images) {
      imagesWidgetsList.add(GestureDetector(
        /* detecte gestos  */
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  /* crea una nueva pagina  */
                  builder: (context) => SecondPage(image: image)));
        },
        /* animacion de trasicion */
        child: Hero(tag: image, child: Image.network(image, fit: BoxFit.cover)),
      ));
    }

    return imagesWidgetsList;
  }
}
