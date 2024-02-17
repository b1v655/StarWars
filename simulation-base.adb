separate ( simulation )
task body base is
	snum:Integer;
begin
	loop
		select
		
			Accept send_out_ships(num_of_ships: in Integer) do
				snum:=num_of_ships;
				ada.text_io.put_line(integer'image(snum));
			end send_out_ships;
		or
			accept ship_lost do
				snum:=snum-1;
			end ship_lost;
		or
			accept destroy do
				snum:=0;
				map.End_Fight;
				
				for x in 1..10 loop
				for y in 1..10 loop
				if not map.object(x,y).point.all'terminated then
					map.object(x,y).point.all.hit;
					printer.print_matrix;
				end if;
				end loop;
				end loop;
				end destroy;
		or
			terminate;
		end select;
	end loop;
end base;
	


