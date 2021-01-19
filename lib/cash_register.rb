class CashRegister

    class CashRegisterItem
        attr_accessor :title, :price, :quantity

        def initialize(title, price, quantity)
            @title = title
            @price = price
            @quantity = quantity
        end        
    end

    attr_reader :discount
    attr_accessor :total

    def initialize(discount = 0.0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @items << CashRegisterItem.new(title, price, quantity)
        @total += (price * quantity)
    end

    def apply_discount
        if (@discount == 0)
            return "There is no discount to apply."
        end

        @total = @total * (100.0-@discount)/100
        return "After the discount, the total comes to $#{@total.to_i}."
    end

    def items
        result = []
        @items.each do |item|
            i = 1
            while i <= item.quantity
                result << item.title
                i += 1
            end
        end
        result
    end

    def void_last_transaction
        last_item = @items.pop
        @total -= (last_item.price * last_item.quantity)
        if (@items.length == 0)
            @total = 0.0
        end
    end

end