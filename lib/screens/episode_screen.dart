import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Episode {
  final String name;
  final String airDate;
  final String episodeCode;

  Episode(this.name, this.airDate, this.episodeCode);
}
final List<Episode> episodes = [
  Episode("Пилот", "2 декабря 2013", "S01E01"),
  Episode("Собаки-разрушители", "9 декабря 2013", "S01E02"),
  Episode("Анатомический парк", "16 декабря 2013", "S01E03"),
  Episode("Мистер Жвачка", "13 января 2014", "S01E04"),
];


class EpisodesList extends StatelessWidget {
  final List<Episode> episodes;

  const EpisodesList({super.key, required this.episodes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        final episode = episodes[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xfff0B1E2D),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              episode.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${episode.airDate}",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Код эпизода: ${episode.episodeCode}",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

