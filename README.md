# Image Rating Platform

A full-stack web application where users can rate images, leave comments, and view rating statistics with real-time updates.

## 🚀 Features

- **Authentication System**
  - Google OAuth integration
  - Email/Password authentication with JWT
  - Persistent login sessions
  - Protected routes

- **Rating System**
  - 1-5 star rating interface
  - Interactive star hover effects
  - One rating per user restriction
  - Real-time comment submission

- **Statistics Dashboard**
  - Visual rating distribution chart
  - Average rating calculation
  - Total rating count
  - Horizontal bar chart with Chart.js

- **Comments Section**
  - Display all user comments
  - User profile images (Google users)
  - Timestamp formatting
  - Latest comments first
  - Clean card-based UI

## 🛠️ Tech Stack

**Frontend:**
- React.js (JSX)
- React Router DOM
- Tailwind CSS
- Chart.js & react-chartjs-2
- Axios
- React Hot Toast

**Backend:**
- Node.js
- Express.js
- MongoDB with Mongoose
- JWT for authentication
- Passport.js for Google OAuth
- bcryptjs for password hashing

## 📁 Project Structure

```
IMAGERATING/
├── backend/                 # Express.js backend API
│   ├── config/
│   │   └── passport.js      # Google OAuth configuration
│   ├── controllers/
│   │   ├── authController.js
│   │   └── ratingController.js
│   ├── middleware/
│   │   └── authMiddleware.js
│   ├── models/
│   │   ├── User.js
│   │   └── Rating.js
│   ├── routes/
│   │   ├── authRoutes.js
│   │   └── ratingRoutes.js
│   ├── server.js
│   ├── package.json
│   ├── vercel.json
│   └── .env
├── frontend/                # React frontend app
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── components/
│   │   │   ├── ImageCard.js
│   │   │   ├── RatingStars.js
│   │   │   ├── CommentBox.js
│   │   │   ├── RatingChart.js
│   │   │   ├── CommentList.js
│   │   │   └── Navbar.js
│   │   ├── pages/
│   │   │   ├── Home.js
│   │   │   ├── Login.js
│   │   │   ├── Register.js
│   │   │   └── GoogleCallback.js
│   │   ├── services/
│   │   │   ├── authService.js
│   │   │   └── ratingService.js
│   │   ├── context/
│   │   │   └── AuthContext.js
│   │   ├── App.js
│   │   ├── index.js
│   │   └── index.css
│   ├── package.json
│   ├── tailwind.config.js
│   └── vercel.json
├── install.bat              # Install all dependencies
├── start.bat                # Start both servers
└── README.md
```

## 🔧 Installation & Setup

### Prerequisites
- Node.js (v14 or higher)
- MongoDB Atlas account or local MongoDB
- Google OAuth credentials (Client ID & Secret)

### Quick Start (Recommended)

1. Run the installation script:
```bash
install.bat
```

2. Start both servers:
```bash
start.bat
```

The application will open automatically:
- Frontend: http://localhost:3001
- Backend: http://localhost:5001

### Manual Setup

#### Backend Setup

1. Navigate to the backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. The `.env` file is already configured for local development.
   Update if needed:
```env
PORT=5001
MONGODB_URI=mongodb://localhost:27017/imagerating-new
JWT_SECRET=your_jwt_secret_key_here
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
GOOGLE_CALLBACK_URL=http://localhost:5001/api/auth/google/callback
FRONTEND_URL=http://localhost:3001
SESSION_SECRET=your_session_secret
```

4. Start the backend server:
```bash
npm start
```

Backend will run on `http://localhost:5001`

#### Frontend Setup

1. Navigate to the frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. The `.env` file is already configured. Update if needed:
```env
REACT_APP_API_URL=http://localhost:5001/api
```

4. Start the React development server:
```bash
npm start
```

Frontend will run on `http://localhost:3001`

## 🔐 Google OAuth Setup

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing
3. Enable Google+ API
4. Go to Credentials → Create Credentials → OAuth 2.0 Client ID
5. Configure OAuth consent screen
6. Add authorized redirect URIs:
   - `http://localhost:5001/api/auth/google/callback` (development)
   - `https://your-backend.vercel.app/api/auth/google/callback` (production)
7. Copy Client ID and Client Secret to backend `.env` file

## 🗄️ Database Schema

### User Schema
```javascript
{
  name: String,
  email: String (unique),
  password: String (hashed),
  profileImage: String,
  authProvider: String (enum: ['email', 'google']),
  googleId: String,
  timestamps: true
}
```

### Rating Schema
```javascript
{
  userId: ObjectId (ref: User),
  rating: Number (1-5),
  comment: String (max 500 chars),
  timestamps: true
}
```

## 🚢 Deployment

### Backend (Vercel)

1. Install Vercel CLI:
```bash
npm install -g vercel
```

2. Deploy from the RATING directory:
```bash
vercel
```

3. Set environment variables in Vercel dashboard

### Frontend (Vercel)

1. Navigate to client directory:
```bash
cd client
```

2. Build the production version:
```bash
npm run build
```

3. Deploy:
```bash
vercel
```

4. Update `REACT_APP_API_URL` in Vercel environment variables to point to your backend URL

## 📡 API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `GET /api/auth/google` - Initiate Google OAuth
- `GET /api/auth/google/callback` - Google OAuth callback
- `GET /api/auth/me` - Get current user (protected)

### Ratings
- `POST /api/ratings/submit` - Submit rating (protected)
- `GET /api/ratings/all` - Get all ratings
- `GET /api/ratings/stats` - Get rating statistics
- `GET /api/ratings/check` - Check if user has rated (protected)

## 🧪 Testing

### API Testing with Postman

1. Register a user:
```
POST http://localhost:5000/api/auth/register
Body: {
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123"
}
```

2. Login:
```
POST http://localhost:5000/api/auth/login
Body: {
  "email": "john@example.com",
  "password": "password123"
}
```

3. Submit rating (add Bearer token):
```
POST http://localhost:5000/api/ratings/submit
Headers: Authorization: Bearer <your-token>
Body: {
  "rating": 5,
  "comment": "Beautiful landscape!"
}
```

## 🎨 UI Features

- Responsive design (mobile & desktop)
- Smooth animations and transitions
- Loading states for all async operations
- Toast notifications for user feedback
- Clean, minimal design with Tailwind CSS
- Hover effects on interactive elements

## 📝 License

MIT

## 👨‍💻 Author

Built with ❤️ using React, Node.js, and MongoDB
