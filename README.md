## ADA for Computer Control Students - University of Almería - B. in Electronic Engineering and Industrial Automation - 2025/2026

Repository with the necessary packages and instructions for programming ADA in VisualStudioCode (VSC) on Windows (10 and 11) and Linux (Not available for MAC).

<p align="center"> <img src="https://github.com/user-attachments/assets/0a87af1b-35b8-4a8c-b3df-47c717c9434f" width="200" height="200" /> <img width="400" height="200" alt="gnatstudio-main" src="https://github.com/user-attachments/assets/5ddb8256-c372-4925-9b60-9cfb57f7f858" /> </p>

> **Note:** Process tested with Windows 11 on 13th March 2026.

*Author: Fernando Cañadas Aránega, PhD student in Agriculture Robotics at the University of Almeria, Spain.*

*Gmail: fernando.ca@ual.es*

*Website: https://linktr.ee/FerCanAra*

*LICENCE: Intellectual property patent no. 2601204317192 held by [Safe Creative](https://www.safecreative.org/es)*

# 1. Download Package

We will use [Visual Studio Code](https://code.visualstudio.com/download) as our editor, [Alire](https://alire.ada.dev/) as our IDE, and AdaCore as our compiler. 

#### 1.1. Programming with Visual Studio Code and GNAT

If your operating system is Windows 10 or 11, download the compiler `gnatstudio-26.0w-20250417-x86_64-windows64-bin.exe` from [AdaCore](https://github.com/AdaCore/gnatstudio/releases) and the visualizer [GNATSTUDIO](https://drive.google.com/drive/folders/19Z8nmJTd6RYPgOSX6STBaHeZuFV4g4uQ?usp=sharing). Also, download [Visual Studio Code](https://code.visualstudio.com/download) and [Alire](https://alire.ada.dev/). If you are using Linux 18.04 or later, download the file ```gnatstudio-26.0w-20250417-x86_64-linux-bin.tar.gz``` from [AdaCore - GitHub](https://github.com/AdaCore/gnatstudio/releases). To configure the environment, proceed to step 2.

#### 1.2. Programming using GNAT Studio only

For Windows 10 or 11 users only: go to [this](https://drive.google.com/drive/folders/19Z8nmJTd6RYPgOSX6STBaHeZuFV4g4uQ?usp=drive_link) Drive folder and download the file ‘GNAT_CpC.zip’. This interface is already fully configured; you simply need to follow these steps:

1. Unzip GNAT_CpC.zip IN ```C:```.
2. Navigate to ```C:\GNAT\2021\bin\``` and locate ```gnatstudio.exe```. Run it (tip: create a shortcut to this file and place it on your desktop).
3. In the application window, click ```Create New Project```.
4. Select ```Simple Ada Project```.
5. Choose a save location and enter a name.
6. Click ```Apply```.
   
You can skip straight to point 6.

# 2. Package install

#### 2.1. For windows

Double-click on the launcher of "AdaCore", "VSC" and "Alire", and install the programs in the default path. For "GNATSTUDIO", Unzip GNAT_CpC.zip IN ```C:```. Navigate to ```C:\GNAT\2021\bin\``` and locate ```gnatstudio.exe```. Run it (tip: create a shortcut to this file and place it on your desktop).

#### 2.2. For Linux

Go to the download location of the ```gnatstudio-26.0w-20250417-x86_64-linux-bin.tar.gz```, unzip the file, go into the directory and open a terminal. Run this command:
```
chmod -x doinstall
```
Subsequently, run the image with the following commands:
```
./doinstall
```
# 3. Add compiler addresses to OS (Windows 10 or 11 users only)

Locate the folder where you installed GNAT Studio and Alire. Generally, this will be something like ``C:\GNATSTUDIO\bin`` and ``C:\Program Files\Alire\bin`` (Note: These paths must appear exactly as shown. If you copy them directly from this repository, they are often copied incorrectly to the clipboard). Follow the steps below to add environment variables:

1. Press Win + S and type ``Variables de entorno``.
2. Click on ``Editar las variables de entorno del sistema``.
3. Click on ``Variables de entorno...`` in the bottom right-hand corner.
4. In the ``Variables de usuario para user`` section, find the variable named ``Path`` and select Edit.
5. Click New.
6. Add the full path to the GNAT Studio bin directory ``C:\GNATSTUDIO\bin`` in system variables and save it.
7. Then, press ``Variables para el entorno``, find the variable named ``Path`` and select Edit.
8. Click New.
9. Add the full path to the GNAT Studio bin directory ``C:\GNATSTUDIO\bin`` and Alire ``C:\Program Files\Alire\bin`` in user variables. Save it

# 4. Configure VisualStudioCode with ADA compiler

#### Create an ADA project

First, create a folder on your desktop called ```Ada_project```. Press the Windows key, type ```Alire``` and, in the pop-up window, go through the following codes (By default, it is in C:\Users\<your_user>). Now, navigate to that folder using ina Alire terminal with the following command: `cd .\Desktop\Ada_project\`. Once you are in that directory, create a project by following these steps:

1. Create a project.
```
alr init --bin project_name
```
Please wait a few seconds for msys2 to install automatically.

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
You must return ```Success: Build finished successfully in x seconds.``` 

#### Configure VisualStudioCode (VSC)

Now, press the Windows key and type VisualStudio. In the pop-up program, follow the instructions below:

1. Go to Extensions, search for ```Ada & Spark``` and install it. Restart VSC by closing it and reopening it.
2. Go to File and open folder. Navigate to this folder ```C:\Users\<your_user>\Ada_project```.
3. Wait a few seconds, then select the file you want to run from the search bar (Visual Studio will suggest the correct one).
4. Open the src folder, and you will find a file called ``project_name.adb``. Open it by clicking on it and paste the following code:
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

3. For users who only use GnatStudio: Click on the pencil icon just above your main folder, go to ```main```, click on ```-``` to delete the existing entry, and add the new one by clicking on ```+```(note: there should only be one entry under “Main Files”)

# Typical warnings (not errors, just recommendations for improvement):

The main warnings that will be displayed on the screen are described:
1. ```(style) space required [-gnatyt]: ```: They indicate that a space is missing in the code. For example, ```:Steering_Angle:=Steering_Angle+1.0;```: should be written ```:Steering_Angle := Steering_Angle + 1.0;```:.
2. ```(style) this line is too long [-gnatyM]```: Indicate that a line exceeds the character limit (default 80). To solve this, split the line into several lines.
3. ```variable "Hum" is not referenced [-gnatwu]```: It is defined, but not used.
4. ```Valor_Otro_Indice" is not modified, could be declared constant```: You define it, use it, but do not change its value. Suggest making it fixed to make it more secure.
5. ```trailing spaces not permitted [-gnatyb]```: There are extra spaces at the end of a line. It is suggested that they be removed to make the program faster. For example: ```:X := 10;␣␣␣   -- ← estos espacios al final no se ven, pero están.```.
6. ```useless assignment to "Lectura", value overwritten at line 230 [-gnatwm]```: The same variable is simply defined twice.
7. ```no entities of "Ada.Numerics.Elementary_Functions" are referenced [-gnatwu]``` follow by ```use clause for package "Elementary_Functions" has no effect [-gnatwu]```: A library is declared but not used.



