separate ( simulation )
protected body safe_random is
	procedure rand(x,y:in out integer) is
		subtype num is Integer range 1 .. 10;
		package peldany is new Ada.Numerics.Discrete_Random (num);
		use peldany;
		G : Generator;
	begin
		Reset (G);
		x:=random(G);
		y:=random(G);
	end rand;
	
end safe_random;