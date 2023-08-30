# File Management System PowerShell Script

# User Database
$users = @{
    "user1" = "password1"
    "user2" = "password2"
}

# Authentication Function
function Authenticate {
    param (
        [string]$username,
        [String]$password
    )

    if ($users.ContainsKey($username) -and $users[$username] -eq $password) {
        return $true
    }
    return $false
}

# Main Menu
function Show-MainMenu {
    Write-Host "File Management System"
    Write-Host "1. Login"
    Write-Host "2. Exit"
}

# User Operations Menu
function Show-UserMenu {
    Write-Host "User Menu"
    Write-Host "1. View Files"
    Write-Host "2. Upload File"
    Write-Host "3. Download File"
    Write-Host "4. Logout"
}

# Interactive Loop
do {
    Show-MainMenu
    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        1 {
            $username = Read-Host "Enter your username"
            $password = Read-Host "Enter your password"

            if (Authenticate -username $username -password $password) {
                Write-Host "Authentication successful. Welcome, $username!" -ForegroundColor Green
                do {
                    Show-UserMenu
                    $userChoice = Read-Host "Enter your choice"

                    switch ($userChoice) {
                        1 {
                            # View Files
                            Write-Host "Listing files..."
                            Get-ChildItem -File | Select-Object Name
                        }
                        2 {
                            # Upload File
                            $fileName = Read-Host "Enter the name of the file to upload"
                            $content = Read-Host "Enter the content of the file"
                            Set-Content -Path $fileName -Value $content
                            Write-Host "File '$fileName' uploaded successfully." -ForegroundColor Green
                        }
                        3 {
                            # Download File
                            $fileName = Read-Host "Enter the name of the file to download"
                            $file = Get-Item -Path $fileName
                            if ($file) {
                                Write-Host "File content:"
                                Get-Content -Path $file.FullName
                            } else {
                                Write-Host "File '$fileName' not found." -ForegroundColor Red
                            }
                        }
                        4 {
                            Write-Host "Logging out..." -ForegroundColor Yellow
                            exit
                        }
                        default {
                            Write-Host "Invalid choice. Please select a valid option." -ForegroundColor Red
                        }
                    }
                } while ($true)
            } else {
                Write-Host "Authentication failed. Invalid credentials." -ForegroundColor Red
            }
        }
        2 {
            Write-Host "Exiting the program." -ForegroundColor Green
            exit
        }
        default {
            Write-Host "Invalid choice. Please select a valid option." -ForegroundColor Red
        }
    }
} while ($true)
