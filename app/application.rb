

class Application

  @@items = [Item.new("iPhone",1000), Item.new("Hat",12), Item.new("Vape", 18)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      check_item = req.path.split("/items/").last
      @@items.detect do |item|
        binding.pry
        if item.name == check_item
        resp.write "#{item.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end


end
