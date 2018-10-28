# student-directory #

The student directory script allows you to manage the list of students enrolled 
at Villains Academy.


## Functionality currently includes ##

When the student dirctory app is loaded the ``` "students.csv" ``` is 
automatically loaded by default.  

![Alt text](/Projects/student-directory/screenshots/default_load.png?raw=true)

The app has a main menu system that provides the user with the folowing options:

![Alt text](/Projects/student-directory/screenshots/main_menu.png?raw=true)

1. Input Students
The input students option provides the user with the option to add student records.
To quit the user just has to hit enter twice.  The input students option includes the 
following functionality: 
    - Validation for the cohort months, so the user is prompted to enter a valid
      cohort month e.g. March, November etc.
    - The user can also leave the field blank and hit enter which will result in 
      a default value being applied (TBC) so the user knows the information is
      still to be confirmed.
    - Each time a new student record has been added the user will be notified of
      the current number of student records on file.

Please see the screenshot below:

![Alt text](/Projects/student-directory/screenshots/adding_a_record.png?raw=true "Adding a record")


2. Show Students 
Option 2 will display the records to the user.  The show students option includes
the following functionality:
    - The text has been centered to neatly display it in a seperate style to the 
      main menu.
    - The records are grouped by cohort month so the user can easil see all 
      students in a particular cohort.
    - Only students with names beginning with "D" & less than 12 characters in 
      length will be displayed as per the user requirements.
    - The total number of students on file is displayed at the bottom of the list.

![Alt text](/Projects/student-directory/screenshots/show_record.png?raw=true)


3. Save list to a (.csv) file
The user can save the records to a csv file by using option 3.  The user will be 
prompeted to enter a (.csv) file as below.

![Alt text](/Projects/student-directory/screenshots/saving.png?raw=true)

The user can save the records to the default file ``` "students.csv" ``` by
simply pressing enter without entering as filename.


4. Load a (.csv) file
The "student.csv" is the default record that will load when the app is loaded; however
the user also has the option to load more records via this option.  As with the 
save option, the user will be prompted to enter a (.csv) filename e.g. 
``` "students.csv" ``` 

![Alt text](/Projects/student-directory/screenshots/loading.png?raw=true "Adding a record")

Once the file has been loaded a message will be displayed confirming hwo many 
records were loaded from the file.

9. Exit 
Simply press 9 and hit enter to exit the app.  This option has been labeled option 9
as further functionality is planned which will be included as options 5-8.


## How to use ##

``` shell
ruby directory.rb
```
Alternatively you can also run the app and load a csv file of your choice on startup
e.g.
``` shell
ruby directory.rb  students.csv
```