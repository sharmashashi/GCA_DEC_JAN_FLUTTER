

import 'package:meta/meta.dart';
import 'dart:convert';

class MovieDetails {
    MovieDetails({
        @required this.status,
        @required this.statusMessage,
        @required this.data,
        @required this.meta,
    });

    final String status;
    final String statusMessage;
    final Data data;
    final Meta meta;

    factory MovieDetails.fromJson(String str) => MovieDetails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MovieDetails.fromMap(Map<String, dynamic> json) => MovieDetails(
        status: json["status"],
        statusMessage: json["status_message"],
        data: Data.fromMap(json["data"]),
        meta: Meta.fromMap(json["@meta"]),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "status_message": statusMessage,
        "data": data.toMap(),
        "@meta": meta.toMap(),
    };
}

class Data {
    Data({
        @required this.movie,
    });

    final Movie movie;

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        movie: Movie.fromMap(json["movie"]),
    );

    Map<String, dynamic> toMap() => {
        "movie": movie.toMap(),
    };
}

class Movie {
    Movie({
        @required this.id,
        @required this.url,
        @required this.imdbCode,
        @required this.title,
        @required this.titleEnglish,
        @required this.titleLong,
        @required this.slug,
        @required this.year,
        @required this.rating,
        @required this.runtime,
        @required this.genres,
        @required this.downloadCount,
        @required this.likeCount,
        @required this.descriptionIntro,
        @required this.descriptionFull,
        @required this.ytTrailerCode,
        @required this.language,
        @required this.mpaRating,
        @required this.backgroundImage,
        @required this.backgroundImageOriginal,
        @required this.smallCoverImage,
        @required this.mediumCoverImage,
        @required this.largeCoverImage,
        @required this.cast,
        @required this.torrents,
        @required this.dateUploaded,
        @required this.dateUploadedUnix,
    });

    final int id;
    final String url;
    final String imdbCode;
    final String title;
    final String titleEnglish;
    final String titleLong;
    final String slug;
    final int year;
    final double rating;
    final int runtime;
    final List<String> genres;
    final int downloadCount;
    final int likeCount;
    final String descriptionIntro;
    final String descriptionFull;
    final String ytTrailerCode;
    final String language;
    final String mpaRating;
    final String backgroundImage;
    final String backgroundImageOriginal;
    final String smallCoverImage;
    final String mediumCoverImage;
    final String largeCoverImage;
    final List<Cast> cast;
    final List<Torrent> torrents;
    final DateTime dateUploaded;
    final int dateUploadedUnix;

    factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        id: json["id"],
        url: json["url"],
        imdbCode: json["imdb_code"],
        title: json["title"],
        titleEnglish: json["title_english"],
        titleLong: json["title_long"],
        slug: json["slug"],
        year: json["year"],
        rating: json["rating"].toDouble(),
        runtime: json["runtime"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        downloadCount: json["download_count"],
        likeCount: json["like_count"],
        descriptionIntro: json["description_intro"],
        descriptionFull: json["description_full"],
        ytTrailerCode: json["yt_trailer_code"],
        language: json["language"],
        mpaRating: json["mpa_rating"],
        backgroundImage: json["background_image"],
        backgroundImageOriginal: json["background_image_original"],
        smallCoverImage: json["small_cover_image"],
        mediumCoverImage: json["medium_cover_image"],
        largeCoverImage: json["large_cover_image"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        torrents: List<Torrent>.from(json["torrents"].map((x) => Torrent.fromMap(x))),
        dateUploaded: DateTime.parse(json["date_uploaded"]),
        dateUploadedUnix: json["date_uploaded_unix"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
        "imdb_code": imdbCode,
        "title": title,
        "title_english": titleEnglish,
        "title_long": titleLong,
        "slug": slug,
        "year": year,
        "rating": rating,
        "runtime": runtime,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "download_count": downloadCount,
        "like_count": likeCount,
        "description_intro": descriptionIntro,
        "description_full": descriptionFull,
        "yt_trailer_code": ytTrailerCode,
        "language": language,
        "mpa_rating": mpaRating,
        "background_image": backgroundImage,
        "background_image_original": backgroundImageOriginal,
        "small_cover_image": smallCoverImage,
        "medium_cover_image": mediumCoverImage,
        "large_cover_image": largeCoverImage,
        "cast": List<dynamic>.from(cast.map((x) => x.toMap())),
        "torrents": List<dynamic>.from(torrents.map((x) => x.toMap())),
        "date_uploaded": dateUploaded.toIso8601String(),
        "date_uploaded_unix": dateUploadedUnix,
    };
}

class Cast {
    Cast({
        @required this.name,
        @required this.characterName,
        @required this.urlSmallImage,
        @required this.imdbCode,
    });

    final String name;
    final String characterName;
    final String urlSmallImage;
    final String imdbCode;

    factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        name: json["name"],
        characterName: json["character_name"],
        urlSmallImage: json["url_small_image"],
        imdbCode: json["imdb_code"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "character_name": characterName,
        "url_small_image": urlSmallImage,
        "imdb_code": imdbCode,
    };
}

class Torrent {
    Torrent({
        @required this.url,
        @required this.hash,
        @required this.quality,
        @required this.type,
        @required this.seeds,
        @required this.peers,
        @required this.size,
        @required this.sizeBytes,
        @required this.dateUploaded,
        @required this.dateUploadedUnix,
    });

    final String url;
    final String hash;
    final String quality;
    final String type;
    final int seeds;
    final int peers;
    final String size;
    final int sizeBytes;
    final DateTime dateUploaded;
    final int dateUploadedUnix;

    factory Torrent.fromJson(String str) => Torrent.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Torrent.fromMap(Map<String, dynamic> json) => Torrent(
        url: json["url"],
        hash: json["hash"],
        quality: json["quality"],
        type: json["type"],
        seeds: json["seeds"],
        peers: json["peers"],
        size: json["size"],
        sizeBytes: json["size_bytes"],
        dateUploaded: DateTime.parse(json["date_uploaded"]),
        dateUploadedUnix: json["date_uploaded_unix"],
    );

    Map<String, dynamic> toMap() => {
        "url": url,
        "hash": hash,
        "quality": quality,
        "type": type,
        "seeds": seeds,
        "peers": peers,
        "size": size,
        "size_bytes": sizeBytes,
        "date_uploaded": dateUploaded.toIso8601String(),
        "date_uploaded_unix": dateUploadedUnix,
    };
}

class Meta {
    Meta({
        @required this.serverTime,
        @required this.serverTimezone,
        @required this.apiVersion,
        @required this.executionTime,
    });

    final int serverTime;
    final String serverTimezone;
    final int apiVersion;
    final String executionTime;

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        serverTime: json["server_time"],
        serverTimezone: json["server_timezone"],
        apiVersion: json["api_version"],
        executionTime: json["execution_time"],
    );

    Map<String, dynamic> toMap() => {
        "server_time": serverTime,
        "server_timezone": serverTimezone,
        "api_version": apiVersion,
        "execution_time": executionTime,
    };
}
