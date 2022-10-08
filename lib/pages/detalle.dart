import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:actividad3/json/animalitos.dart';
import 'package:actividad3/themes/colores.dart';
import 'package:audioplayers/audioplayers.dart';

class detalle extends StatefulWidget {
  const detalle({Key? key, this.animalitos}) : super(key: key);
//Esta variable se usara para mostrar cada una de las canciones
  final dynamic animalitos;

  @override
  State<detalle> createState() => _detalleState();
}

class _detalleState extends State<detalle> {
  //variables para reproduccion de sonido
  final audioplayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setAudio();
    //play
    audioplayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    //duration
    audioplayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //position
    audioplayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    CargarAudio();
  }

  @override
  void dispose() {
    audioplayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primario,
      body: Contenido(),
    );
  }

  Widget Contenido() {
    //Variable tamanio, que recibe la data a traves
    //de la MediaQuery.Of
    var tamanio = MediaQuery.of(context).size;
    List audiosAnimals = widget.animalitos['songs'];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.animalitos['img'],
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              widget.animalitos['title'],
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w600, color: purpura),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.animalitos['desc'],
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, color: negro),
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioplayer.seek(position);

                //optional
                await audioplayer.resume();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)),
                  Text(formatTime(duration)),
                ],
              ),
            ),
            CircleAvatar(
              radius: 35,
              child: IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 50,
                onPressed: () async {
                  if (isPlaying) {
                    await audioplayer.pause();
                  } else {
                    audioplayer.resume();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  CargarAudio() async {
    final player = AudioCache(prefix: 'assets/');
    final url = await player.load(widget.animalitos['song_url']);
    audioplayer.setSourceUrl(url.path);
  }
}
