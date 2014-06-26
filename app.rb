require "sinatra/base"

class MyApp < Sinatra::Application

  def initialize
    super
    @items = ["item 1", "item 2", "item 3"]
  end

  get "/" do
    erb :index, :locals => {:items => @items.length}
  end

  get "/items" do
   filter = params[:filter]
      @filtered_items= @items
       @filtered_items= @items.select {|x| x.include?(filter)} unless filter == nil
  erb :items
  end

  get "/items/new" do
    erb :new
  end

 get "/items/:identifier" do
   identifier = params[:identifier]
   "You are at #{identifier}"
 end

  run! if app_file == $0
end
