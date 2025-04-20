with Ada.Real_Time; use Ada.Real_Time;

package Robot_Ackermann is

   type AgriCobIoT is limited private;
   -- State robot definition
   type Robot_State is record
      L                : Float    := 1.00000; -- Vehicle large [m]
      x                : Float    := 0.00000; -- X initial position [m]
      y                : Float    := 0.00000; -- Y initial position [m]
      theta            : Float    := 0.00000; -- Initial orientation [deg]
      v                : Float    := 0.00000; -- Initial velocity [m/s]
      psi              : Float    := 0.00000; -- Initial direction steering [deg] 
      Ts               : Float    := 0.50000; -- Sample time [s]
      initialised      : Boolean  := False;   -- Corrected spelling
      simulation_Speed : Positive := 1;
   end record;

   -- Inicialization
   procedure Initialize_Robot (Robot_control : in out AgriCobIoT; M : Robot_State);

   -- Ackermann output
   function x (Robot_control : in out AgriCobIoT) return Float;    -- X state robot akermann
   function y (Robot_control : in out AgriCobIoT) return Float;    -- Y state robot akermann
   function theta (Robot_control : in out AgriCobIoT) return Float;    -- theta state robot akermann
   -- Ackermann input
   procedure v (Robot_control : in out AgriCobIoT; Value : Float);   -- Write dutty cycle (0-100%) in transistor 1
   procedure psi (Robot_control : in out AgriCobIoT; Value : Float);   -- Write dutty cycle (0-100%) in transistor 2
 
private

   subtype odom is Positive range 1 .. 3;
   subtype System is Positive range 1 .. 2;

   protected type AgriCobIoT is
      entry Read (Value : out Float; odometry : in odom);
      entry Write (Value : in Float; navegation : in System);
      procedure initialise (Model : in Robot_State);
   private
      t          : Time;
      x          : Float;
      y          : Float;
      theta      : Float;
      v          : Float;
      psi        : Float;
      M          : Robot_State;
      initialised : Boolean := False;  -- Corrected spelling

      procedure update_states (t  : in out Time; x : in out Float; y : in out Float; theta : in out Float;
         v : in out Float; psi : in out Float; Model  : Robot_State);

   end AgriCobIoT;
end Robot_Ackermann;