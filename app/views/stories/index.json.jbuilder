json.stories @stories do |story|
  json.title story.title
  json.content story.content
  json.image image_tag(story.photofiles.first.image.url)
end