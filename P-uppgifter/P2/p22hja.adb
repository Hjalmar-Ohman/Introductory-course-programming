with Ada.Text_IO;use Ada.Text_IO;
with Ada.Integer_Text_IO;use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;use Ada.Float_Text_IO;


procedure p2hjaoh is
   

   
   procedure Dividers(Sum: in Integer) is
begin
     for I in 1..Sum loop
	    
   	    if Sum mod I = 0  then
   	       Put(I, Width=>0);
	       if I/=Sum then
		  Put(", ");
	       end if;
	       
   	    end if;
	    
   	 end loop;
end Dividers;


procedure Sum_new(Sum: in Integer;
		  N: in Integer) is
  Sum_New:Integer; 
begin
   Sum_New:= Sum+N;
   Put(Sum_New);
end Sum_new;

   
   
   
   function  Average(Sum:in Integer;
		     N_Count: in Integer) 
		    return Float is 
      
   begin
      return Float(Sum)/Float(N_Count);
   end Average;
   
   N:Integer;
   N_Count: Integer:=0;
   Sum:Integer:=0;

begin
   Put("Mata in heltal. Avsluta med 0: ");
      loop 
   	 Get(N);
   	 exit when N=0;
	 N_Count:= N_Count + 1;
	 
   	 Put("Summan är ");
	 Put(Sum_new(Sum, N), Width=>0);
	 
   	 Put(" och denna är jämnt delbar med ");
	 Dividers(Sum);
	 New_Line;
	 
      end loop;

   New_Line;
   
   Put("Medelvärdet av de inmatade heltalen var ");
   Put(Average(Sum, N_Count), Aft=> 3, Exp=>0);
   Put('.');
   
end p2hjaoh;
