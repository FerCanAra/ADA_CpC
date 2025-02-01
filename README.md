## ADA for Computer Control Students - University of Almería - B. in Electronic Engineering and Industrial Automation - 2024/2025

Repository with the necessary packages and instructions for programming ADA in VisualStudioCode on Windows (10 and 11), Linux and MAC.

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

# 4. Configurar VisualStudioCode

Es necesario establecer la conexión entre VisualSduio y ADA compiler. Para cada SO, es different:

### Para Windows

Pulsa la tecla Windows, escribe ```Alire``` y, en la ventana emergente, vaya ejecutando los siguientes codigos:
1. Cree un proyecto.
```
alr init nombre_proyecto
```
2. En la siguiente acción, pulsa 2 y presiona Enter.
```
Select the kind of crate you want to create:
  1. LIBRARY
  2. BINARY
```
2. Para las licencias, pulsa 4 y presiona Enter.
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
Vaya pulsando Enter con las siguientes opciones, hasta que le aparezca ```Success: nombre_proyecto initialized successfully.```.
3. Compila el proyecto
```
alr build
```
Ahora, pulse la tecla Windows y escriba VisualStduio. En el programa emergente, siga las siguientes instrucciones:

1. Vaya a Archivo y abrir carpeta. Navegue hasta esta carpeta ```C:\Users\usuario\nombre_proyecto```.
2. Abra la acrpeta src y se encontrará un archivo llamado ```nombre_proyecto.adb```. Abralo pulsando encima de el y pegue el siguiente código:
```
with Ada.Text_IO; use Ada.Text_IO;

procedure nombre_proyecto is
begin
    Put_Line("Voy a aprobar CpC");
end nombre_proyecto;
```
3. Ejecute el proyecto. Puede realizarse de dos formas:
   a) Puedes pulsar el boton "Play" y observar la terminal que aparece:
```
Voy a aprobar CpC
```
   b) Ejecuta en la terminal de Alire el siguiente comando:
```
alr run
```
