with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

with Ada.Numerics.Discrete_Random;

procedure P3hjaoh is
   
   subtype Mitt_Intervall is Integer range -100..100;
   
   package Mitt_Paket is new Ada.Numerics.Discrete_Random(Mitt_Intervall);
   use Mitt_Paket;
   
   type Time_Type is record
      Sec: Integer:=0;
      Min: Integer:=0;
      Hrs: Integer:=0;
   end record;
   
   type Position_Type is record
      X:Integer;
      Y:Integer;
      Z:Integer;
   end record;
   
   
   type Information_Type is record
      Time: Time_Type;
      Position: Position_Type;
      Name: String(1..5);
      
   end record;
   
   type Data_Type is array(1..(5*60*60/10)) of Information_Type;
   
   function Distance(X, Y, Z: in Integer) return Float is
      
   begin
      
      return sqrt(Float((X * X + Y * Y + Z * Z)));
   end Distance;
   
   
   G:Generator;
   
   
   Max_Distance: Float:=0.0;
   
   Drone_Name: String(1..5);
   Database: Data_Type;
begin
   

   
   Put("Mata in drönarens ID: ");
   Get(Drone_Name);
   
   
   for I in Data_Type'Range loop

      
      Database(I).Name:=Drone_Name;
      
      if Database(I).Time.Sec >= 60 then
	 Database(I).Time.Sec:= Database(I).Time.Sec mod 60;
	 Database(I).Time.Min:= Database(I).Time.Min +1;
      end if;
      
      if Database(I).Time.Min >= 60 then
	 Database(I).Time.Min:= Database(I).Time.Min mod 60;
	 Database(I).Time.Hrs:= Database(I).Time.Hrs +1;
      end if;
      

      Database(I).Position.X := Random(G);
      Database(I).Position.Y := Random(G);
      Database(I).Position.Z := Random(G);
      
      Database(I).Time.Sec := Database(I).Time.Sec + 5;
   end loop;
   
   for I in Data_Type'Range loop
      
      if Distance(Database(I).Position.X,Database(I).Position.Y,Database(I).Position.Z) > Max_Distance then
	 
	 Max_Distance := Distance(Database(I).Position.X,Database(I).Position.Y,Database(I).Position.Z);
	 
      end if;
   end loop;
   
   Put(Drone_Name);
   Put(" har varit ");
   Put(Max_Distance, Exp=>0, Aft=>2);
   Put(" meter bort från bikupan som längst.");
   

end P3hjaoh;
