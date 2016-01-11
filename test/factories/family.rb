Factory.define :family do |f|
  f.user_id { Factory(:user).id }
  f.family_name 'Rey%d'
  f.members_under2 '%d'
  f.members_2to5 '%d'
  f.members_6to12 '%d'
  f.members_13to17 '%d'
  f.members_over18 '2'
end
