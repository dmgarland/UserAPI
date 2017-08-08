json.array! @projects do |project|
  json.name project.name
  json.description project.description
  json.link project.link
  json.description project.description
  json.imgUrl project.img_url
end