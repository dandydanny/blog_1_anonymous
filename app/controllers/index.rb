get '/' do
  # Look in app/views/index.erb
  # list a bunch of blog posts
  @all_posts = Post.all
  erb :index
end
