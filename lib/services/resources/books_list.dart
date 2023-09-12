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
      Books("Beginning App Development with Flutter", "Rap Payne", "2010", "Create Cross Platform Mobile Apps", "Rs 800", "imgs/books/img1.jpg"),
      Books("Harry Potter gfdg sgfsg fgd1", "J.K. Rowling", "2001", "lorem ipsum", "Rs. 1200", "imgs/books/img2.jpg"),
      Books("Harry Potter 2", "J.K. Rowling", "2002", "lorem ipsum", "Rs. 1300", "imgs/books/img3.jpg"),
      Books("Game of Thrones", "George R.R. Martin", "2003", "lorem ipsum", "Rs. 1600", "imgs/books/img4.jpg"),
      Books("House of Daragon", "J.K. Rowling", "2003", "lorem ipsum", "Rs. 1600", "imgs/books/img15.jpg"),
      Books("Harry Potter 3", "J.K. Rowling", "2003", "lorem ipsum", "Rs. 1600", "imgs/books/img7.jpg"),
      Books("Harry Potter 3", "J.K. Rowling", "2003", "lorem ipsum", "Rs. 1600", "imgs/books/img8.jpg"),
    ];
}