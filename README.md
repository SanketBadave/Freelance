# FreelanceHub — Full-Stack Freelancing Marketplace

FreelanceHub is a complete, modern, responsive full-stack freelancing marketplace connecting clients and top-tier freelancers. Clients can post projects, review candidate bids, compare talent, initiate contracts with milestones, release escrow payments via Razorpay (or verified mock payment mode), and leave verified reviews. Freelancers can discover projects, filter by budget/skills, submit customized proposals, track contracts, submit milestone deliverables, chat in real-time, and manage earnings.

---

## 🚀 Key Features

- **Dynamic Landing Page**: Hero with search, category cards, popular projects, featured talent, interactive How It Works tabs, benefits, community testimonials, FAQ accordion, and call to action.
- **Role-Based Authentication & Authorization**: JWT token auth, secure password hashing (bcryptjs), persistent login sessions, role guards (`freelancer`, `client`, `admin`), forgot/reset password workflow.
- **1-Click Demo Logins**: Instant evaluator buttons for Freelancer, Client, and Admin roles directly on the Login page.
- **Freelancer Workspace**:
  - Live profile completion score indicator
  - Earnings analytics with Recharts area chart
  - Profile editor (headline, bio, hourly rate, location, experience, portfolio gallery, skills tags)
  - Proposal tracking (submitted, shortlisted, accepted, rejected, with withdraw action)
  - Active contracts with milestone delivery submission
  - Earnings ledger and payout withdrawal request
  - Client reviews breakdown
  - Saved/bookmarked projects
- **Client Workspace**:
  - Project posting form with fixed/hourly budget, deadlines, categories, and required skills
  - Project management (edit, delete, status toggle)
  - Proposal review center: compare freelancers, inspect ratings, shortlist, and accept to launch contract
  - Contract milestone management (review deliverables, request revisions, approve)
  - Escrow payments via Razorpay test mode & verified Mock Mode
  - Saved talent directory
  - Company profile editor
- **Admin Control Center**:
  - Platform-wide statistics (users, projects volume, escrow turnover, platform 10% fee revenue)
  - User moderation: suspend / activate accounts
  - Project moderation: delete suspicious or non-compliant listings
  - Review moderation: remove inappropriate ratings
  - Safety reports manager: investigate and resolve reported content
  - Dispute resolution: rule in favor of freelancer (complete) or client (cancel)
  - Categories management: taxonomy and project counts
- **Real-Time Communication**:
  - Socket.IO instant messaging between client and freelancer
  - Typing indicators & online/offline presence tracking
  - In-app notification center with real-time badges
- **Theme Support**: Seamless Dark Mode and Light Mode toggle with persistence.

---

## 🛠 Technology Stack

### Frontend
- **Framework**: React.js with Vite
- **Routing**: React Router DOM v6
- **Styling**: Tailwind CSS with custom colors and dark mode classes
- **Icons**: Lucide React
- **HTTP Client**: Axios with JWT interceptors
- **Analytics Charts**: Recharts
- **Real-Time**: Socket.IO Client

### Backend
- **Runtime**: Node.js & Express.js
- **Architecture**: REST API with modular controllers, routes, and middleware
- **Authentication**: JSON Web Tokens (JWT) & bcryptjs password hashing
- **Real-Time Engine**: Socket.IO
- **Database**: MongoDB with Mongoose ODM (includes automatic embedded engine fallback via `mongodb-memory-server` for 100% plug-and-play zero-setup operation!)
- **Security**: Helmet, CORS, Express Rate Limiter, sanitized input handling
- **Payments**: Razorpay test mode with signature verification + verified Mock Payment fallback

---

## 📦 Project Directory Structure

