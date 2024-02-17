separate ( simulation )
protected body map is 
	procedure kill(x,y: in out integer) is
	begin 
		matrix(x,y).status:=false;
		printer.print_matrix;
	end kill;
	
	function object(x,y: integer) return field is
	begin
		return matrix(x,y);
	end object;
	procedure init is
	begin
		for i in 1..10 loop
			for j in 1..5 loop
			matrix(i,j).side:=kuzdofelek'first;
			matrix(i,j).status:=true;
			matrix(i,j).point:=new ship(i*j,kuzdofelek'first);
			end loop;
		end loop;
		sides.sendingship(kuzdofelek'first,50);
		for i in 1..10 loop
			for j in 6..10 loop
			matrix(i,j).side:=kuzdofelek'last;
			matrix(i,j).status:=true;
			matrix(i,j).point:=new ship(i*j,kuzdofelek'last);
			end loop;
		end loop;
		sides.sendingship(kuzdofelek'last,50);
		printer.print_matrix;
	end init;
	procedure End_Fight is 
	begin
		for i in 1..10 loop
			for j in 1..10 loop
			
				matrix(i,j).status:=false;
			
			end loop;
		end loop;
	end end_fight;
end map;