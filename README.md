## ADA for Computer Control Students - University of Almería - B. in Electronic Engineering and Industrial Automation - 2024/2025

Repository with the necessary packages and instructions for programming ADA in VisualStudioCode on Windows (10 and 11), Linux and MAC.


<img src="https://github.com/user-attachments/assets/0a87af1b-35b8-4a8c-b3df-47c717c9434f" width="100" height="100" /> <img width="100" height="100" alt="gnatstudio-main" src="https://github.com/user-attachments/assets/5ddb8256-c372-4925-9b60-9cfb57f7f858" />



> **Note:** Process tested with Windows 11 on 1st February 2025.

# 1. Download Package

Download all the necessary software to be used. We will use [VisualStudioCode](https://code.visualstudio.com/download) as a visualiser, [Alire](https://alire.ada.dev/) as manager and AdaCore as compiler. For the compiler, if your OS is Windows 10 or 11, download the file ```gnatstudio-25.0w-20240506-x86_64-windows64-bin.exe``` from [AdaCore - GitHub](https://github.com/AdaCore/gnatstudio/releases), if it's Linux 18.04 or later, download the file ```GNAT_Studio-x86_64.AppImage``` from [AdaCore - GitHub](https://github.com/AdaCore/gnatstudio/releases) and, if you use MAC, download the file ```gnat-2020-20200818-x86_64-darwin-bin.dmg``` from [AdaCore - GNAT web](https://www.adacore.com/download/more)

# 2. Package install

For Windows or MAC, simply double-click on the launcher and install the programs in the default path. For Linux, follow the commands below:

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
5. Add the full path to the GNAT Studio bin directory ‘C:\GNATSTUDIO\bin’ and Alire ‘C:\Program Files “Alire\bin”.

Verify that it has been installed correctly by pressing the Windows key, type ```cmd```, in the pop-up window, type ``gnatstudio`` and press Enter. If the compiler opens, the address has been added correctly.

# 4. Configure VisualStudioCode

It is necessary to establish the connection between VisualSduio and ADA compiler. For each OS, it is different:

### For Windows

Press the Windows key, type ```Alire``` and, in the pop-up window, go through the following codes:

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
2. For licences, press 4 and press Enter.
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
3. Compile the project
```
alr build
```
Now, press the Windows key and type VisualStduio. In the pop-up program, follow the instructions below:

1. Go to File and open folder. Navigate to this folder ```C:\Users\user\project_name```.
2. Open the src folder and you will find a file called ``project_name.adb``. Open it by clicking on it and paste the following code:
```
with Ada.Text_IO; use Ada.Text_IO;

procedure nombre_proyecto is
begin
    Put_Line("Voy a aprobar CpC");
end nombre_proyecto;
```
3. Execute the project. This can be done in two ways:
   a) You can press the ‘Play’ button and watch the terminal that appears:
```
I am going to approve CpC
```
   b) Run the following command in the Alire terminal:
```
alr run
```
In the terminal, the following should appear ```I am going to approve CpC```.


# 5. Change the main

If you want to change the run file, go to project_name.gpr and, on line 8, change the following line to the name of the new project:
```
  for Main use (‘project_name.adb’);
```
by:
```
  for Main use (‘new_name.adb’);
```
Close and reopen VisualStudio to load the new address. Run play again. Every time you want to change the main, you should do it this way.





