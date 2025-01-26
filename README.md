# ADA_CpC
Package to Install ADA in Visual Studio Code Windows 11
# AUGMENTED REALITY FOR THE PROJECT AGRICOBIOT

##### GNAT STUDIO COMPILER
[AdaCore from GNAT web](https://www.adacore.com/download/more)
Download: gnat-2021-20210519-x86_64-windows64-bin.exe

[AdaCore from GitHub](https://github.com/AdaCore/gnatstudio/releases)
Dowload: gnatstudio-25.0w-20240506-x86_64-windows64-bin.exe

[Alire](https://alire.ada.dev/)

# ADD PAHT TO WINDOWS

##### Ubica la carpeta donde instalaste GNAT Studioy Alire. Generalmente, estará en algo como:
```
C:\GNATSTUDIO\bin
C:\Program Files\Alire\bin
```
Nota: Asegúrate de encontrar el archivo ejecutable principal "gnatstudio.exe".

##### Añadir a variables de entorno
1. Presiona Win + S y escribe "Variables de entorno".
2. Haz clic en "Editar las variables de entorno del sistema".
3. En la sección "Variables del sistema", busca la variable llamada Path y selecciona Editar.
4. Haz clic en Nuevo.
5. Agrega la ruta completa al directorio bin de GNAT Studio "C:\GNATSTUDIO\bin" y Alire "C:\Program Files\Alire\bin".

##### Crear un proyecto
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
6. Ahora, puedes pulsar el boton "Play" y observar la terminal que aparece:
```
Voy a aprobar CpC
```


```
alr run
```
```

cd ~/
git clone https://github.com/RobotecAI/ros2-for-unity.git
cd ~/ros2-for-unity
./pull_repositories.sh
./build.sh # If your build was prepared with --standalone flag then you are fine, and all you have to do is run the editor
# It will take 20 min

``` 
> **Note:** If you see `"No ROS environment sourced. You need to source your ROS2 (..)"` message in Unity3D Editor, it means your environment was not sourced properly. This could happen if you run Unity but it redirects to Hub and ignores your console environment variables (this behavior can depend on Unity3D version). In such case, run `nano ~/.profile` and adds at the end `source /opt/ros/foxy/setup.bash`. For this to take effect, you must log back into Unity Hub by restarting the PC.
