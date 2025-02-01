# ADA for Computer Control Students - University of Almería - B. in Electronic Engineering and Industrial Automation - 2024/2025

Repository with the necessary packages and instructions for programming ADA in VisualStudioCode on Windows (10 and 11), Linux and MAC.

> **Note:** Process tested with Windows 11 on 1st February 2025.

# 1. Download install

Download all the necessary software to be used. We will use [VisualStudioCode](https://code.visualstudio.com/download) as a visualiser, [Alire](https://alire.ada.dev/) as manager and AdaCore as compiler. For the compiler, if your OS is Windows 10 or 11, download the file ```gnatstudio-25.0w-20240506-x86_64-windows64-bin.exe``` from [AdaCore - GitHub](https://github.com/AdaCore/gnatstudio/releases), if it's Linux 18.04 or later, download the file ```GNAT_Studio-x86_64.AppImage``` from [AdaCore - GitHub](https://github.com/AdaCore/gnatstudio/releases) and, if you use MAC, download the file ```gnat-2020-20200818-x86_64-darwin-bin.dmg``` from [AdaCore - GNAT web](https://www.adacore.com/download/more)

# 2. Package install

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
# 3. Añade las direcciones de los compiladores a SO (Solo usuarios de Windows 10 o 11)

Ubica la carpeta donde instalaste GNAT Studio y Alire. Generalmente, estará en algo como ```C:\GNATSTUDIO\bin``` y ```C:\Program Files\Alire\bin```. Siga los siguientes pasos para añadir a variables de entorno:

1. Presiona Win + S y escribe "Variables de entorno".
2. Haz clic en "Editar las variables de entorno del sistema".
3. En la sección "Variables del sistema", busca la variable llamada Path y selecciona Editar.
4. Haz clic en Nuevo.
5. Agrega la ruta completa al directorio bin de GNAT Studio "C:\GNATSTUDIO\bin" y Alire "C:\Program Files\Alire\bin".

Verifica que se ha instalado correctamente pulsado la tecla Windows, escribe ```cmd``` y, en la ventana emergente, escriba ```gnatstudio``` y pulse Enter. Si se abre el compilador, se ha añadido correctamente la dirección.

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
3. Compila el proyecto
```
alr build
```
Ahora, pulse la tecla Windows y escriba VisualStduio. En el programa emergente, siga las siguientes instrucciones:

1. Vaya a Archivo y abrir carpeta. Navegue hasta esta carpeta ```C:\Nombre_proyecto```.
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
