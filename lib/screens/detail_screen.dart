import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api.service.dart';

import '../models/webtoon_detail.dart';
import 'episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences pref;
  bool isLike = false;
  Future initPrefs() async {
    pref = await SharedPreferences.getInstance(); //사용자 저장소에 Connaction
    final likeToons = pref.getStringList('likeToons');
    if (likeToons != null) {
      if (likeToons.contains(widget.id) == true) {
        setState(() {
          isLike = true;
        });
      }
    } else {
      await pref.setStringList('likeToons', []);
    }
  }

  onHeartTap() async {
    final likeToons = pref.getStringList('likeToons');
    if (likeToons != null) {
      if (isLike) {
        likeToons.remove(widget.id);
      } else {
        likeToons.add(widget.id);
      }
      await pref.setStringList('likeToons', likeToons);
      setState(() {
        isLike = !isLike;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        foregroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(
              isLike ? Icons.favorite : Icons.favorite_outline,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 50,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      //그림 떠다니기
                      tag: widget.id,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15, //그림자 얼마나 멀리 그릴건지
                              offset: const Offset(10, 10), //위치
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                        width: 250,
                        child: Image.network(widget.thumb),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                FutureBuilder(
                  future: webtoon,
                  builder: (context, snapshot) {
                    //widget리턴
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${snapshot.data!.genre}/${snapshot.data!.age}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      );
                    }
                    return const Text("...");
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                FutureBuilder(
                  future: episodes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          for (var episode in snapshot.data!)
                            Episode(episode: episode, webtoon_id: widget.id),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
