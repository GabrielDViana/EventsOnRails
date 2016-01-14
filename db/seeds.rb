# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# categorias = [ 'Arquitetura', 'Arte e Cultura',
# 'Biologia e Ciências da Vida', 'Negócios e Administração', 'Química',
# 'Comunicação', 'Estatística', 'Design', 'Economia e Finanças', 'Educação',
# 'Engenharia', 'Tecnologia', 'Meio Ambiente e Desenvolvimento Sustentável',
# 'Nutrição e Gastronomia', 'Corpo e Saúde', 'História', 'Línguas', 'Direito',
# 'Literatura', 'Matemática', 'Medicina', 'Música', 'Física', 'Ciências Sociais',
# 'Moda', 'Beleza', 'Curiosidades' ]

ActsAsTaggableOn::Tag.create!([ { name: 'Arquitetura' },
{ name: 'Arte e Cultura'}, { name: 'Biologia e Ciências da Vida'},
{ name: 'Negócios e Administração'}, { name: 'Química'}, { name: 'Comunicação'},
{ name: 'Estatística'}, { name: 'Design'}, { name: 'Economia e Finanças'},
{ name: 'Educação'}, { name: 'Engenharia'}, { name: 'Tecnologia'},
{ name: 'Meio Ambiente e Desenvolvimento Sustentável'},
{ name: 'Nutrição e Gastronomia'}, { name: 'Corpo e Saúde'}, { name: 'História'},
{ name: 'Línguas'}, { name: 'Direito'}, { name: 'Literatura'},
{ name: 'Matemática'}, { name: 'Medicina'}, { name: 'Música'},
{ name: 'Física'}, { name: 'Ciências Sociais'}, { name: 'Moda'},
{ name: 'Beleza'}, { name: 'Curiosidades'}])
