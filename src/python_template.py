# Control por computador 2025
# Práctica 2. Aplicación de un sistema de control de tiempo real a un robot móvil tipo Ackermann.
# Fecha: 21/04/2025
# Autor: Fernando Cañadas Aránega, profesor del Dpto. de Ingeniería Electrónica y Automática. 
# Universidad de Almería, España
# Contacto: fernando.ca@ual.es
# Personal web: https://linktr.ee/FerCanAra
# License: Apache-2.0. Todos los derechos de autor estan reservados

# --------------------------------------- Liberías a utilizar ---------------------------------------
import matplotlib.pyplot as plt
import numpy as np
import time

# --------------------------------------- Nombre del archivo ----------------------------------------
filename = "robot.txt" # IMPORTANTE: Indicar el nombre del archivo a leer

# ------------------------------------- Configuración de la Figura ----------------------------------
fig = plt.figure(figsize=(12, 6))
grid = fig.add_gridspec(1, 2, width_ratios=[1, 1])

# Subgráfica izquierda para X e Y
ax_trayectoria = fig.add_subplot(grid[0])
ax_trayectoria.set_xlabel("Posición X")
ax_trayectoria.set_ylabel("Posición Y")
ax_trayectoria.set_title("Trayectoria y Referencia")
ax_trayectoria.grid(True)

# Subgráficas de la derecha
subgrid = grid[1].subgridspec(3, 1, hspace=0.5)
ax_error = fig.add_subplot(subgrid[0])
ax_velocidad = fig.add_subplot(subgrid[1])
ax_angulo = fig.add_subplot(subgrid[2])

# Datos iniciales vacíos
tiempo, angulo, velocidad, error, x, y = [], [], [], [], [], []

# Inicializar la subgráfica izquierda
linea_trayectoria, = ax_trayectoria.plot([], [], label="Trayectoria", color='m')
linea_referencia, = ax_trayectoria.plot([], [], label="Referencia", color='c', linestyle='--')
punto_inicio = ax_trayectoria.scatter([], [], color='g', marker='o', label="Inicio")
punto_final = ax_trayectoria.scatter([], [], color='r', marker='x', label="Fin")
ax_trayectoria.legend()

# Inicializar las subgráficas de la derecha
linea_error, = ax_error.plot([], [], label="Error", color='b')
ax_error.set_ylabel("Error (m)")
ax_error.set_title("Error de Trayectoria")
ax_error.grid(True)
ax_error.legend()

linea_velocidad, = ax_velocidad.plot([], [], label="Velocidad", color='g')
ax_velocidad.set_ylabel("Velocidad (m/s)")
ax_velocidad.set_title("Velocidad")
ax_velocidad.grid(True)
ax_velocidad.legend()

linea_angulo, = ax_angulo.plot([], [], label="Ángulo de dirección", color='r')
ax_angulo.set_ylabel("Ángulo (°)")
ax_angulo.set_title("Ángulo de Dirección")
ax_angulo.grid(True)
ax_angulo.legend()

fig.tight_layout()

# --------------------------------------- Función de actualización ---------------------------------------
def actualizar_grafico():
    with open(filename, "r") as file:
        lines = file.readlines()
    
    total_lineas = len(lines) - 1
    tiempo_transcurrido = 0

    x_ref = np.linspace(0, 10, 100)
    y_ref = 2 * np.sin(x_ref)

    for line in lines[1:]:
        valores = list(map(float, line.strip().split(",")))
        t, a, v, e, pos_x, pos_y = valores

        tiempo.append(tiempo_transcurrido)
        angulo.append(np.interp(np.degrees(a), [-2000, 2000], [-45, 45]))
        velocidad.append(v)
        error.append(e)
        x.append(pos_x)
        y.append(pos_y)

        linea_error.set_data(tiempo, error)
        linea_velocidad.set_data(tiempo, velocidad)
        linea_angulo.set_data(tiempo, angulo)
        linea_trayectoria.set_data(x, y)
        linea_referencia.set_data(x_ref, y_ref)

        if len(x) > 0:
            punto_inicio.set_offsets([[x[0], y[0]]])
            punto_final.set_offsets([[x[-1], y[-1]]])

        ax_trayectoria.set_xlim(0, 600)
        ax_trayectoria.set_ylim(0, 300)

        ax_error.set_xlim(0, total_lineas)
        ax_error.set_ylim(min(error) - 0.1, max(error) + 0.1)

        ax_velocidad.set_xlim(0, total_lineas)
        ax_velocidad.set_ylim(min(velocidad) - 0.1, max(velocidad) + 0.1)

        ax_angulo.set_xlim(0, total_lineas)
        ax_angulo.set_ylim(min(angulo) - 10, max(angulo) + 10)

        plt.pause(0.1)
        tiempo_transcurrido += 1

actualizar_grafico()
plt.show()
