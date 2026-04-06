with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Robot_Ackermann is

   --------------  INICIALIZATION  -------------------------
   procedure Initialize_Robot (Robot_control : in out AgriCobIoT; M : Robot_State) is
   begin
      Robot_control.initialise (M);
   end Initialize_Robot;

   ------------  DECLARATION  -------------------------
   -- Output Ackermann Robot
   function x (Robot_control : in out AgriCobIoT) return Float is
      x_value : Float;
   begin
      Robot_control.Read (x_value, 1);
      return x_value;
   end x;

   function y (Robot_control : in out AgriCobIoT) return Float is
      y_value : Float;
   begin
      Robot_control.Read (y_value, 2);
      return y_value;
   end y;

   function theta (Robot_control : in out AgriCobIoT) return Float is
      theta_value : Float;
   begin
      Robot_control.Read (theta_value, 3);
      return theta_value;
   end theta;

   -- Input Ackermann Robot
   procedure v (Robot_control : in out AgriCobIoT; Value : Float) is
   begin
      Robot_control.write (value, 1);
   end v;

   procedure psi (Robot_control : in out AgriCobIoT; Value : Float) is
   begin
      Robot_control.write (value, 2);
   end psi;

   ------------  MAIN ROBOT  -------------------------

   protected body AgriCobIoT is
      procedure initialise (Model : Robot_State) is
      begin
         M := Model;  -- Copia del registro completo
         t := Clock;
         initialised := True;  -- Inicialización correcta
      end initialise;

      entry Read (Value : out Float; odometry : odom) when initialised is
      begin
         update_states (t, x, y, theta, v, psi, M);
         case odometry is
            when 1 =>
               Value := x;
            when 2 =>
               Value := y;
            when 3 =>
               Value := theta;
         end case;
      end Read;

      entry Write (Value : in Float; navegation : System) when initialised is
      begin
         update_states (t, x, y, theta, v, psi, M);
         case navegation is
            when 1 =>
               v := Value;
            when 2 =>
               psi := Value;
         end case;
      end Write;

      procedure update_states (t  : in out Time; x : in out Float; y : in out Float;  theta : in out Float; v : in out Float;
         psi : in out Float; Model : Robot_State) is

         x_r              : Float     := x;
         y_r              : Float     := y;
         theta_r          : Float     := theta;
         L                : Float     := Model.L;
         t0               : Time      := t;
         dt0              : Time_Span := Seconds (0);
         dt               : Time_Span;
         t_step           : Float     := 0.001;
         simulation_speed : Positive  := Model.simulation_speed;

      begin
         t  := Clock;
         dt := (t - t0) * Integer (simulation_speed);

         while dt0 <= dt loop
            -- Integración del modelo
            theta_r := (v * Tan(psi * Ada.Numerics.Pi / 180.0)) / L;
            theta := theta + theta_r * t_step;
            x := x + v * Cos(theta) * t_step;
            y := y + v * Sin(theta) * t_step;

            dt0 := dt0 + Milliseconds (Integer (t_step * 1_000.0));
         end loop;
      end update_states;

   end AgriCobIoT;
end Robot_Ackermann;