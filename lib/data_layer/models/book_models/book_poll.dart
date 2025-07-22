class BookPoll {
   String status;

  BookPoll({required this.status});

  // Convert from JSON
  factory BookPoll.fromJson(Map<String, dynamic> json) {
    return BookPoll(
      status: json['status'],
    );
  }
}