import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontroller/tv_bloc.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontroller/tv_state.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/screens/tv_detalies_screen.dart';
import 'package:cleanarcitecturemmoveapp/core/Api/api_constance.dart';
import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class PopularTvComponentes extends StatelessWidget {
  const PopularTvComponentes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      builder: (context, state) {
        return switch (state.popularTvState) {
          RequestState.Error => SizedBox(
              child: Text(state.popularTvMessage),
            ),
          RequestState.Loaded => FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularTv.length,
                  itemBuilder: (context, index) {
                    final tv = state.popularTv[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => TvDetailScreen(
                                id: tv.id,
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(tv.backdropPath),
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
