class Lamen
    def initialize
        @cooking_time
    end

    def init(cooking_time)
        @cooking_time = cooking_time
    end 

    def get_minimum_time(hourglass_a, hourglass_b)
        # It's not possible discover the solution at the even, even, odd combination
        if (hourglass_a % 2 == 0 && hourglass_b % 2 == 0 && @cooking_time % 2 == 1)
			return 0
        end
         
        # It's not possible get a result from a even combination from the hourglasses. 
        if (([hourglass_a, hourglass_b].max % [hourglass_a, hourglass_b].min) == 0)
            return 0
        end

        x = 1
        y = 1

		while ((hourglass_a * x - hourglass_b * y).abs != @cooking_time) do
            if (x * hourglass_a == y * hourglass_b)
				return 0
            end

			if ((x * hourglass_a) < (y * hourglass_b)) 
				x += 1
			else 
				y += 1
            end
		end
 
        p x
        p y
		return ([x * hourglass_a, y * hourglass_b].max)
    end
end


# test
lamen = Lamen.new
lamen.init(3)
p lamen.get_minimum_time(5, 7)
