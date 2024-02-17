separate ( simulation )
protected body printer Is
	procedure println(str:in string) is 
	begin 
		ada.text_io.put_line(str);
	end println;
	procedure print_matrix is
	begin
		for i in 1..10 loop
			for j in 1..10 loop
				if map.object(i,j).status=false then
					ada.text_io.put("EMPTY");
				else 
					ada.text_io.put(kuzdofelek'image(map.object(i,j).side));
				end if; 
			end loop;
			ada.text_io.put_line("");
		end loop;
		ada.text_io.put_line("");
	end print_matrix;
end printer;
	
		
	