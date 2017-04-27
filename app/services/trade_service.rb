class TradeService
  def initialize(params)
    @buyer = Survivor.find(params[:buyer])
    @dealer = Survivor.find(params[:id])
    @offer = stacks_from params[:offer]
    @pick = stacks_from params[:pick]
  end

  def exchange
    return { error: 'You are infected, you can not trade!' } if @buyer.infected?
    return { error: "You're trying to trade with an infected person. You can't!" } if @dealer.infected?
    return { error: 'You can not afford this exchange!' } unless @buyer.inventory.can_afford? @offer
    return { error: 'Your offer is too expensive!' } unless @dealer.inventory.can_afford? @pick

    return { error: 'Not a fair trade!' } unless same_amount?(@offer, @pick)

    transfer @dealer, @buyer, @pick
    transfer @buyer, @dealer, @offer

    { message: 'Trade with success!' }
  end

  def transfer(from, to, stacks)
    stacks.each do |stack|
      from_stack = from.inventory.stacks.where(item_id: stack[:item].id).first
      to_stack = to.inventory.stacks.where(item_id: stack[:item].id).first
      if to_stack.nil?
        to.inventory.stacks << Stack.new(item: stack[:item], quantity: stack[:quantity])
      else
        to_stack.quantity += stack[:quantity]
        to_stack.save
      end
      from_stack.quantity -= stack[:quantity]
      if from_stack.quantity <= 0
        from_stack.destroy
      else
        from_stack.save
      end
    end
  end

  def same_amount?(a, b)
    sum_a = a.map { |v| v[:quantity] * v[:item].value }.inject(0, :+)
    sum_b = b.map { |v| v[:quantity] * v[:item].value }.inject(0, :+)

    sum_a == sum_b
  end

  def stack_from(from)
    item_name, quantity = from.split(':')
    item = Item.where(name: item_name).first
    { quantity: quantity.to_i, item: item }
  end

  def stacks_from(from)
    from.split(',').collect { |v| stack_from v }
  end
end