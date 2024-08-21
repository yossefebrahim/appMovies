import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/genres_tv_detalies.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontrollerdetalies/tv_detalies_bloc.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontrollerdetalies/tv_detalies_event.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontrollerdetalies/tv_detalies_state.dart';
import 'package:cleanarcitecturemmoveapp/core/Api/api_constance.dart';
import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';
import 'package:cleanarcitecturemmoveapp/core/servieslocator/servieslocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class TvDetailScreen extends StatelessWidget {
  final int id;

  const TvDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<TvDetaliesBloc>()
        ..add(GetTvDetaliesEvent(id))
        ..add(GetTvDetaliesRecomandationEvent(id)),
      lazy: false,
      child: Scaffold(
        body: TvDetailContent(),
      ),
    );
  }
}

class TvDetailContent extends StatelessWidget {
  const TvDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetaliesBloc, TvDetaliesState>(
      builder: (context, state) {
        return switch (state.tvDetaliesState) {
          RequestState.Error => SizedBox(
              height: 250,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          RequestState.Loaded => CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
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
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: ApiConstanceTv.imageUrl(
                              state.tvDetalies!.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.tvDetalies!.name,
                              style: GoogleFonts.poppins(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              )),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  state.tvDetalies!.airData.split('-')[0],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    (state.tvDetalies!.voteAverage / 2)
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    '(${state.tvDetalies!.voteAverage})',
                                    style: const TextStyle(
                                      fontSize: 1.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16.0),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            state.tvDetalies!.overview,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Genres: ${_showTvGenres(state.tvDetalies!.genrestv)}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        'More like this'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: _showTvRecommendations(),
                ),
              ],
            ),
          RequestState.loading => SizedBox(
              child: Text(state.tvDetaliesMessage),
            ),
        };
      },
    );
  }

  String _showTvGenres(List<GenresTv> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  Widget _showTvRecommendations() {
    return BlocBuilder<TvDetaliesBloc, TvDetaliesState>(
      builder: (context, state) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final tvrecommendation = state.tvrecomandation[index];
              return FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  child: CachedNetworkImage(
                    imageUrl:
                        ApiConstanceTv.imageUrl(tvrecommendation.backdropPath),
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
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            childCount: state.tvrecomandation.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.7,
            crossAxisCount: 3,
          ),
        );
      },
    );
  }
}
