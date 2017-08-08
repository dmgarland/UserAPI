json.array! @users do |user|
  json.first_name user.first_name
  json.last_name user.last_name
  json.job_title user.job_title
  json.location user.location
  json.tagline user.tagline
  json.img_url user.img_url
end