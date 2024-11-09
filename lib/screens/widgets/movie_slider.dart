import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:movie_app/screens/movie_details.dart';

class MovieSlider extends StatelessWidget {
  final List<dynamic> topRatedMovies;
  const MovieSlider({super.key, required this.topRatedMovies});

  @override
  Widget build(BuildContext context) {
    return slider.CarouselSlider.builder(
        itemCount: topRatedMovies.length,
        itemBuilder: (context, index, realIndex) {
          final movie = topRatedMovies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieDetails(movie: movie)));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie['backdrop_path']}',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        options: slider.CarouselOptions(
            height: 250,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            enableInfiniteScroll: true,
            pageSnapping: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8));
  }
}
