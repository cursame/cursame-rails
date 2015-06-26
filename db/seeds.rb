# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

if !Role.find_by_title "operator"
  Role.create title: "operator",
              description: "operador de una red"
end
