require 'sinatra'
require 'sequel'

before do
  @db = Sequel.connect('sqlite://todo.db')
  @todoings = @db[:todoings]
end

get '/' do
  erb :index
end

post '/' do
  @todoings.insert(item: params[:item])

  erb :index
end

post '/mark_done' do
  @todoings.where(id: params[:item]).update(done: 1)

  erb :index
end
