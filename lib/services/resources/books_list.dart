class Books{
String bookName;
String author;
String publishedIn;
String description;
String price;
var image;

Books(this.bookName, this.author, this.publishedIn, this.description, this.price, this.image);

static List<Books> getBookDetails() =>
    [
      Books("Beginning App Development with Flutter", "Rap Payne", "2010", "Create Cross Platform Mobile Apps", "Rs 800", "assets/images/img1.jpg"),
      Books("Harry Potter gfdg sgfsg fgd1", "J.K. Rowling", "2001", "lorem ipsum", "Rs. 1200", "assets/images/img2.jpg"),
      Books("Harry Potter 2", "J.K. Rowling", "2002", "lorem ipsum", "Rs. 1300", "assets/images/img3.jpg"),
      Books("Game of Thrones", "George R.R. Martin", "2003", "lorem ipsum", "Rs. 1600", "assets/images/img4.jpg"),
      Books("House of Daragon", "J.K. Rowling", "2003", "lorem ipsum", "Rs. 1600", "assets/images/img15.jpg"),
      Books("Harry Potter 3", "J.K. Rowling", "2003", "lorem ipsum", "Rs. 1600", "assets/images/img7.jpg"),
      Books("Harry Potter 3", "J.K. Rowling", "2003", "lorem ipsum", "Rs. 1600", "assets/images/img8.jpg"),
    ];
}