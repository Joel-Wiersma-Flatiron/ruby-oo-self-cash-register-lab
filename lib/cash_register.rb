class CashRegister
    attr_accessor :discount, :total, :items
    def initialize(discount = 0)
        @total = 0.0
        @discount = discount
        @items = []
        @previous_prices = []
    end
    def add_item(title, price, quantity = 1)
        @total += (price * quantity)
        i = 0
        @previous_prices << (price * quantity)
        while i < quantity
            @items << title
            i += 1
        end
    end
    def apply_discount
        if @discount != 0
            @total *= (1 - (@discount.to_f / 100))
            puts "After the discount the total come to $#{@total}."
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end
    def void_last_transaction
        @items.pop
        @total -= @previous_prices.pop
    end
end
