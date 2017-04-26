class SurvivorService
  def initialize(params)
    @name = params[:name]
    @age = params[:age]
    @gender = params[:gender]
    @latitude, @longitude = coordinates_from params[:last_location]
    @inventory = inventory_from params[:inventory]
  end

  def register
    params = {
        name: @name,
        age: @age,
        gender: @gender,
        latitude: @latitude,
        longitude: @longitude
    }
    unless @inventory == nil
      params.merge!(inventory_attributes: @inventory)
    end
    Survivor.new(params)
  end

  private

  def coordinates_from(value)
    if value == nil
      return [nil, nil]
    end
    value.split(',').collect {|l| l.to_f}
  end

  def inventory_from(value)
    return if value == nil
    {stacks_attributes: stacks_from(value)}
  end

  def stack_from(from)
    item_name, quantity = from.split(':')
    item = Item.where(name: item_name).first
    {quantity: quantity.to_i, item: item}
  end

  def stacks_from(from)
    from.split(',').collect {|v| stack_from v}
  end
end