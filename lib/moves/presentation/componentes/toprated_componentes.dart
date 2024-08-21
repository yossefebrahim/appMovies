import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarcitecturemmoveapp/core/Api/api_constance.dart';
import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviecontroller/movie_block.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviecontroller/movie_state.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/screens/movie_detail_screen%20(2).dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedComponentes extends StatelessWidget {
  const TopRatedComponentes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return switch (state.topratedState) {
          RequestState.Error => SizedBox(
              child: Text(state.topratedMessage),
            ),
          RequestState.Loaded => FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topratedMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.topratedMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MovieDetailScreen(
                                      id: movie.id,
                                    )),
                          );
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
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
                    );
                  },
                ),
              ),
            ),
          RequestState.loading => const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        };
      },
    );
  }
}
