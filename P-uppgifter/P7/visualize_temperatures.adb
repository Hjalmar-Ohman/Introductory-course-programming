--This program visualizes temperature data from text files thats given as an argument via the terminal.

--The temperature data text files must be in the format: 
--Day number (from Jan 1st), Hour of measurement, Temperature
--For example:
--  1    0 -28.4
--  1    3 -27.3

with Ada.Text_IO;use Ada.Text_IO;
with Ada.Integer_Text_IO;use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;use Ada.Float_Text_IO;

with Ada.Command_Line;use Ada.Command_Line;

procedure Visualize_Temperatures is
   
   type Temp_Type is array (1..20) of Integer;
   type Data_type is array (1..12) of Temp_Type;
   
   function L_Boundary(I: in Integer) return Float is
   begin
      return 45.0-5.0*Float(I-1);
   end L_Boundary;
   
   function R_Boundary(I: in Integer) return Float is
   begin
      return 50.0-5.0*Float(I-1);
   end R_Boundary;
   
   Txt, F_Out: File_Type;

   Day, D_Track, D_Last: Integer:=0;
   Time: Integer:=0;
   Period: Integer:=1;
   
   Temp: Float:=0.0;
   Data: Data_Type;

begin
   Open(Txt, In_File, Argument(1));
   Create(F_Out, Out_File, "Result.txt");
   
   --Reset data structure 
   for I in Data'Range loop
      for J in Temp_Type'Range loop
   	 Data(I)(J):=0;
      end loop;
   end loop;
   
   --Print headline in out-file
   Put(F_Out, "          |Perioder");
   New_Line(F_Out);
   
   Put(F_Out, "Temperatur|");
   for I in Data_Type'Range loop
      Put(F_Out, I, Width=>4);
   end loop;
   New_Line(F_Out);
   
   for I in 1..11 loop -- Length of "Temperatur|"
      Put(F_Out, '=');
   end loop; 
   for I in 1..4 loop
      for J in Data_Type'range loop -- 4x '=' per period
	 Put(F_Out, '=');
      end loop;
   end loop;
   

   --Read in-file
   while not End_Of_File(Txt) loop
      while not End_Of_Line(Txt) loop
   	 D_Last:= Day;

   	 Get(Txt, Day);
   	 Get(Txt, Time);
   	 Get(Txt, Temp);
	 
   	 --Check if new day
   	 if D_Last/= Day or D_Track=0 then
   	    D_Track:= D_Track  + 1;

	    --Check if new period
   	    if Float(D_Track)/30.0 > 1.0 then
   	       Period:= Period+1;
   	       D_Track:= 0;
   	    end if;
   	 end if;
	 exit when Period>12;
	 
   	 --Assign Temp to correct interval
   	 for I in Temp_Type'range loop
   	    if Temp in L_Boundary(I)..R_Boundary(I) and Temp /= L_Boundary(I) then
	       Data(Period)(I):= Data(Period)(I) + 1;
	    end if;
   	 end loop; 
	 
      end loop;
      Skip_Line(Txt);
      exit when Period>12;
   end loop;


   --Print data to out-file
   for Row in Temp_Type'Range loop
      New_Line(F_Out);
      
      Put(F_Out, "]");
      Put(F_Out, Integer(L_Boundary(Row)), Width=>3);
      Put(F_Out, " -");
      Put(F_Out, Integer(R_Boundary(Row)), Width=>4);
      Put(F_Out, ']');
      
      for Period in Data_Type'Range loop
	 if Data(Period)(Row) /= 0 then
	    Put(F_Out, Data(Period)(Row), Width=>4);
	 else
	    Put(F_Out, "____");
	 end if;
      end loop;
   end loop;

   Close(Txt);
   Close(F_Out);
   
end Visualize_Temperatures;
