post '/write' do
  # save post to database
  p params

  p = Post.create(title: params[:title], body: params[:body])
  bunch_o_tags = params[:tags].split(',')
  # puts bunch_o_tags.class
  # puts "p is..."
  # p.inspect
  bunch_o_tags.each do |singletag|
    p.tags << Tag.create(tag: singletag)
  end
  @all_posts = Post.all

  "done"

end
