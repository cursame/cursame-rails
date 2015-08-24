# coding: utf-8
Role.create! title: "student", description: "estudiante de una red"
Role.create! title: "teacher", description: "profesor de una red"
Role.create! title: "mentor_link", description: "enlace educativo de una entidad"
Role.create! title: "operator", description: "operador de una red"
Role.create! title: "admin", description: "administrador de una red"
Role.create! title: "superadmin", description: "superadmin del sistema"

Phase.create! name: "Preparación del ambiente", order: 1
Phase.create! name: "Selección y acercamiento", order: 2
Phase.create! name: "Formación- Módulo 1", order: 3
Phase.create! name: "Formación - Módulo 2", order: 4
Phase.create! name: "Acompañamiento", order: 5
