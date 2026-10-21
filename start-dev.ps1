$env:PATH = "C:\Users\Sanket\nodejs;" + $env:PATH
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host " Starting FreelanceHub Full-Stack Marketplace" -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Cyan

Write-Host "Starting Backend API on http://localhost:5000..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "`$env:PATH='C:\Users\Sanket\nodejs;' + `$env:PATH; cd '$PSScriptRoot\server'; npm start"

Start-Sleep -Seconds 3

Write-Host "Starting Vite React Frontend on http://localhost:5173..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "`$env:PATH='C:\Users\Sanket\nodejs;' + `$env:PATH; cd '$PSScriptRoot\client'; npm run dev"

Write-Host "`nFreelanceHub is launching!" -ForegroundColor Green
Write-Host "Frontend: http://localhost:5173" -ForegroundColor Cyan
Write-Host "Backend:  http://localhost:5000" -ForegroundColor Cyan
