# json.stories @stories do |story|
#   json.title story.title
#   json.content story.content
#   json.image image_path(story.photofiles.first.image.url)
# end

json.stories do |storiesElement|
  storiesElement.array!(@stories) do |story|
    json.extract! story, :id, :title, :content
    json.image image_path(story.photofiles.first.image.url)
  end
end