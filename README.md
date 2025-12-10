📚 Library Management System

A simple and efficient Library Management System built using Flask and MySQL.
This project allows easy management of books, members, issuing/returning books, and tracking all transactions through a clean web interface.

🚀 Features

📘 Add & View Books

👥 Add & View Members

🔄 Issue & Return Books

🧾 View Transaction History

🗃️ Organized UI using Jinja2 Templates

🗄️ MySQL database integration

🎨 Simple and responsive UI (HTML + CSS)

🛠️ Tech Stack
Component	Technology
Backend	Flask (Python)
Frontend	HTML, CSS
Database	MySQL
Tools	Git, VS Code
📂 Project Structure
LIBRARY_PROJECT/
│── Database/
│     └── library_db.sql
│
│── static/
│     └── style.css
│
│── templates/
│     ├── base.html
│     ├── index.html
│     ├── add_member.html
│     ├── view_members.html
│     ├── view_books.html
│     ├── issue_book.html
│     ├── return_book.html
│     └── view_transactions.html
│
│── app.py
│── requirements.txt
│── README.md

⚙️ Installation & Setup
1️⃣ Clone the Repository
git clone https://github.com/yourusername/library-management-system.git
cd library-management-system

2️⃣ Install Dependencies
pip install -r requirements.txt

3️⃣ Setup Database

Create a MySQL database (example: library)

Import this file:
Database/library_db.sql

4️⃣ Update MySQL Credentials (in app.py)
mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="library_db"
)

5️⃣ Run the Application
python app.py


Now open your browser and go to:
👉 http://127.0.0.1:5000

🔮 Future Enhancements

Admin Login System

Report Dashboard (Issued/Returned stats)

Email notifications for due dates

Search suggestions for books/members

🤝 Contributing

Contributions are welcome!
Feel free to open an issue or submit a pull request.

📄 License

This project is open-source under the MIT License
