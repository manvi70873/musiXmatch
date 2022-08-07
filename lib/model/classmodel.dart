
class Classmodel {
   Message? message;

  Classmodel({ this.message});

  Classmodel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is Map)
      this.message = (json["message"] == null ? null : Message.fromJson(json["message"]))!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.message != null)
      data["message"] = this.message!.toJson();
    return data;
  }
}

class Message {
  Header? header;
  Body? body;

  Message({ this.header,  this.body});

  Message.fromJson(Map<String, dynamic> json) {
    if(json["header"] is Map)
      this.header = json["header"] == null ? null : Header.fromJson(json["header"]);
    if(json["body"] is Map)
      this.body = json["body"] == null ? null : Body.fromJson(json["body"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.header != null)
      data["header"] = this.header!.toJson();
    if(this.body != null)
      data["body"] = this.body!.toJson();
    return data;
  }
}

class Body {
  List<TrackList>? trackList;

  Body({ this.trackList});

  Body.fromJson(Map<String, dynamic> json) {
    if(json["track_list"] is List)
      this.trackList = json["track_list"]==null ? null : (json["track_list"] as List).map((e)=>TrackList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.trackList != null)
      data["track_list"] = this.trackList!.map((e)=>e.toJson()).toList();
    return data;
  }
}

class TrackList {
  Track? track;

  TrackList({ this.track});

  TrackList.fromJson(Map<String, dynamic> json) {
    if(json["track"] is Map)
      this.track = json["track"] == null ? null : Track.fromJson(json["track"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.track != null)
      data["track"] = this.track!.toJson();
    return data;
  }
}

class Track {
  int? trackId;
  String? trackName;
  List<dynamic>? trackNameTranslationList;
  int? trackRating;
  int? commontrackId;
  int? instrumental;
  int? explicit;
  int? hasLyrics;
  int? hasSubtitles;
  int? hasRichsync;
  int? numFavourite;
  int? albumId;
  String? albumName;
  int? artistId;
  String? artistName;
  String? trackShareUrl;
  String? trackEditUrl;
  int? restricted;
  String? updatedTime;
  PrimaryGenres? primaryGenres;

  Track({ this.trackId,  this.trackName,  this.trackNameTranslationList,  this.trackRating,  this.commontrackId,  this.instrumental,  this.explicit,  this.hasLyrics,  this.hasSubtitles,  this.hasRichsync,  this.numFavourite,  this.albumId,  this.albumName,  this.artistId,  this.artistName,  this.trackShareUrl,  this.trackEditUrl,  this.restricted,  this.updatedTime,  this.primaryGenres});

  Track.fromJson(Map<String, dynamic> json) {
    if(json["track_id"] is int)
      this.trackId = json["track_id"];
    if(json["track_name"] is String)
      this.trackName = json["track_name"];
    if(json["track_name_translation_list"] is List)
      this.trackNameTranslationList = json["track_name_translation_list"] ?? [];
    if(json["track_rating"] is int)
      this.trackRating = json["track_rating"];
    if(json["commontrack_id"] is int)
      this.commontrackId = json["commontrack_id"];
    if(json["instrumental"] is int)
      this.instrumental = json["instrumental"];
    if(json["explicit"] is int)
      this.explicit = json["explicit"];
    if(json["has_lyrics"] is int)
      this.hasLyrics = json["has_lyrics"];
    if(json["has_subtitles"] is int)
      this.hasSubtitles = json["has_subtitles"];
    if(json["has_richsync"] is int)
      this.hasRichsync = json["has_richsync"];
    if(json["num_favourite"] is int)
      this.numFavourite = json["num_favourite"];
    if(json["album_id"] is int)
      this.albumId = json["album_id"];
    if(json["album_name"] is String)
      this.albumName = json["album_name"];
    if(json["artist_id"] is int)
      this.artistId = json["artist_id"];
    if(json["artist_name"] is String)
      this.artistName = json["artist_name"];
    if(json["track_share_url"] is String)
      this.trackShareUrl = json["track_share_url"];
    if(json["track_edit_url"] is String)
      this.trackEditUrl = json["track_edit_url"];
    if(json["restricted"] is int)
      this.restricted = json["restricted"];
    if(json["updated_time"] is String)
      this.updatedTime = json["updated_time"];
    if(json["primary_genres"] is Map)
      this.primaryGenres = json["primary_genres"] == null ? null : PrimaryGenres.fromJson(json["primary_genres"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["track_id"] = this.trackId;
    data["track_name"] = this.trackName;
    if(this.trackNameTranslationList != null)
      data["track_name_translation_list"] = this.trackNameTranslationList;
    data["track_rating"] = this.trackRating;
    data["commontrack_id"] = this.commontrackId;
    data["instrumental"] = this.instrumental;
    data["explicit"] = this.explicit;
    data["has_lyrics"] = this.hasLyrics;
    data["has_subtitles"] = this.hasSubtitles;
    data["has_richsync"] = this.hasRichsync;
    data["num_favourite"] = this.numFavourite;
    data["album_id"] = this.albumId;
    data["album_name"] = this.albumName;
    data["artist_id"] = this.artistId;
    data["artist_name"] = this.artistName;
    data["track_share_url"] = this.trackShareUrl;
    data["track_edit_url"] = this.trackEditUrl;
    data["restricted"] = this.restricted;
    data["updated_time"] = this.updatedTime;
    if(this.primaryGenres != null)
      data["primary_genres"] = this.primaryGenres!.toJson();
    return data;
  }
}

class PrimaryGenres {
  List<dynamic>? musicGenreList;

  PrimaryGenres({required this.musicGenreList});

  PrimaryGenres.fromJson(Map<String, dynamic> json) {
    if(json["music_genre_list"] is List)
      this.musicGenreList = json["music_genre_list"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.musicGenreList != null)
      data["music_genre_list"] = this.musicGenreList;
    return data;
  }
}

class Header {
  int? statusCode;
  double? executeTime;

  Header( {this.statusCode, this.executeTime});

  Header.fromJson(Map<String, dynamic> json) {
    if(json["status_code"] is int)
      this.statusCode = json["status_code"];
    if(json["execute_time"] is double)
      this.executeTime = json["execute_time"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status_code"] = this.statusCode;
    data["execute_time"] = this.executeTime;
    return data;
  }
}