import 'package:flutter/material.dart';

import 'movies.dart';

void main() =>
    (runApp(new MaterialApp(home: MovieListView(),)));


class MovieListView extends StatelessWidget {

  final List<Movies> movieList = Movies.getMovies();

  final List movies = [
            "Titanic", "Blade Runner", "Rambo", "The Avengers", "Avatar",
            "I am Legend", "300", "The Wolf of wall Street", " Interstellar", "Game of Thrones", "Viking",
            "Titanic", "Blade Runner", "Rambo", "The Avengers", "Avatar", "I am Legend", "300",
            "The Wolf of wall Street", " Interstellar", "Game of Thrones", "Viking",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade500,
      body: ListView.builder(
        itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index){
          return movieCard(movieList[index], context);
        // return Card(
        //   elevation: 4.5,
        //   color: Colors.white,
        //   child: ListTile(
        //     leading: CircleAvatar(
        //       child: Container(
        //         width: 200,
        //         height: 200,
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: NetworkImage(movieList[index].images[0]),
        //           ),
        //           borderRadius: BorderRadius.circular(13.9)
        //         ),
        //         child: null,
        //       ),
        //     ),
        //     trailing: Text("..."),
        //     title: Text(movieList[index].title),
        //     subtitle: Text("${movieList[0].title}"),
        //     onTap: () {
        //       Navigator.push(context,MaterialPageRoute(
        //           builder: (context) => MovieListViewDetails(
        //             movieName: movieList.elementAt(index).title,
        //           movie:movieList[index],)));
        //     },
        //   ),
        // );
      }),
    );
  }
  Widget movieCard(Movies movie, BuildContext context ){
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 54.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(movie.title),
                Text("Rating ${movie.imdbVotes}")
              ],
            ),
          ),
        ),
      ),
    );

  }
}
class MovieListViewDetails extends StatelessWidget {

  final String movieName;
  final Movies? movie;

  const MovieListViewDetails({super.key, required this.movieName,  this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("movies ${this.movieName}"),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text("Go Back ${this.movie}"),
            onPressed: (){
            Navigator.pop(context);
            }
          ),
        ),
      ),
    );
  }
}