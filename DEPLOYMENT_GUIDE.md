# Image Rating Platform - Complete Setup & Deployment Guide

## ✅ PROJECT SETUP COMPLETE

**New Project Location:** `C:/Users/jayru/OneDrive/Desktop/E_Learning/IMAGERATING`  
**GitHub Repository:** https://github.com/rj6624/IMAGERATING1.git  
**Database Name:** `imagerating-new`

---

## 🎯 What's Been Done

✅ Created new IMAGERATING folder  
✅ Copied all project files (excluding node_modules)  
✅ Installed backend dependencies  
✅ Installed frontend dependencies  
✅ Initialized Git repository  
✅ Pushed to GitHub: https://github.com/rj6624/IMAGERATING1.git  
✅ Backend running on http://localhost:5001  
✅ Frontend running on http://localhost:3001  
✅ Connected to MongoDB database: `imagerating-new`

---

## 🚀 RUNNING THE PROJECT LOCALLY

### Quick Start (Using Batch Files)

1. **Install Dependencies** (First time only):
   ```bash
   cd C:/Users/jayru/OneDrive/Desktop/E_Learning/IMAGERATING
   install.bat
   ```

2. **Start the Application**:
   ```bash
   start.bat
   ```
   This will start both backend (port 5001) and frontend (port 3001)

### Manual Start

**Start Backend:**
```bash
cd C:/Users/jayru/OneDrive/Desktop/E_Learning/IMAGERATING
npm start
```

**Start Frontend (in new terminal):**
```bash
cd C:/Users/jayru/OneDrive/Desktop/E_Learning/IMAGERATING/client
npm start
```

### Access Application
- **Frontend:** http://localhost:3001
- **Backend API:** http://localhost:5001/api
- **Database:** mongodb://localhost:27017/imagerating-new

---

## 📦 VERCEL DEPLOYMENT - STEP BY STEP

### STEP 1: Setup MongoDB Atlas (Production Database)

#### 1.1 Create New Database
1. Go to https://www.mongodb.com/cloud/atlas
2. Sign in to your account
3. Go to your cluster → **"Collections"**
4. Click **"Create Database"**
5. Database name: `imagerating-new`
6. Collection name: `users`
7. Click **"Create"**

#### 1.2 Get Connection String
1. Click **"Connect"** on your cluster
2. Select **"Connect your application"**
3. Copy connection string:
   ```
   mongodb+srv://YOUR_USERNAME:YOUR_PASSWORD@cluster0.xxxxx.mongodb.net/imagerating-new?retryWrites=true&w=majority
   ```
4. Replace `<password>` with your actual password
5. **SAVE THIS STRING** - you'll need it for Vercel

---

### STEP 2: Deploy Backend to Vercel

#### 2.1 Create New Project
1. Go to https://vercel.com/dashboard
2. Click **"Add New..."** → **"Project"**
3. Import repository: `rj6624/IMAGERATING1`

#### 2.2 Configure Backend
- **Framework Preset:** Other
- **Root Directory:** `/` (keep as root since backend files are in root)
- **Build Command:** Leave empty
- **Output Directory:** `.`
- **Install Command:** `npm install`

#### 2.3 Environment Variables
Add these variables:

```
NODE_ENV=production
PORT=5001
MONGODB_URI=mongodb+srv://YOUR_USERNAME:YOUR_PASSWORD@cluster0.xxxxx.mongodb.net/imagerating-new?retryWrites=true&w=majority
JWT_SECRET=imagerating-jwt-secret-2026-secure-key-12345
GOOGLE_CLIENT_ID=your-google-client-id-from-google-cloud-console
GOOGLE_CLIENT_SECRET=your-google-client-secret-from-google-cloud-console
SESSION_SECRET=imagerating-session-secret-2026-789
FRONTEND_URL=http://localhost:3001
GOOGLE_CALLBACK_URL=WILL_UPDATE_AFTER_DEPLOYMENT
```

#### 2.4 Deploy
1. Click **"Deploy"**
2. Wait for deployment (2-3 minutes)
3. You'll get URL like: `https://imagerating1.vercel.app`
4. **SAVE THIS BACKEND URL**

#### 2.5 Update Backend Environment Variables
1. Go to backend project → **"Settings"** → **"Environment Variables"**
2. Update `GOOGLE_CALLBACK_URL` to:
   ```
   https://YOUR-BACKEND-URL.vercel.app/api/auth/google/callback
   ```
