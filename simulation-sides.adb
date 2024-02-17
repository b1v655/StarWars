separate ( simulation )
protected body sides is
	procedure init is
	begin
		sarr(kuzdofelek'first):=new base(1);
		sarr(kuzdofelek'last):=new base(2);
	end init;
	procedure destroy is
	begin
		sarr(kuzdofelek'first).all.destroy;
	end destroy;
	procedure sendingship(side: in kuzdofelek;num:in integer) is
	begin 
		sarr(side).all.send_out_ships(num);
	end sendingship;
	procedure hitting(side:in kuzdofelek) is
	begin
		sarr(side).all.ship_lost;
	end hitting;
end sides;