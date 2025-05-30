## ADA for Computer Control Students - University of Almería - B. in Electronic Engineering and Industrial Automation - 2024/2025

Repository with the necessary packages and instructions for programming ADA in VisualStudioCode on Windows (10 and 11)and Linux (Not available for MAC).


<p align="center"> <img src="https://github.com/user-attachments/assets/0a87af1b-35b8-4a8c-b3df-47c717c9434f" width="200" height="200" /> <img width="400" height="200" alt="gnatstudio-main" src="https://github.com/user-attachments/assets/5ddb8256-c372-4925-9b60-9cfb57f7f858" /> </p>



> **Note:** Process tested with Windows 11 on 31th May 2025.

*Author: Fernando Cañadas Aránega, PhD student in Robotics in agriculture at the University of Almeria, Spain.*

*Gmail: fernando.ca@ual.es*

*Website: https://linktr.ee/FerCanAra*

# 1. Download Package

Download all the necessary software to be used. We will use [VisualStudioCode](https://code.visualstudio.com/download) as a visualiser, [Alire](https://alire.ada.dev/) as manager and AdaCore as compiler. For the compiler, if your OS is Windows 10 or 11, download the file ```gnatstudio-25.0w-20240506-x86_64-windows64-bin.exe``` from [AdaCore - GitHub](https://github.com/AdaCore/gnatstudio/releases), and if it's Linux 18.04 or later, download the file ```GNAT_Studio-x86_64.AppImage``` from [AdaCore - GitHub](https://github.com/AdaCore/gnatstudio/releases).

# 2. Package install

For Windows, simply double-click on the launcher and install the programs in the default path. For Linux, follow the commands below:

Go to the download location of the ```GNAT_Studio-x86_64.AppImage``` file and open a terminal. Run this command:
```
chmod -x GNAT_Studio-x86_64.AppImage
```
Subsequently, run the image with the following commands:
```
./GNAT_Studio-x86_64.AppImage --appimage-extract
./squashfs-root/usr/doinstall
```
# 3. Add compiler addresses to OS (Windows 10 or 11 users only)

Locate the folder where you installed GNAT Studio and Alire. Generally, this will be something like ``C:\GNATSTUDIO\bin`` and ``C:\Program Files\Alire\bin``. Follow the steps below to add environment variables:

1. Press Win + S and type ``Variables de entorno``.
2. Click on ‘Edit system environment variables’.
3. In the ‘System Variables’ section, find the variable named Path and select Edit.
4. Click New.
5. Add the full path to the GNAT Studio bin directory ``C:\GNATSTUDIO\bin`` in system variables and Alire ``C:\Program Files\Alire\bin`` in user variables.

Verify that it has been installed correctly by pressing the Windows key, type ```cmd```, in the pop-up window, type ``gnatstudio`` and press Enter. If the compiler opens, the address has been added correctly.

# 4. Configure VisualStudioCode

It is necessary to establish the connection between VisualSduio and ADA compiler. For each OS, it is different:

### For Windows

Press the Windows key, type ```Alire``` and, in the pop-up window, go through the following codes (By default, it is in C/:../User):

1. Create a project.
```
alr init project_name
```
2. In the next action, press 2 and press Enter.
```
Select the kind of crate you want to create:
  1. LIBRARY
  2. BINARY
```
3. For licences, press 4 and press Enter.
```
Select a software license for the crate?
  1. MIT OR Apache-2.0 WITH LLVM-exception
  2. MIT
  3. Apache-2.0 WITH LLVM-exception
  4. Apache-2.0
  5. BSD-3-Clause
  6. LGPL-3.0-or-later
  7. GPL-3.0-or-later WITH GCC-exception-3.1
  8. GPL-3.0-or-later
  9. Other...
```
Press Enter with the following options, until you get ```Success: project_name initialized successfully```.

4. Compile the project
Enter the folder created with ```cd project_name``` and run:
```
alr build
```
Now, press the Windows key and type VisualStudio. In the pop-up program, follow the instructions below:

1. Go to File and open folder. Navigate to this folder ```C:\Users\user\project_name```.
2. Open the src folder and you will find a file called ``project_name.adb``. Open it by clicking on it and paste the following code:
```
with Ada.Text_IO; use Ada.Text_IO;

procedure project_name is
begin
    Put_Line("I am going to approve CpC :) ");
end project_name;
```
3. Execute the project. This can be done in two ways:
   a) You can press the ‘Play’ button and watch the terminal that appears:
   b) Run the following command in the Alire terminal:
```
alr run
```
In the terminal, the following should appear ```I am going to approve CpC```.

# 5. Change the main

If you want to change the run file, go to ```project_name.gpr``` and, on line 8, change the following line to the name of the new project:
```
  for Main use (‘project_name.adb’);
```
by:
```
  for Main use (‘new_name.adb’);
```
Close and reopen VisualStudio to load the new address. Run play again. Every time you want to change the main, you should do it this way.

# 6. Use this simulator

To run this project, you have two options:

1. Start a new project, as explained in section 4, and copy the files inside the src folder of this one to the new project (Recommended). Change the ```.gpr ``` and restart VSC.

2. Clone this repository and change the correct addresses in the configuration files. Restart the PC

# Typical warnings (not errors, just recommendations for improvement):

The main warnings that will be displayed on the screen are described:
1. ```(style) space required [-gnatyt]: ```: They indicate that a space is missing in the code. For example, ```:Steering_Angle:=Steering_Angle+1.0;```: should be written ```:Steering_Angle := Steering_Angle + 1.0;```:.
2. ```(style) this line is too long [-gnatyM]```: Indicate that a line exceeds the character limit (default 80). To solve this, split the line into several lines.
3. ```variable "Hum" is not referenced [-gnatwu]```: It is defined, but not used.
4. ```Valor_Otro_Indice" is not modified, could be declared constant```: You define it, use it, but do not change its value. Suggest making it fixed to make it more secure.
5. ```trailing spaces not permitted [-gnatyb]```: There are extra spaces at the end of a line. It is suggested that they be removed to make the program faster. For example: ```:X := 10;␣␣␣   -- ← estos espacios al final no se ven, pero están.```.
6. ```useless assignment to "Lectura", value overwritten at line 230 [-gnatwm]```: The same variable is simply defined twice.
7. ```no entities of "Ada.Numerics.Elementary_Functions" are referenced [-gnatwu]``` follow by ```use clause for package "Elementary_Functions" has no effect [-gnatwu]```: A library is declared but not used.