3. Keep `FRONTEND_URL` as is (we'll update after frontend deploys)
4. Go to **"Deployments"** → Click **"..."** on latest → **"Redeploy"**

---

### STEP 3: Deploy Frontend to Vercel

#### 3.1 Create New Project (Separate from Backend)
1. Go to Vercel dashboard
2. Click **"Add New..."** → **"Project"**
3. Import SAME repository: `rj6624/IMAGERATING1`

#### 3.2 Configure Frontend
- **Framework Preset:** Create React App
- **Root Directory:** Click **"Edit"** → Select `client` folder
- **Build Command:** `npm run build`
- **Output Directory:** `build`
- **Install Command:** `npm install`

#### 3.3 Environment Variables
Add these:

```
REACT_APP_API_URL=https://YOUR-BACKEND-URL.vercel.app/api
DISABLE_ESLINT_PLUGIN=true
GENERATE_SOURCEMAP=false
```

Replace `YOUR-BACKEND-URL` with actual backend URL from Step 2.4

#### 3.4 Deploy
1. Click **"Deploy"**
2. Wait for deployment (3-5 minutes)
3. You'll get URL like: `https://imagerating1-frontend.vercel.app`
4. **SAVE THIS FRONTEND URL**

---

### STEP 4: Update Cross-References

#### 4.1 Update Backend FRONTEND_URL
1. Go to backend project in Vercel
2. Settings → Environment Variables
3. Edit `FRONTEND_URL`:
   ```
   https://YOUR-FRONTEND-URL.vercel.app
   ```
4. Save and redeploy backend

#### 4.2 Verify Frontend API URL
1. Go to frontend project in Vercel
2. Settings → Environment Variables
3. Confirm `REACT_APP_API_URL` points to your backend
4. Redeploy if changed

---

### STEP 5: Configure Google OAuth

#### 5.1 Update Google Cloud Console
1. Go to https://console.cloud.google.com/
2. APIs & Services → Credentials
3. Click your OAuth 2.0 Client ID

#### 5.2 Add Production URLs

**Authorized JavaScript origins:**
- `https://YOUR-FRONTEND-URL.vercel.app`
- `https://YOUR-BACKEND-URL.vercel.app`

**Authorized redirect URIs:**
- `https://YOUR-BACKEND-URL.vercel.app/api/auth/google/callback`

Click **"Save"**

---

### STEP 6: Final Testing

#### 6.1 Test Production Site
1. Open: `https://YOUR-FRONTEND-URL.vercel.app`
2. Try registration with email/password
3. Try login
4. Try Google OAuth login
5. Rate the image and add comment
6. Verify comments appear
7. Check rating chart updates

#### 6.2 Check Logs
- Backend logs: Vercel → Backend project → Deployments → Runtime Logs
- Frontend logs: Vercel → Frontend project → Deployments → Build Logs

---

## 🔧 TROUBLESHOOTING

### Build Fails on Vercel
- Check environment variables are set correctly
- Verify MongoDB connection string is valid
- Check deployment logs for specific errors

### Google OAuth Not Working
- Verify redirect URIs match exactly in Google Console
- Check GOOGLE_CALLBACK_URL in backend environment variables
- Ensure FRONTEND_URL is correct

### Database Connection Errors
- Verify MongoDB Atlas connection string
- Check password doesn't have special characters needing URL encoding
- Ensure IP whitelist includes 0.0.0.0/0 in MongoDB Atlas

### CORS Errors
- Backend FRONTEND_URL must match actual frontend URL
- Both must use https:// in production

---

## 📋 DEPLOYMENT CHECKLIST

### Pre-Deployment
- [x] Project copied to IMAGERATING folder
- [x] Dependencies installed
- [x] Git repository initialized
- [x] Pushed to GitHub: https://github.com/rj6624/IMAGERATING1.git
- [x] Local testing complete

### MongoDB Atlas
- [ ] Create database: `imagerating-new`
- [ ] Create database user
- [ ] Whitelist all IPs (0.0.0.0/0)
- [ ] Get connection string

### Backend Deployment
- [ ] Deploy to Vercel
- [ ] Add all environment variables
- [ ] Get backend URL
- [ ] Update GOOGLE_CALLBACK_URL
- [ ] Redeploy backend

### Frontend Deployment
- [ ] Deploy to Vercel (separate project)
- [ ] Add environment variables
- [ ] Set REACT_APP_API_URL to backend
- [ ] Get frontend URL

### Post-Deployment
- [ ] Update backend FRONTEND_URL
- [ ] Update Google OAuth redirect URIs
- [ ] Test email registration
- [ ] Test email login
- [ ] Test Google OAuth
- [ ] Test rating submission
- [ ] Verify database writes

---

## 🌐 QUICK REFERENCE

### Local URLs
- Frontend: http://localhost:3001
- Backend: http://localhost:5001/api
- Database: mongodb://localhost:27017/imagerating-new

### Production URLs (Update After Deployment)
- Frontend: https://YOUR-FRONTEND.vercel.app
- Backend: https://YOUR-BACKEND.vercel.app
- Database: mongodb+srv://...mongodb.net/imagerating-new

### Repository
- GitHub: https://github.com/rj6624/IMAGERATING1.git

### Environment Variables Quick Copy

**Backend (.env for local):**
```
PORT=5001
MONGODB_URI=mongodb://localhost:27017/imagerating-new
JWT_SECRET=imagerating-jwt-secret-2026-secure-key-12345
GOOGLE_CLIENT_ID=your-google-client-id-from-google-cloud-console
GOOGLE_CLIENT_SECRET=your-google-client-secret-from-google-cloud-console
GOOGLE_CALLBACK_URL=http://localhost:5001/api/auth/google/callback
FRONTEND_URL=http://localhost:3001
SESSION_SECRET=imagerating-session-secret-2026-789
```

**Frontend (.env for local):**
```
REACT_APP_API_URL=http://localhost:5001/api
```

---

## 🎉 PROJECT IS READY!

Your Image Rating Platform is now:
- ✅ Running locally on your machine
- ✅ Pushed to GitHub repository
- ✅ Ready for Vercel deployment
- ✅ Using new database: `imagerating-new`

**Next Step:** Follow the Vercel deployment steps above to deploy to production!
