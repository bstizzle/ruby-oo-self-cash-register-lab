class CashRegister
    def initialize(discount=0)
        @total = 0.00
        @discount = discount
        @items = []
        @prices = {}
    end

    attr_accessor :total, :discount, :items, :prices 

    def add_item(title, price, quantity=1)
        @total += price * quantity 
        @prices[title] = price * quantity
        quantity.times do
            @items << title
        end
    end 

    def apply_discount 
        if @discount != 0
            @total -= @total * (@discount.to_f/100)
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end 
    end

    def void_last_transaction
        last_item = @items.pop
        @total -= @prices[last_item]
    end 
end 
