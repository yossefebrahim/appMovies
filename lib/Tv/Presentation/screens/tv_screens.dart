import 'package:cleanarcitecturemmoveapp/Tv/Presentation/componentes/ontheair_componentes.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/componentes/popular_tv_componentes.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/componentes/toprated_tv_componentes.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontroller/tv_bloc.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontroller/tv_event.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/screens/popular_tv_screen.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/screens/toprated_tv_screen.dart';
import 'package:cleanarcitecturemmoveapp/core/servieslocator/servieslocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTvScreen extends StatelessWidget {
  const MainTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<TvBloc>()
        ..add(GetOnTheAirTvEvent())
        ..add(GetPopularTvEvent())
        ..add(GetTopRatesTvEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          // key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OnTheAirComponentes(),
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
                                const MainPopularTvScreen(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
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
              const PopularTvComponentes(),
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
                                const MainTopRatedTvScreen(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
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
              const TopRatedTvComponentes(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
