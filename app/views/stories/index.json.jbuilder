json.stories @stories do |story|
  json.title story.title
  json.content story.content
  json.image image_path(story.photofiles.first.image.url)
end