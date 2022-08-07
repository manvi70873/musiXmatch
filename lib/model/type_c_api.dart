
class TypeCApi {
  Message? message;

  TypeCApi({this.message});

  TypeCApi.fromJson(Map<String, dynamic> json) {
    if(json["message"] is Map)
      this.message = json["message"] == null ? null : Message.fromJson(json["message"]);
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

  Message({this.header, this.body});

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
  Lyrics? lyrics;

  Body({this.lyrics});

  Body.fromJson(Map<String, dynamic> json) {
    if(json["lyrics"] is Map)
      this.lyrics = json["lyrics"] == null ? null : Lyrics.fromJson(json["lyrics"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.lyrics != null)
      data["lyrics"] = this.lyrics!.toJson();
    return data;
  }
}

class Lyrics {
  int? lyricsId;
  int? explicit;
  String? lyricsBody;
  String? scriptTrackingUrl;
  String? pixelTrackingUrl;
  String? lyricsCopyright;
  String? updatedTime;

  Lyrics({this.lyricsId, this.explicit, this.lyricsBody, this.scriptTrackingUrl, this.pixelTrackingUrl, this.lyricsCopyright, this.updatedTime});

  Lyrics.fromJson(Map<String, dynamic> json) {
    if(json["lyrics_id"] is int)
      this.lyricsId = json["lyrics_id"];
    if(json["explicit"] is int)
      this.explicit = json["explicit"];
    if(json["lyrics_body"] is String)
      this.lyricsBody = json["lyrics_body"];
    if(json["script_tracking_url"] is String)
      this.scriptTrackingUrl = json["script_tracking_url"];
    if(json["pixel_tracking_url"] is String)
      this.pixelTrackingUrl = json["pixel_tracking_url"];
    if(json["lyrics_copyright"] is String)
      this.lyricsCopyright = json["lyrics_copyright"];
    if(json["updated_time"] is String)
      this.updatedTime = json["updated_time"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["lyrics_id"] = this.lyricsId;
    data["explicit"] = this.explicit;
    data["lyrics_body"] = this.lyricsBody;
    data["script_tracking_url"] = this.scriptTrackingUrl;
    data["pixel_tracking_url"] = this.pixelTrackingUrl;
    data["lyrics_copyright"] = this.lyricsCopyright;
    data["updated_time"] = this.updatedTime;
    return data;
  }
}

class Header {
  int? statusCode;
  double? executeTime;

  Header({this.statusCode, this.executeTime});

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