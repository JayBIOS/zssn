class SurvivorService
  def initialize(params)
    @id = params[:id]
    @name = params[:name]
    @age = params[:age]
    @gender = params[:gender]
    @latitude, @longitude = coordinates_from params[:last_location]
    @inventory = inventory_from params[:inventory]
  end

  def register
    params = { name: @name,
               age: @age,
               gender: @gender,
               latitude: @latitude,
               longitude: @longitude }
    params[:inventory_attributes] = @inventory unless @inventory.nil?
    Survivor.new(params)
  end

  def update
    survivor = Survivor.find(@id)
    survivor.latitude = @latitude
    survivor.longitude = @longitude
    survivor
  end

  private

  def coordinates_from(value)
    return [nil, nil] if value.nil?
    value.split(',').collect(&:to_f)
  end

  def inventory_from(value)
    return if value.nil?
    { stacks_attributes: stacks_from(value) }
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