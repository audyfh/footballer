import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footballer/core/common/widgets/loader.dart';
import 'package:footballer/core/utils/show_snackbar.dart';
import 'package:footballer/features/football/domain/entities/match_entity.dart';
import 'package:footballer/features/football/presentation/home/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Matches> matches = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(GetTodayMatches());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Footballer"),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            showSnackbar(context, state.message);
           
          } else if (state is HomeSuccess) {
            matches.addAll(state.matches);
           
          }
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Loader();
          }
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text("Ini Home page"),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    final match = matches[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                            '${match.homeTeam?.name} vs ${match.awayTeam?.name}'),
                        subtitle: Text('Tanggal: ${match.utcDate}'),
                        trailing: Text(match.status ?? ''),
                      ),
                    );
                  },itemCount: matches.length,),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
