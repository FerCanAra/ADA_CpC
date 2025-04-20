-- Control por computador 2025
-- Práctica 2. Aplicación de un sistema de control de tiempo real a un robot móvil tipo Ackermann.
-- Fecha: 21/04/2025
-- Autor: Fernando Cañadas Aránega, profesor del Dpto. de Ingeniería Electrónica y Automática. 
-- Universidad de Almería, España
-- Contacto: fernando.ca@ual.es
-- Personal web: https://linktr.ee/FerCanAra
-- License: Apache-2.0. Todos los derechos de autor estan reservados

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Robot_Ackermann; use Robot_Ackermann;

procedure Robot_CpC2025 is

   ----------------- Parametros de simulación -----------------
   tsim       : constant Positive := 200;
   T_muestreo : constant Float    := 0.5;
   t, t0, tfin  : Time;
   Ts : Time_Span := Milliseconds (Integer (T_muestreo * 1_000.0)); -- 0.5 s

   ----------------- Parametros de control -----------------
   rx, ry, pos_x, pos_y, ori_theta, e_x, e_y, v_ref, v_real, beta, e_theta, psi_real, 
   K_nu, K_po, Long: Float;
   Ngrupo : Integer;
   CpC25 : constant Float := -0.4 / 24.0;
   type Target_X is array (1 .. 6) of Float;  -- Referencia en X
   type Target_Y is array (1 .. 6) of Float;  -- Referencia en Y

   ----------------- Definición de coordenadas ----------------- 
   Target_X_r : constant Target_X :=  (100.0, 300.0, 400.0, 300.0, 100.0, 0.0);
   Target_Y_r : constant Target_Y :=  (100.0, 150.0, 100.0, 150.0, 250.0, 0.0);

   ------------------ Variables de simulación ----------------- 
   Control_Robot : AgriCobIoT;
   M : Robot_State;

begin

   ------------- Inicialización de parametros ----------------- 
   -- IMPORTANTE: DEFINIR NUMERO DE GRUPO
   Ngrupo := 10; -- Ejemplo, Grupo Nº 10
   Long := CpC25 * Float(Ngrupo - 1) + 0.8;
   M.L := Long; -- Longitud del robot
   M.Ts := T_muestreo; -- Tiempo de muestreo
   Initialize_Robot (Control_Robot, M); 

   ----------------- Variables temporales ----------------- 
   t    := Clock;
   t0   := Clock;
   tfin := t0 + Seconds (tsim);

   ----------------- Iniciación de variables ----------------- 
   rx         := 0.0;
   ry         := 0.0;
   pos_x      := 0.0;
   pos_y      := 0.0;
   ori_theta  := 0.0;
   e_x        := 0.0;
   e_y        := 0.0;
   v_ref      := 0.0; 
   v_real     := 0.0;
   beta       := 0.0;
   e_theta    := 0.0;
   psi_real   := 0.0;
   K_nu       := 1.0;  -- Ganancia para el control de velocidad
   K_po       := 5.0;  -- Ganancia para el control de ángulo

   loop
      ---------------  REFERENCIA  -------------------------
       if t >= t0 + Seconds (5) then
         rx := Target_X_r(1);
         ry := Target_Y_r(1);
         if t >= t0 + Seconds (50) then
            rx := Target_X_r(2);
            ry := Target_Y_r(2);
         end if;
         if t >= t0 + Seconds (70) then
            rx := Target_X_r(3);
            ry := Target_Y_r(3);
         end if;
         if t >= t0 + Seconds (100) then
            rx := Target_X_r(4);
            ry := Target_Y_r(4);
         end if;
         if t >= t0 + Seconds (125) then
            rx := Target_X_r(5);
            ry := Target_Y_r(5);
         end if;
         if t >= t0 + Seconds (150) then
            rx := Target_X_r(6);
            ry := Target_Y_r(6);
         end if;
      end if;

      ---------------  LECTURA DE DATOS  -------------------------
      pos_x       := x (Control_Robot);
      pos_y       := y (Control_Robot);
      ori_theta   := theta (Control_Robot);

      -----------------  REFERENCIA  -------------------------
      e_x     := rx - pos_x;
      e_y     := ry - pos_y;

      -- Cálculo del ángulo deseado (beta) usando atan2
      if e_x = 0.0 and e_y = 0.0 then
         beta := 0.0; 
      else
         beta := Arctan(Y => e_y, X => e_x);
      end if;

      -- Calcular el error angular
      e_theta := beta - ori_theta;

      -- Normalización del error angular al rango [-π, π]
      e_theta := e_theta - 2.0 * Ada.Numerics.Pi * Float'Floor((e_theta + Ada.Numerics.Pi) / (2.0 * Ada.Numerics.Pi));

      --------------  CONTROL TRACCIÓN  -------------------------
      -- Distancia al punto mediante cálculo por Pitágoras
      if abs(e_x) <= 0.001 and abs(e_y) <= 0.001 then
         v_ref := 0.0;
      else
         v_real := K_nu * Sqrt(e_x**2 + e_y**2);
      end if;

      -- Límite de velocidad
      v_real := Float'Min(v_real, 10.0);  -- Límite superior
      v_real := Float'Max(v_real, -10.0); -- Límite inferior

      --------------  CONTROL DIRECCIÓN  -------------------------
      psi_real := K_po * e_theta;

      -- Límite físico de giro
      psi_real := Float'Min(psi_real, Ada.Numerics.Pi / 4.0);  -- Límite superior (45 grados)
      psi_real := Float'Max(psi_real, -Ada.Numerics.Pi / 4.0); -- Límite inferior (-45 grados)

      --------------  ESCRITURA DE DATOS  -------------------------
      v(Control_Robot, v_real);
      psi(Control_Robot, psi_real);

      ------------  MOSTRAR DATOS PANTALLA  -----------------------
      Put_Line("--- Datos del Robot ---");
      Put_Line("Error: X (" & Float'Image(e_x) & "), Y (" & Float'Image(e_y) & ")");
      Put_Line("Velocidad: " & Float'Image(v_real) & " [m/s]");
      Put_Line("Angulo direccion: " & Float'Image(psi_real * 180.0 / Ada.Numerics.Pi) & " [deg]");
      Put_Line("Posicion: X (" & Float'Image(pos_x) & "), Y (" & Float'Image(pos_y) & ")");
      New_Line;

      t := t + Ts;
      exit when t >= tfin;
      delay until t;

   end loop;

end Robot_CpC2025;