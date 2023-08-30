**File Management System PowerShell Script**

This PowerShell script simulates a basic file management system that includes user authentication and various file operations. It provides users with the ability to log in, manage files, and log out. 

1. **User Database:**
    - At the beginning of the script, a hash table named `$users` is defined to store user credentials. Each entry consists of a username as the key and a corresponding password as the value.

2. **Authentication Function (`Authenticate`):**
    - This function takes two parameters: `$username` and `$password`.
    - It checks if the provided username exists in the `$users` hash table and if the associated password matches.
    - Returns `true` if authentication is successful, `false` otherwise.

3. **Main Menu (`Show-MainMenu`):**
    - Displays the main menu options to the user: Login or Exit.

4. **User Operations Menu (`Show-UserMenu`):**
    - Displays options available to a logged-in user: View Files, Upload File, Download File, or Logout.

5. **Interactive Loop (`do` and `switch`):**
    - The script enters an interactive loop where the main menu is displayed, and the user is prompted for a choice.
    - The `switch` statement handles the user's choice.

6. **Login Process (`choice 1` in the main menu):**
    - The user is prompted to enter their username and password.
    - The `Authenticate` function is called with the provided credentials.
    - If authentication is successful, the user is greeted, and the user operations menu is shown.
    - If authentication fails, an error message is displayed.

7. **User Operations (`do` loop inside `choice 1`):**
    - Within this loop, the user operations menu is displayed.
    - The user can choose from various options: View Files, Upload File, Download File, or Logout.

8. **View Files (`choice 1` in the user operations menu):**
    - The script lists all files in the current directory using the `Get-ChildItem` cmdlet and displays their names.

9. **Upload File (`choice 2` in the user operations menu):**
    - The user is prompted to enter the name and content of the file they want to upload.
    - The `Set-Content` cmdlet is used to create a new file with the provided name and content.

10. **Download File (`choice 3` in the user operations menu):**
    - The user is prompted to enter the name of the file they want to download.
    - The script checks if the file exists and reads its content using the `Get-Content` cmdlet.

11. **Logout (`choice 4` in the user operations menu):**
    - The user chooses to log out, and a message is displayed before exiting the user operations loop.

12. **Exiting the Program (`choice 2` in the main menu):**
    - The user chooses to exit the program, and an exit message is displayed before breaking out of the interactive loop.
