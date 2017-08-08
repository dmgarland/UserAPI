json.array! @projects do |project|
  json.id project.id
  json.name project.name
  json.description project.description
  json.link project.link
  json.description project.description
  json.img_url project.img_url
  json.user_id project.user_id
end