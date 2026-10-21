@echo off
echo ========================================================
echo Starting FreelanceHub Full-Stack Marketplace
echo ========================================================
echo.
echo Starting Backend API on http://localhost:5000...
start cmd /k "cd server && npm start"
timeout /t 3 /nobreak > nul
echo Starting Vite Frontend on http://localhost:5173...
start cmd /k "cd client && npm run dev"
echo.
echo ========================================================
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:5173
echo ========================================================
