# ADA for Computer Control Students - University of Almería - B. in Electronic Engineering and Industrial Automation - 2024/2025

Repository with the necessary packages and instructions for programming ADA in VisualStudioCode on Windows (10 and 11), Linux and MAC.

> **Note:** Process tested with Windows 11 on 1st February 2025.

### 1. Download install

Download all the necessary software to be used. We will use [VisualStudioCode](https://code.visualstudio.com/download) as a visualiser, [Alire](https://alire.ada.dev/) as manager and AdaCore as compiler. For the compiler, if your OS is Windows 10 or 11, download the file ```gnatstudio-25.0w-20240506-x86_64-windows64-bin.exe``` from [AdaCore - GitHub](https://github.com/AdaCore/gnatstudio/releases), if it's Linux 18.04 or later, download the file ```GNAT_Studio-x86_64.AppImage``` from [AdaCore - GitHub](https://github.com/AdaCore/gnatstudio/releases) and, if you use MAC, download the file ```gnat-2020-20200818-x86_64-darwin-bin.dmg``` from [AdaCore - GNAT web](https://www.adacore.com/download/more)

### 2. Package install

Para Windows o MAC, simplemente pulse dos veces en el ejecutador y instale los programas en la ruta predeterminada. Para Linux, siga los siguientes commandos:

Ve a la ubicación de descarga del archive ```GNAT_Studio-x86_64.AppImage``` y abra una terminal. Ejecuta este comando:
```
chmod -x GNAT_Studio-x86_64.AppImage
```
Posteriormente, ejecuta la imagen con los siguientes commandos:
```
./GNAT_Studio-x86_64.AppImage --appimage-extract
./squashfs-root/usr/doinstall
```
### 2. Añade las direcciones de los compiladores a SO (Solo usuarios de Windows 10 o 11)

Ubica la carpeta donde instalaste GNAT Studio y Alire. Generalmente, estará en algo como ```C:\GNATSTUDIO\bin``` y ```C:\Program Files\Alire\bin```.
> **Note:** Asegúrate de encontrar el archivo ejecutable principal "gnatstudio.exe".



# Añadir a variables de entorno
1. Presiona Win + S y escribe "Variables de entorno".
2. Haz clic en "Editar las variables de entorno del sistema".
3. En la sección "Variables del sistema", busca la variable llamada Path y selecciona Editar.
4. Haz clic en Nuevo.
5. Agrega la ruta completa al directorio bin de GNAT Studio "C:\GNATSTUDIO\bin" y Alire "C:\Program Files\Alire\bin".

# Crear un proyecto
1. Abre Alire para visualizar una ventana de comandos. Para crear un proyecto, ejecuta:
```
alr init nombre_proyecto
```
2. En la siguiente acción, pulsa 2 y presiona Enter
```
Select the kind of crate you want to create:
  1. LIBRARY
  2. BINARY
```
3. Compila el proyecto
```
alr build
```
4. Abre VisualStudio y abre la carpeta en la dirección "".
5. Abre src y tendrás tu codigo. Prueba que todo funciona pegando este codigo:
```
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin
    Put_Line("Voy a aprobar CpC");
end Main;
```
6. Ahora, puedes ejecutar el codigo de dos formas:
   a) Puedes pulsar el boton "Play" y observar la terminal que aparece:
```
Voy a aprobar CpC
```
   b) Ejecuta en la terminal de Alire el siguiente comando:
```
alr run
```