```
freelancehub/
├── client/                     # Vite + React Frontend
│   ├── src/
│   │   ├── components/         # Reusable UI (Navbar, Footer, ProjectCard, FreelancerCard, PaymentModal, etc.)
│   │   ├── context/            # AuthContext, ThemeContext, SocketContext, ToastContext
│   │   ├── pages/              # Public, Freelancer, Client, and Admin pages
│   │   ├── services/           # Axios API client (api.js)
│   │   ├── App.jsx             # Route definitions & guards
│   │   ├── main.jsx            # Context providers & mounting
│   │   └── index.css           # Tailwind directives & theme
│   ├── package.json
│   ├── tailwind.config.js
│   └── vite.config.js
├── server/                     # Node.js + Express Backend
│   ├── config/                 # Database connection (db.js with auto-seed)
│   ├── controllers/            # Feature controllers (auth, project, proposal, contract, payment, etc.)
│   ├── middleware/             # JWT auth, upload, centralized error handler
│   ├── models/                 # Mongoose schemas (User, Project, Proposal, Contract, Milestone, etc.)
│   ├── routes/                 # Express route modules
│   ├── scripts/                # Database seeder (seed.js, seedRoutine.js)
│   ├── sockets/                # Socket.IO event listeners (chatSocket.js)
│   ├── server.js               # Entrypoint & server bootstrap
│   ├── .env.example
│   └── package.json
├── package.json                # Root package with multi-scripts
├── .gitignore
└── README.md
```

---

## ⚡ Quick Start & Execution

### 1. Prerequisites
- Node.js (v18 or higher recommended)
- npm (v9 or higher)

### 2. Running the Backend
```bash
cd server
npm install
npm run seed     # Seeds demo users, projects, proposals, contracts, reviews
npm start        # Starts Express server on http://localhost:5000
```
> **Note**: If you don't have MongoDB installed locally, the server will automatically launch an embedded engine on Windows for seamless local development with zero external dependencies!

### 3. Running the Frontend
In a new terminal window:
```bash
cd client
npm install
npm run dev      # Starts Vite dev server on http://localhost:5173
```
Open **`http://localhost:5173`** in your browser.

---

## 👤 Test Accounts & Credentials

All test accounts share the password: **`Password123!`**  
You can also click the **"Quick 1-Click Demo Logins"** buttons on the `/login` page to sign in instantly without typing.

| Role | Name | Email | Password |
|---|---|---|---|
| **Platform Admin** | Platform Admin | `admin@freelancehub.com` | `Password123!` |
| **Client 1** | David Miller (TechCorp) | `client1@techcorp.com` | `Password123!` |
| **Client 2** | Sarah Jenkins (Horizon) | `client2@horizonmedia.com` | `Password123!` |
| **Freelancer 1** | Alex Rivera (Full-Stack) | `freelancer1@dev.com` | `Password123!` |
| **Freelancer 2** | Priya Sharma (UI/UX) | `freelancer2@design.com` | `Password123!` |
| **Freelancer 3** | Marcus Chen (AI/ML) | `freelancer3@ai.com` | `Password123!` |

---

## 📡 REST API Reference

### Authentication
- `POST /api/auth/register` — Create new Freelancer or Client account
- `POST /api/auth/login` — Sign in and receive JWT token
- `GET /api/auth/me` — Get current user and full role profile
- `PUT /api/auth/updatedetails` — Update account profile details
- `PUT /api/auth/updatepassword` — Update account password
- `POST /api/auth/forgotpassword` — Request password reset token
- `PUT /api/auth/resetpassword/:token` — Reset password with token

### Profiles
- `GET /api/profiles/freelancers` — Search and filter freelancers
- `GET /api/profiles/freelancers/:userId` — Public freelancer profile details & reviews
- `PUT /api/profiles/freelancer` — Update authenticated freelancer profile
- `GET /api/profiles/clients/:userId` — Public client profile & open jobs
- `PUT /api/profiles/client` — Update authenticated client profile

### Projects
- `GET /api/projects` — Search and filter open projects
- `GET /api/projects/:id` — Single project overview and attachments
- `POST /api/projects` — Create project listing (Client only)
- `PUT /api/projects/:id` — Update project details
- `DELETE /api/projects/:id` — Delete project
- `GET /api/projects/my-projects` — Client's posted projects
- `GET /api/projects/recommended` — Recommended jobs for freelancer

