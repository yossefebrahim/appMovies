import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cleanarcitecturemmoveapp/core/Api/api_constance.dart';
import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviecontroller/movie_block.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviecontroller/movie_state.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/screens/movie_detail_screen%20(2).dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingComponentes extends StatelessWidget {
  const NowPlayingComponentes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return switch (state.nowPlayingState) {
          RequestState.Error => SizedBox(
              child: Text(state.nowPlayingMessage),
            ),
          RequestState.Loaded => FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  viewportFraction: 1.0,
                ),
                items: state.nowPlayingMovies.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MovieDetailScreen(
                                    id: item.id,
                                  )),
                        );
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: 560.0,
                              imageUrl:
                                  ApiConstance.imageUrl(item.backdropPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 15,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 4.0,
                                      ),
                                      Text(
                                        "NOW PLAYING",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          RequestState.loading => const SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        };
      },
    );
  }
}
