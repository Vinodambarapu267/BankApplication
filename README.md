# Happy Wallet - Banking Application

A full-stack Java web application for banking operations with features like money transfer, user registration, profile management, and transaction history.

## 🚀 Features

### Core Banking Operations
- **User Registration** - Create new bank accounts with auto-generated account numbers
- **User Login/Logout** - Secure authentication system
- **Money Transfer** - Transfer funds between accounts with transaction logging
- **Balance Inquiry** - Check account balance
- **Transaction History** - View past transactions

### Advanced Features
- **Email Notifications** - Automatic email alerts for transactions and registrations
- **Profile Management** - Update user information
- **Session Management** - Secure user sessions
- **Transaction Rollback** - Automatic rollback on transfer failures
- **Input Validation** - Comprehensive form validation

## 🛠️ Technology Stack

### Backend
- **Java Servlets** - Request handling
- **JDBC** - Database connectivity
- **Oracle Database** - Data persistence
- **JavaMail API** - Email notifications

### Frontend
- **JSP** - View rendering
- **HTML/CSS** - User interface
- **JavaScript** - Client-side validation

### Configuration
- **Properties Files** - Database and email configuration
- **Session Management** - HttpSession for user state

## 📁 Project Structure

```
src/main/java/com/bank/
├── Entity/                    # Data transfer objects
│   ├── BankUserBean.java
│   └── TransactionBean.java
├── DAO/                     # Data access layer
│   ├── RegisterDAO.java
│   ├── LoginDAO.java
│   ├── TransferMoneyDAO.java
│   ├── UpdateProfileDAO.java
│   ├── Bank_TransactionDAO.java
│   └── BankUserBeanDAO.java
├── serviceClases/                 # Business logic layer (Servlets)
│   ├── RegisterServlet.java
│   ├── LoginServlet.java
│   ├── TransferServlet.java
│   ├── UpdateServlet.java
│   └── LogoutServlet.java
├── connectionpool/          # Database connectivity
|	├── DbConnect.java
|	└── db.properties
├── WebConent/
|     ├── bankLogin.jsp
|     ├── Register.html
|     ├── UserHome.jsp
|     ├── EditProfile.jsp
|     ├── Logout.jsp
|     ├── Error.jsp
|     ├── AmountError.jsp
|     └── WEB-INF/
|	   └──web.xml
└── Configuration files
    ├── README.md
    ├── .settings/
    │   ├──org.eclipse.wst.common.project.facet.core.xml
    │   ├── org.eclipse.jdt.core.prefs
    │   └── org.eclipse.core.resources.prefs
```

## 🗄️ Database Schema

### bank_users Table
- `USER_ID` - Primary key (10-digit random)
- `FULL_NAME` - User's full name
- `EMAIL` - User email
- `USERNAME` - Login username
- `PASSWORD` - Login password
- `PHONE_NUMBER` - User phone number (used as account identifier)
- `ACCOUNT_NUMBER` - 13-digit random account number
- `BALANCE` - Account balance (starts with ₹15,000)
- `CREATED_AT` - Account creation date

### bank_transactions Table
- `TXN_ID` - Transaction ID
- `SENDER_ACCOUNT` - Sender's phone number
- `RECEIVER_ACCOUNT` - Receiver's phone number
- `AMOUNT` - Transaction amount
- `TXN_TYPE` - Credit/Debit/Transfer
- `DESCRIPTION` - Transaction description
- `STATUS` - Success/Failed
- `TXN_DATE` - Transaction timestamp

## ⚙️ Setup Instructions

### Prerequisites
- Java 21 or higher
- Oracle Database 11g or higher
- Apache Tomcat 9 or higher
- Eclipse IDE (recommended)

### Database Configuration
1. Create Oracle database instance
2. Update `db.properties` with your database credentials:
```properties
driverName=oracle.jdbc.driver.OracleDriver
url=jdbc:oracle:thin:@localhost:1521:orcl
username=your_username
pass=your_password
```

### Email Configuration
Update email settings in `TransferServlet.java` and `RegisterServlet.java`:
```

java
private static final String SMTP_HOST = "smtp.gmail.com";

private static final String SMTP_PORT = "587";

private static final String EMAIL_USERNAME = "your_email@gmail.com";

private static final String EMAIL_PASSWORD = "your_app_password";
```

### Deployment Steps
1. Import project into Eclipse as Dynamic Web Project
2. Configure Tomcat server
3. Add Oracle JDBC driver to build path
4. Create required database tables
5. Deploy to Tomcat server
6. Access application at `http://localhost:8080/YourAppName`

## 🔧 Key Components

### Data Transfer Objects
- **BankUserBean** - User account information
- **TransactionBean** - Transaction records

### Servlets
- **RegisterServlet** - Handles user registration
- **LoginServlet** - Manages user authentication
- **TransferServlet** - Processes money transfers
- **UpdateServlet** - Handles profile updates
- **LogoutServlet** - Manages user logout

### DAO Classes
- **RegisterDAO** - User registration operations
- **LoginDAO** - Authentication operations
- **TransferMoneyDAO** - Fund transfer operations with transaction management
- **UpdateProfileDAO** - Profile update operations
- **Bank_TransactionDAO** - Transaction history operations

## 🎯 Usage Flow

1. **Registration** → New users register with personal details
2. **Login** → Users authenticate with username/password
3. **Dashboard** → View balance and recent transactions
4. **Transfer Money** → Send money to other users by phone number
5. **View Transactions** → Check transaction history
6. **Update Profile** → Modify personal information
7. **Logout** → Secure session termination

## 🔒 Security Features

- Session management for user authentication
- Input validation and sanitization
- Password confirmation checks
- Transaction rollback on errors
- SQL injection prevention using PreparedStatement

## 📧 Email Notifications

The application sends automated emails for:
- Successful registration
- Money transfer (both debit and credit notifications)
- Transaction failures

## 🐛 Error Handling

- Comprehensive exception handling
- User-friendly error messages
- Transaction rollback on failures
- Failed transaction logging

## 📝 Notes

- Initial account balance: ₹15,000
- Phone number used as primary account identifier
- Random account number generation (13 digits)
- Automatic transaction logging for audit trail
- Email notifications for important activities

## 🤝 Contributing

1. Fork the repository
2. Create feature branch
3. Commit changes
4. Push to branch
5. Create Pull Request

## 📄 License

This project is licensed under the MIT License.

---

**Developed by Vinod Ambarapu**  
*Full Stack Java Banking Application*