with Ada.Text_IO;         use Ada.Text_IO;

with Wardrobe_Handling;   use Wardrobe_Handling;

procedure P4_2021_03_09_1730_1830 is
  
  Wardrobe: Wardrobe_Type(1 .. 17);
  
begin
  Wardrobe(1)  := Create_Clothing("Byxa",       'L',  2.4);
  Wardrobe(2)  := Create_Clothing("T-Shirt",    'U', 12.7);
  Wardrobe(3)  := Create_Clothing("Sandaler",   'F',  0.1);
  Wardrobe(4)  := Create_Clothing("Mössa",      'T',  3.6);
  Wardrobe(5)  := Create_Clothing("Lågskor",    'F',  7.2);
  Wardrobe(6)  := Create_Clothing("Kjol",       'L',  5.7);
  Wardrobe(7)  := Create_Clothing("Kavaj",      'U', 10.4);
  Wardrobe(8)  := Create_Clothing("Stövlar",    'F', -1.3);
  Wardrobe(9)  := Create_Clothing("Träskor",    'F',  2.0);
  Wardrobe(10) := Create_Clothing("Tröja",      'U',  6.4);
  Wardrobe(11) := Create_Clothing("Shorts",     'L',  9.9);
  Wardrobe(12) := Create_Clothing("Kilt",       'L',  1.4);
  Wardrobe(13) := Create_Clothing("Sockeplast", 'F',  0.0);
  Wardrobe(14) := Create_Clothing("Blus",       'U', 13.0);
  Wardrobe(15) := Create_Clothing("Mjukisar",   'L',  2.4);
  Wardrobe(16) := Create_Clothing("Hatt",       'T',  2.4);
  Wardrobe(17) := Create_Clothing("Klänning",   '!', 22.9);
  
  Put_Line("Hela garderoben:");
  Put(Wardrobe);
  New_Line;
  
  Put_Line("En uppsättning kläder:");
  Put(Create_Outfit(Wardrobe, 11, 14, 5, 16));
  New_Line;
  
  Put_Line("En uppsättning kläder:");
  Put(Create_Outfit(Wardrobe, 3, 2, 1, 16));
  New_Line;
  
  Put_Line("En uppsättning kläder:");
  Put(Create_Outfit(Wardrobe, 8, 4, 17));
  New_Line;
  
  
end P4_2021_03_09_1730_1830;
