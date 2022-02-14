3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts '3 topics created!'

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget lectus pharetra justo laoreet suscipit in id justo. Suspendisse volutpat efficitur est, et eleifend risus convallis non. Donec mattis lacus ac bibendum tempus. Vivamus sagittis felis ligula, quis semper ex facilisis vitae. Nunc sapien dolor, ullamcorper eget posuere sed, commodo in massa. Donec interdum erat ac dui congue aliquam. Integer eu tempor purus. Sed erat ex, scelerisque id justo non, dictum mattis sem. Quisque sagittis, leo facilisis laoreet vehicula, purus ante ornare erat, quis malesuada nisl augue sit amet magna. Phasellus eget interdum lorem. Nullam ipsum dolor, malesuada id congue ac, viverra elementum ante. Morbi mollis auctor facilisis.",
    topic_id: Topic.last.id,
  )
end

puts '10 blog posts created!'

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: rand(1..100),
    badge: "http://via.placeholder.com/250x250"
  )
end

puts '5 skills created!'

8.times do |portfolio|
  Portfolio.create!(
    title: "Portfolio #{portfolio}",
    subtitle: 'Ruby on Rails',
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget lectus pharetra justo laoreet suscipit in id justo. Suspendisse volutpat efficitur est, et eleifend risus convallis non. Donec mattis lacus ac bibendum tempus. Vivamus sagittis felis ligula, quis semper ex facilisis vitae. Nunc sapien dolor, ullamcorper eget posuere sed, commodo in massa.",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200",
  )
end

Portfolio.create!(
    title: "Portfolio 9",
    subtitle: 'React',
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget lectus pharetra justo laoreet suscipit in id justo. Suspendisse volutpat efficitur est, et eleifend risus convallis non. Donec mattis lacus ac bibendum tempus. Vivamus sagittis felis ligula, quis semper ex facilisis vitae. Nunc sapien dolor, ullamcorper eget posuere sed, commodo in massa.",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200",
)

puts '9 Portfolios created!'

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts '3 Technologies created!'

