CREATE DATABASE library_db;
GO

USE library_db;
GO

-- TABLE 1: Books
CREATE TABLE books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    publisher VARCHAR(100),
    quantity INT DEFAULT 1
);

-- TABLE 2: Members
CREATE TABLE members (
    member_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15)
);

-- TABLE 3: Transactions
CREATE TABLE transactions (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    issue_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);


USE library_db;


INSERT INTO books (title, author, publisher, quantity) VALUES ('Python Crash Course', 'Eric Matthes', 'No Starch Press', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Automate the Boring Stuff with Python', 'Al Sweigart', 'No Starch Press', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Learning Python', 'Mark Lutz', 'O’Reilly Media', 8);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Fluent Python', 'Luciano Ramalho', 'O’Reilly Media', 7);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Effective Python', 'Brett Slatkin', 'Pearson', 5);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Python Cookbook', 'Brian K. Jones', 'O’Reilly Media', 6);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Programming Python', 'Mark Lutz', 'O’Reilly Media', 4);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Python for Data Analysis', 'Wes McKinney', 'O’Reilly Media', 9);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Think Python', 'Allen Downey', 'Green Tea Press', 5);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Python Tricks', 'Dan Bader', 'DB Publications', 6);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Head First Python', 'Paul Barry', 'O’Reilly Media', 7);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Python Programming', 'John Zelle', 'Franklin Beedle', 6);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Core Python Programming', 'Wesley Chun', 'Prentice Hall', 5);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Beginning Python', 'James Payne', 'Wiley', 4);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Python in a Nutshell', 'Alex Martelli', 'O’Reilly Media', 6);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Expert Python Programming', 'Michał Jaworski', 'Packt', 8);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Introduction to Python', 'Kenneth A. Lambert', 'Cengage', 5);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Python Pocket Reference', 'Mark Lutz', 'O’Reilly Media', 5);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Python Machine Learning', 'Sebastian Raschka', 'Packt', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Python Deep Learning', 'Ivan Vasilev', 'Packt', 7);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Python Data Science Handbook', 'Jake VanderPlas', 'O’Reilly Media', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Data Science from Scratch', 'Joel Grus', 'O’Reilly Media', 8);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Effective Pandas', 'Boris Paskhaver', 'Leanpub', 5);
INSERT INTO books (title, author, publisher, quantity) VALUES ('NumPy Beginner’s Guide', 'Ivan Idris', 'Packt', 6);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Mastering NumPy', 'Rick van Hattem', 'Packt', 5);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Mastering Pandas', 'Femi Anthony', 'Packt', 4);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Introduction to Machine Learning with Python', 'Andreas Müller', 'O’Reilly Media', 9);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Deep Learning with Python', 'François Chollet', 'Manning', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Python for Finance', 'Yves Hilpisch', 'O’Reilly Media', 5);

INSERT INTO books (title, author, publisher, quantity) VALUES ('Java: The Complete Reference', 'Herbert Schildt', 'McGraw Hill', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Effective Java', 'Joshua Bloch', 'Addison-Wesley', 9);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Head First Java', 'Kathy Sierra', 'O’Reilly', 7);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Core Java Volume I', 'Cay S. Horstmann', 'Prentice Hall', 8);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Java Concurrency in Practice', 'Brian Goetz', 'Addison-Wesley', 6);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Beginning Java Programming', 'Bart Baesens', 'Wiley', 5);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Java Performance', 'Charlie Hunt', 'Addison-Wesley', 5);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Think Java', 'Allen Downey', 'O’Reilly', 6);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Clean Code', 'Robert C. Martin', 'Prentice Hall', 12);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Clean Architecture', 'Robert C. Martin', 'Prentice Hall', 8);

INSERT INTO books (title, author, publisher, quantity) VALUES ('C Programming Language', 'Kernighan & Ritchie', 'Prentice Hall', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Head First C', 'David Griffiths', 'O’Reilly', 7);
INSERT INTO books (title, author, publisher, quantity) VALUES ('C Programming: A Modern Approach', 'K. N. King', 'W. W. Norton', 9);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Expert C Programming', 'Peter van der Linden', 'Pearson', 6);
INSERT INTO books (title, author, publisher, quantity) VALUES ('21st Century C', 'Ben Klemens', 'O’Reilly', 5);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Let Us C', 'Yashavant Kanetkar', 'BPB Publications', 12);

INSERT INTO books (title, author, publisher, quantity) VALUES ('C++ Primer', 'Stanley Lippman', 'Addison-Wesley', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Effective Modern C++', 'Scott Meyers', 'O’Reilly', 9);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Accelerated C++', 'Koenig & Moo', 'Addison-Wesley', 8);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Programming: Principles and Practice Using C++', 'Bjarne Stroustrup', 'Pearson', 7);
INSERT INTO books (title, author, publisher, quantity) VALUES ('The C++ Programming Language', 'Bjarne Stroustrup', 'Addison-Wesley', 6);

INSERT INTO books (title, author, publisher, quantity) VALUES ('Data Structures and Algorithms in C++', 'Goodrich, Tamassia', 'Wiley', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Cracking the Coding Interview', 'Gayle Laakmann', 'CareerCup', 12);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Algorithms', 'Robert Sedgewick', 'Addison-Wesley', 8);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Introduction to Algorithms (CLRS)', 'Cormen et al.', 'MIT Press', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Grokking Algorithms', 'Aditya Bhargava', 'Manning', 7);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Data Structures in C', 'Reema Thareja', 'Oxford', 9);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Data Structures Using C', 'Tanenbaum', 'Pearson', 8);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Algorithms Unlocked', 'Thomas Cormen', 'MIT Press', 6);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Algorithm Design', 'Kleinberg & Tardos', 'Pearson', 7);

INSERT INTO books (title, author, publisher, quantity) VALUES ('System Design Interview Vol 1', 'Alex Xu', 'ByteByteGo', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('System Design Interview Vol 2', 'Alex Xu', 'ByteByteGo', 9);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Designing Data-Intensive Applications', 'Martin Kleppmann', 'O’Reilly', 12);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Scalability Rules', 'Abbot & Fisher', 'Pearson', 7);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Fundamentals of Software Architecture', 'Mark Richards', 'O’Reilly', 6);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Building Microservices', 'Sam Newman', 'O’Reilly', 6);

INSERT INTO books (title, author, publisher, quantity) VALUES ('Operating Systems: Three Easy Pieces', 'Remzi Arpaci-Dusseau', 'OSTEP', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Modern Operating Systems', 'Andrew Tanenbaum', 'Pearson', 9);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Linux Kernel Development', 'Robert Love', 'Addison-Wesley', 5);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Understanding Linux Network Internals', 'Christian Benvenuti', 'O’Reilly', 5);

INSERT INTO books (title, author, publisher, quantity) VALUES ('Computer Networks', 'Andrew Tanenbaum', 'Pearson', 10);
INSERT INTO books (title, author, publisher, quantity) VALUES ('TCP/IP Illustrated', 'W. Richard Stevens', 'Addison-Wesley', 8);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Network Warrior', 'Gary A. Donahue', 'O’Reilly', 6);
INSERT INTO books (title, author, publisher, quantity) VALUES ('Networking All-in-One', 'Doug Lowe', 'Wiley', 5);
INSERT INTO books (title, author, publisher, publisher, quantity) VALUES ('CompTIA Network+ Guide', 'Mike Meyers', 'McGraw Hill', 7);
