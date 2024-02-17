separate ( simulation )
task body ship is
l:boolean:=true;
begin
	while l loop
		select
			accept hit Do
				sides.hitting(side);
			End hit;
		or 
			Accept Call_Back Do
				l:=true;
			End Call_Back;
		or 
			delay 0.5;
			projectile.start(side);
		end select;
	end loop;
end ship;
