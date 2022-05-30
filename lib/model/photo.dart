class Photo {
  int? id;
  int? sol;
  String? imgSrc;
  String? earthDate;

  Photo({
    this.id,
    this.sol,
    this.imgSrc,
    this.earthDate,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sol = json['sol'];
    imgSrc = json['img_src'];
    earthDate = json['earth_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sol'] = this.sol;
    data['img_src'] = this.imgSrc;
    data['earth_date'] = this.earthDate;
    return data;
  }

  @override
  String toString() {
    return 'Photo(id: $id, sol: $sol, imgSrc: $imgSrc, earthDate: $earthDate)';
  }
}