### Proposals
- `POST /api/proposals` — Submit bid/proposal on open project
- `GET /api/proposals/my-proposals` — Freelancer's submitted proposals
- `GET /api/proposals/project/:projectId` — Project proposals review (Client only)
- `PUT /api/proposals/:id/status` — Shortlist, accept, or reject proposal
- `PUT /api/proposals/:id/withdraw` — Withdraw submitted proposal

### Contracts & Milestones
- `POST /api/contracts` — Accept proposal and establish contract with milestones
- `GET /api/contracts` — Get active/completed contracts list
- `GET /api/contracts/:id` — Single contract view with milestone status
- `PUT /api/contracts/milestones/:milestoneId/submit` — Submit deliverable (Freelancer)
- `PUT /api/contracts/milestones/:milestoneId/approve` — Approve deliverable (Client)
- `PUT /api/contracts/milestones/:milestoneId/revision` — Request milestone revision (Client)
- `PUT /api/contracts/:id/complete` — Mark contract as completed

### Payments & Escrow
- `POST /api/payments/create-order` — Create Razorpay or Mock escrow order
- `POST /api/payments/verify` — Verify transaction signature and release milestone
- `GET /api/payments/transactions` — Transaction history and ledger records

### Real-Time Chat & Notifications
- `GET /api/chat/conversations` — User's conversation list
- `POST /api/chat/conversations` — Get or initiate conversation with user
- `GET /api/chat/conversations/:id/messages` — Conversation message history
- `POST /api/chat/conversations/:id/messages` — Send message in conversation
- `GET /api/notifications` — Notification feed
- `PUT /api/notifications/:id/read` — Mark notification read
- `PUT /api/notifications/read-all` — Mark all notifications read

### Reviews & Bookmarks
- `POST /api/reviews` — Submit 1-5 star review for completed contract
- `GET /api/reviews/user/:userId` — User's review history
- `POST /api/bookmarks/projects/:projectId` — Toggle bookmark on project
- `GET /api/bookmarks/projects` — Freelancer's saved projects
- `POST /api/bookmarks/freelancers/:freelancerId` — Toggle bookmark on talent
- `GET /api/bookmarks/freelancers` — Client's shortlisted talent

### Admin & Moderation
- `GET /api/admin/stats` — Platform metrics & financial volume
- `GET /api/admin/users` — User directory
- `PUT /api/admin/users/:id/toggle-status` — Suspend / activate user account
- `GET /api/admin/projects` — Projects moderation list
- `DELETE /api/admin/projects/:id` — Delete project
- `GET /api/admin/reviews` — Reviews moderation list
- `DELETE /api/admin/reviews/:id` — Delete review
- `GET /api/admin/reports` — Safety reports
- `PUT /api/admin/reports/:id` — Resolve report
- `GET /api/admin/disputes` — Open disputes
- `PUT /api/admin/disputes/:contractId` — Resolve dispute (complete/cancel)
- `GET /api/categories` — Platform categories
- `POST /api/categories` — Add new category (Admin only)

---

## 🌐 Production Deployment Guide

### Frontend (e.g. Vercel, Netlify)
1. Set the Root Directory to `client`.
2. Build command: `npm run build`
3. Output directory: `dist`
4. Set environment variable: `VITE_API_URL=https://your-backend-api.com/api`

### Backend (e.g. Render, Railway, AWS ECS)
1. Set Root Directory to `server`.
2. Build command: `npm install`
3. Start command: `node server.js`
4. Set environment variables:
   - `PORT=5000`
   - `NODE_ENV=production`
   - `MONGODB_URI=mongodb+srv://<username>:<password>@cluster.mongodb.net/freelancehub`
   - `JWT_SECRET=<strong_random_secret_32_characters>`
   - `RAZORPAY_KEY_ID=<your_test_or_live_key>`
   - `RAZORPAY_KEY_SECRET=<your_test_or_live_secret>`

---

## 📄 License
This project is open-source and licensed under the [MIT License](LICENSE).
