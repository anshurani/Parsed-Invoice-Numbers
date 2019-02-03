# README

Ruby on Rails application that allows the user to upload a text file of 7-segment invoice numbers, and outputs a list with the parsed invoice numbers


Input #1:

A text file containing several hundreds of invoice numbers in the following form:

      _  _     _  _  _  _  _  (line 1)
    | _| _||_||_ |_   ||_||_| (line 2)
    ||_  _|  | _||_|  ||_| _| (line 3)
                              (line 4)
      _  _  _  _  _  _     _  (line 5)
  |_||_|| ||_||_   |  |  ||_  (line 6)
    | _||_||_||_|  |  |  | _| (line 7)
                              (line 8)
Invoice number format:

1.Each invoice number is constructed of 9 digits [0..9]
2.Invoice number is written using _ and | characters.
3.Invoice number input takes 4 lines.
4.The first 3 lines contain 27 characters.
5.The fourth line is blank.


Output:

A text file with the parsed invoice numbers. One number per row.

Example:

  123456789
  490867715

 Input #2:

Example:


      _  _     _  _  _  _  _  (line 1)
    | _| _||_||_ |_   ||_||_| (line 2)
    ||_  _|  | _||_|  ||_| _| (line 3)
                              (line 4)
      _  _  _  _  _  _     _  (line 5)
  |_||_|| ||_||    |  |  ||_  (line 6)
    | _||_||_||_|  |     | _| (line 7)
                              (line 8)
Output:

Example:


  123456789
  4908?7?15 ILLEGAL
