import 'package:flutter/material.dart';
import 'package:footballer/core/utils/utils.dart';
import 'package:footballer/features/football/domain/entities/match_entity.dart';

class MatchCard extends StatelessWidget {
  final Matches match;

  const MatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Utils.loadImage(match.competition!.emblem),
                  SizedBox(
                    height: 5,
                  ),
                  Text(Utils.formatToLocalTime(match.utcDate ?? ""))
                ],
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(match.competition!.name ?? ""),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              match.awayTeam!.crest ?? "",
                              height: 18,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(match.awayTeam!.name ?? "")
                          ],
                        ),
                        Text((match.score!.fullTime!.away ?? 0).toString())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              match.homeTeam!.crest ?? "",
                              height: 18,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(match.homeTeam!.name ?? "")
                          ],
                        ),
                        Text((match.score!.fullTime!.home ?? 0).toString())
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
