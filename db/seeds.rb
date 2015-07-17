# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

if !Phase.find_by_order 1
  Phase.create name: "Preparación del ambiente",
               order: 1
end

if !Phase.find_by_order 2
  Phase.create name: "Selección y acercamiento",
               order: 2
end

if !Phase.find_by_order 3
  Phase.create name: "Formación- Módulo 1",
               order: 3
end

if !Phase.find_by_order 4
  Phase.create name: "Formación - Módulo 2",
               order: 4
end

if !Phase.find_by_order 5
  Phase.create name: "Acompañamiento",
               order: 5
end

if !Role.find_by_title "operator"
  Role.create title: "operator",
              description: "operador de una red"
end

if !Role.find_by_title "mentor_link"
  Role.create title: "mentor_link",
              description: "enlace educativo de una entidad"
end
