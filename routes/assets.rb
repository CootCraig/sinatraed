configure(:production) do
  set(:scss, :style => :compact)
end

%w{common styles}.each do |stylesheet|
  get("/stylesheets/#{stylesheet}.css") do
    content_type('text/css', :charset => 'utf-8')
    render(:scss, :"stylesheets/#{stylesheet}")
  end
end
