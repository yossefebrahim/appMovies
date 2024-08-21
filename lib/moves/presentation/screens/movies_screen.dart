import 'package:cleanarcitecturemmoveapp/core/servieslocator/servieslocator.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/componentes/nowplaying_componentes.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/componentes/popular_componentes.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/componentes/toprated_componentes.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviecontroller/movie_block.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviecontroller/movie_event.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/screens/popular_screen_movie.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/screens/toprated_screen_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MovieBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          // key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponentes(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const MainPopularScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'See More',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularComponentes(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const MainTopRatedScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'See More',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 16.0, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedComponentes(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
