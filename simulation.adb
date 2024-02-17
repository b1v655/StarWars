--valamiért csak egy task induj útnak, majd az is terminál egy függvényhívás után :( 
with ada.text_io;
with ada.numerics.discrete_random;
procedure simulation is 
	
	type kuzdofelek is (Imperial,Rebel);
	
	
	Task type base(nation:integer) Is
		Entry Send_Out_Ships(num_of_ships:Integer);
		Entry Ship_Lost;
		Entry Destroy;
	End base;
	
	
	Task type ship(id:Integer;side:kuzdofelek) Is
		Entry hit;
		Entry call_back;
	End ship;
	
	
	Task projectile Is
		Entry start(side: kuzdofelek);
	End projectile;
	
	
	
	type ship_pointer Is Access  ship;
	type base_pointer is access base;
	type field is record
		point:ship_pointer;
		side:kuzdofelek;
		status:Boolean;
	end record;
	
	type multidimensional is array(1..10,1..10) of field;
	type sidesarray is array(kuzdofelek'first..kuzdofelek'last) of base_pointer;
	protected Safe_Random is
		Procedure rand(x,y:in out Integer);
	end Safe_Random;

	
	protected Printer is
		procedure println(str:in String);
		procedure print_matrix;
	end Printer;
	
	
	protected map Is
		procedure kill(x,y:in out integer);
		function object(x,y:integer) return field;
		procedure init;
		procedure End_Fight;
		
		private
			matrix:multidimensional;
	End map;

	
	protected sides is
		
		procedure init;
		procedure destroy;
		procedure sendingship(side: in kuzdofelek;num:in integer);
		procedure hitting(side:in kuzdofelek);
		private
			sarr:sidesarray;
	end sides;
		protected body map Is Separate;
	protected body sides Is Separate;
	Task Body base Is Separate;
	Task Body projectile Is Separate;
	Task Body ship Is Separate;
		protected Body Safe_Random Is Separate;
		protected Body printer Is Separate;

luke:ship_pointer;		
begin
	
	
	sides.init;
	
	map.init;
	sides.destroy;
	delay 5.0;
	ada.text_io.put_line("itt vagyok");
	loop
	luke:=new ship(101,kuzdofelek'last);
	end loop;
end simulation;