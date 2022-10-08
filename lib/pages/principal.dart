import 'package:actividad3/pages/detalle.dart';
import 'package:flutter/material.dart';
import 'package:actividad3/themes/colores.dart';
import 'package:actividad3/json/animalitos.dart';
import 'package:page_transition/page_transition.dart';

//CLASE DINAMICA
class principal extends StatefulWidget {
  principal({Key? key}) : super(key: key);

  @override
  State<principal> createState() => _principalState();
}

class _principalState extends State<principal> {
  var menuactivo = 0;
  var menuactivo2 = 0;
  @override
  Widget build(BuildContext context) {
    //CONTENIDO DE LA APP
    return Scaffold(
      //NUESTRA PANTALLA COLOR PRIMARIO
      backgroundColor: primario,
      appBar: barraApp(),
      body: Contenido(),
    );
  }

  //METODO - BARRA APP
  barraApp() {
    return AppBar(
      backgroundColor: purpura,
      elevation: 10,
      //LO ENVOLVEMOS EN UN PADDING
      title: Padding(
        //margen
        padding: const EdgeInsets.only(left: 10, right: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //titulo
          Text(
            "App Animales",
            //estilo del texto
            style: TextStyle(
                fontSize: 20, color: primario, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }

  Widget Contenido() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, top: 25),
              child: Row(
                  children: List.generate(animalitos.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 25, right: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        menuactivo = index;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          animalitos[index]['title'],
                          style: TextStyle(
                              fontSize: 22,
                              color: menuactivo == index ? purpura : negro,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        //OPERADOR TERNARIO SI EL MENUACTIVO ES IGUAL
                        //ENTONCES MARCAR EL ELEMENTO
                        menuactivo == index
                            ? Container(
                                width: 10,
                                height: 3,
                                decoration: BoxDecoration(
                                    color: purpura,
                                    borderRadius: BorderRadius.circular(5)),
                              )
                            //SINO MOSTRAR VACIO
                            : Container(),
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Detalles()
        ],
      ),
    );
  }

  Widget Detalles() {
    return IndexedStack(index: menuactivo, children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: List.generate(Mamiferos.length, (index) {
              return Padding(
                //ESTABLECEMOS MARGENES PARA NUESTROS CARDVIEWS
                padding: const EdgeInsets.only(right: 30),
                child: GestureDetector(
                  onTap: () {
                    //LE ENVIAMOS LA RUTA,
                    // INICIO - PARA DIRIGIRNOS AL SIGUIENTE PANTALLA
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: detalle(animalitos: Mamiferos[index]),
                            type: PageTransitionType.scale));
                    // FIN - PARA DIRIGIRNOS AL SIGUIENTE PANTALLA
                  },
                  //CONTIENE EL ALBUM DE CANCIONES - IMAGENES
                  child: Column(
                    children: [
                      Container(
                        //DIMENSIONES Y TAMAÑO
                        width: 180,
                        height: 180,
                        //AJUSTES DE COLORES Y FORMA
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Mamiferos[index]['img']),
                                fit: BoxFit.cover),
                            color: negro,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //titulo de canciones o album
                      Text(
                        Mamiferos[index]['title'],
                        style: TextStyle(
                            color: celeste,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: List.generate(Felinos.length, (index) {
              return Padding(
                //ESTABLECEMOS MARGENES PARA NUESTROS CARDVIEWS
                padding: const EdgeInsets.only(right: 30),
                child: GestureDetector(
                  onTap: () {
                    //LE ENVIAMOS LA RUTA,
                    // INICIO - PARA DIRIGIRNOS AL SIGUIENTE PANTALLA
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: detalle(animalitos: Felinos[index]),
                            type: PageTransitionType.scale));
                    // FIN - PARA DIRIGIRNOS AL SIGUIENTE PANTALLA
                  },
                  //CONTIENE EL ALBUM DE CANCIONES - IMAGENES
                  child: Column(
                    children: [
                      Container(
                        //DIMENSIONES Y TAMAÑO
                        width: 180,
                        height: 180,
                        //AJUSTES DE COLORES Y FORMA
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Felinos[index]['img']),
                                fit: BoxFit.cover),
                            color: negro,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //titulo de canciones o album
                      Text(
                        Felinos[index]['title'],
                        style: TextStyle(
                            color: celeste,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: List.generate(Acuaticos.length, (index) {
              return Padding(
                //ESTABLECEMOS MARGENES PARA NUESTROS CARDVIEWS
                padding: const EdgeInsets.only(right: 30),
                child: GestureDetector(
                  onTap: () {
                    //LE ENVIAMOS LA RUTA,
                    // INICIO - PARA DIRIGIRNOS AL SIGUIENTE PANTALLA
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: detalle(animalitos: Acuaticos[index]),
                            type: PageTransitionType.scale));
                    // FIN - PARA DIRIGIRNOS AL SIGUIENTE PANTALLA
                  },
                  //CONTIENE EL ALBUM DE CANCIONES - IMAGENES
                  child: Column(
                    children: [
                      Container(
                        //DIMENSIONES Y TAMAÑO
                        width: 180,
                        height: 180,
                        //AJUSTES DE COLORES Y FORMA
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Acuaticos[index]['img']),
                                fit: BoxFit.cover),
                            color: negro,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //titulo de canciones o album
                      Text(
                        Acuaticos[index]['title'],
                        style: TextStyle(
                            color: celeste,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    ]);
  }
}
