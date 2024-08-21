import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarcitecturemmoveapp/core/Api/api_constance.dart';
import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';
import 'package:cleanarcitecturemmoveapp/core/servieslocator/servieslocator.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviecontroller/movie_block.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviecontroller/movie_event.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviecontroller/movie_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MainPopularScreen extends StatelessWidget {
  const MainPopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            sl<MovieBloc>()..add(GetPopularMoviesEvent()),
        child: Scaffold(
          backgroundColor: Color.fromARGB(115, 28, 28, 28),
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: const Text(
              "PopularMovies",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: const PopularScreen(),
        ));
  }
}

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      return switch (state.popularState) {
        // TODO: Handle this case.
        RequestState.Error => SizedBox(
            child: Text(state.popularMessage),
          ),
        // TODO: Handle this case.
        RequestState.Loaded => ListView.builder(
            itemCount: state.popularMovies.length,
            itemBuilder: (context, index) {
              final movie = state.popularMovies[index];
              return Container(
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: 190,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 170,
                      width: 120.0,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          height: 170,
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 140.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              movie.title,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    movie.releaseDate.split('-')[0],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      (movie.voteAverage / 2)
                                          .toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              movie.overview,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        // TODO: Handle this case.
        RequestState.loading => const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      };
    });
  }
}
