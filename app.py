from flask import Flask, render_template, request, redirect, flash
import mysql.connector
from datetime import date

app = Flask(__name__)
app.secret_key = "my_secret_key_for_flash"

# DATABASE CONNECTION

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Jithu1432",
    database="library_db"
)
cursor = db.cursor()


# HOME PAGE

@app.route('/')
def home():
    return render_template("index.html")


# VIEW BOOKS

@app.route('/view_books')
def view_books():
    cursor.execute("SELECT book_id, title, author, publisher, quantity FROM books")
    books = cursor.fetchall()
    return render_template("view_books.html", books=books)


# VIEW MEMBERS

@app.route('/view_members')
def view_members():
    cursor.execute("SELECT member_id, name, email, phone FROM members")
    members = cursor.fetchall()
    return render_template("view_members.html", members=members)


# ADD MEMBER

@app.route('/add_member', methods=['GET', 'POST'])
def add_member():
    if request.method == "POST":
        name = request.form["name"]
        email = request.form["email"]
        phone = request.form["phone"]

        cursor.execute(
            "INSERT INTO members (name, email, phone) VALUES (%s, %s, %s)",
            (name, email, phone)
        )
        db.commit()

        flash("Member added successfully!", "success")
        return redirect('/view_members')

    return render_template("add_member.html")


# ADD BOOK

@app.route('/add_book', methods=['GET', 'POST'])
def add_book():
    if request.method == "POST":
        title = request.form["title"]
        author = request.form["author"]
        publisher = request.form["publisher"]
        quantity = request.form["quantity"]

        cursor.execute(
            "INSERT INTO books (title, author, publisher, quantity) VALUES (%s, %s, %s, %s)",
            (title, author, publisher, quantity)
        )
        db.commit()

        flash("Book added successfully!", "success")
        return redirect('/view_books')

    return render_template("add_book.html")


# ISSUE BOOK

@app.route('/issue_book', methods=['GET', 'POST'])
def issue_book():
    cursor.execute("SELECT book_id, title FROM books WHERE quantity > 0")
    books = cursor.fetchall()

    cursor.execute("SELECT member_id, name FROM members")
    members = cursor.fetchall()

    if request.method == "POST":
        book_id = request.form["book_id"]
        member_id = request.form["member_id"]
        today = date.today()

        cursor.execute(
            "INSERT INTO transactions (book_id, member_id, issue_date) VALUES (%s, %s, %s)",
            (book_id, member_id, today)
        )
        db.commit()

        cursor.execute("UPDATE books SET quantity = quantity - 1 WHERE book_id=%s", (book_id,))
        db.commit()

        flash("Book issued successfully!", "success")
        return redirect('/view_transactions')

    return render_template("issue_book.html", books=books, members=members)


# RETURN BOOK

@app.route('/return_book', methods=['GET', 'POST'])
def return_book():
    cursor.execute("""
        SELECT t.transaction_id, b.title, m.name
        FROM transactions t
        JOIN books b ON t.book_id = b.book_id
        JOIN members m ON t.member_id = m.member_id
        WHERE t.return_date IS NULL
    """)
    active = cursor.fetchall()

    if request.method == "POST":
        tid = request.form["transaction_id"]

        cursor.execute("UPDATE transactions SET return_date=%s WHERE transaction_id=%s",
                       (date.today(), tid))
        db.commit()

        cursor.execute("""
            UPDATE books 
            SET quantity = quantity + 1 
            WHERE book_id = (SELECT book_id FROM transactions WHERE transaction_id=%s)
        """, (tid,))
        db.commit()

        flash("Book returned successfully!", "success")
        return redirect('/view_transactions')

    return render_template("return_book.html", transactions=active)


# VIEW TRANSACTIONS

@app.route('/view_transactions')
def view_transactions():
    cursor.execute("""
        SELECT t.transaction_id, b.title, m.name, t.issue_date, t.return_date
        FROM transactions t
        JOIN books b ON t.book_id = b.book_id
        JOIN members m ON t.member_id = m.member_id
        ORDER BY t.transaction_id DESC
    """)
    transactions = cursor.fetchall()
    return render_template("view_transactions.html", transactions=transactions)


# RUN THE APP

if __name__ == "__main__":
    app.run(debug=True)
