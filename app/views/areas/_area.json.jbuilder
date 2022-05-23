json.extract! area,
              :id,
              :name
json.barns area.barns do |barn|
  json.id barn.id
  json.name barn.name
end
