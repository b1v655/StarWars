separate ( simulation )
task body projectile is
x,y:Integer;
begin
	
	accept start(side:kuzdofelek) do
		safe_random.rand(x,y);
		if side/=map.object(x,y).side then
			map.kill(x,y);
			
			map.object(x,y).point.all.hit;
		end if;
	end start;
end projectile;