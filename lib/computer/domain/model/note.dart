class Note {
  final String? id;
  final String? title;
  final String? pdfUrl;

  Note({
    required this.id,
    required this.pdfUrl,
    required this.title,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        pdfUrl: json['pdfurl'],
        title: json['title'],
      );
}


/* 
{
  "id": "sem1", 
  "title" :"DSA with Java", 
  "pdfUrl" : "myUrl.com" 
}




*/